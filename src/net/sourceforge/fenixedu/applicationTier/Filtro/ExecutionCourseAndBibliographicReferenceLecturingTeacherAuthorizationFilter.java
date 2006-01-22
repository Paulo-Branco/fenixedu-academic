/*
 * Created on 19/Mai/2003
 * 
 *  
 */
package net.sourceforge.fenixedu.applicationTier.Filtro;

import java.util.Iterator;

import net.sourceforge.fenixedu.applicationTier.IUserView;
import net.sourceforge.fenixedu.applicationTier.Filtro.exception.NotAuthorizedFilterException;
import net.sourceforge.fenixedu.domain.BibliographicReference;
import net.sourceforge.fenixedu.domain.ExecutionCourse;
import net.sourceforge.fenixedu.domain.Professorship;
import net.sourceforge.fenixedu.domain.Teacher;
import net.sourceforge.fenixedu.domain.person.RoleType;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;
import net.sourceforge.fenixedu.persistenceTier.IPersistentTeacher;
import pt.utl.ist.berserk.ServiceRequest;
import pt.utl.ist.berserk.ServiceResponse;

/**
 * @author Jo�o Mota
 * 
 */
public class ExecutionCourseAndBibliographicReferenceLecturingTeacherAuthorizationFilter extends
        AuthorizationByRoleFilter {

    public ExecutionCourseAndBibliographicReferenceLecturingTeacherAuthorizationFilter() {

    }

    protected RoleType getRoleType() {
        return RoleType.TEACHER;
    }

    public void execute(ServiceRequest request, ServiceResponse response) throws Exception {
        IUserView id = getRemoteUser(request);
        Object[] arguments = getServiceCallArguments(request);
        if ((id == null) || (id.getRoles() == null)
                || !AuthorizationUtils.containsRole(id.getRoles(), getRoleType())
                || !bibliographicReferenceBelongsToTeacherExecutionCourse(id, arguments)) {
            throw new NotAuthorizedFilterException();
        }
    }

    private boolean bibliographicReferenceBelongsToTeacherExecutionCourse(IUserView id, Object[] args) {
        if (args == null)
            return false;

        boolean result = false;
        try {
            final IPersistentTeacher persistentTeacher = persistentSupport.getIPersistentTeacher();

            final Integer bibliographicReferenceID = getBibliographicReference(args);
            final BibliographicReference bibliographicReference = (BibliographicReference) persistentObject
                    .readByOID(BibliographicReference.class, bibliographicReferenceID);
            final Teacher teacher = persistentTeacher.readTeacherByUsername(id.getUtilizador());

            if (bibliographicReference != null && teacher != null) {
                final ExecutionCourse executionCourse = bibliographicReference.getExecutionCourse();
                final Iterator associatedProfessorships = teacher.getProfessorshipsIterator();
                // Check if Teacher has a professorship to ExecutionCourse BibliographicReference
                while (associatedProfessorships.hasNext()) {
                    Professorship professorship = (Professorship) associatedProfessorships.next();
                    if (professorship.getExecutionCourse().equals(executionCourse)) {
                        result = true;
                        break;
                    }
                }
            }
        } catch (ExcepcaoPersistencia e) {
            result = false;
        }
        return result;
    }

    private Integer getBibliographicReference(Object[] args) {
        return (Integer) args[0];
    }
}