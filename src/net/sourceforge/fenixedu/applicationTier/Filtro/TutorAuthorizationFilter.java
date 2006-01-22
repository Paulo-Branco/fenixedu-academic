/*
 * Created on 20/Jan/2005
 *  
 */
package net.sourceforge.fenixedu.applicationTier.Filtro;

import java.util.List;

import net.sourceforge.fenixedu.applicationTier.IUserView;
import net.sourceforge.fenixedu.applicationTier.Filtro.exception.NotAuthorizedFilterException;
import net.sourceforge.fenixedu.domain.Teacher;
import net.sourceforge.fenixedu.domain.person.RoleType;
import net.sourceforge.fenixedu.persistenceTier.IPersistentTeacher;
import net.sourceforge.fenixedu.persistenceTier.IPersistentTutor;
import pt.utl.ist.berserk.ServiceRequest;
import pt.utl.ist.berserk.ServiceResponse;

/**
 * @author joaosa and rmalo
 *  
 */
public class TutorAuthorizationFilter extends AuthorizationByRoleFilter {

    public final static TutorAuthorizationFilter instance = new TutorAuthorizationFilter();

    public static Filtro getInstance() {
        return instance;
    }

   
    protected RoleType getRoleType() {
        return RoleType.TEACHER;
    }

    public void execute(ServiceRequest request, ServiceResponse response) throws Exception {
        IUserView id = getRemoteUser(request);
        Object[] argumentos = getServiceCallArguments(request);

        if ((id == null) || (id.getRoles() == null)
                || !AuthorizationUtils.containsRole(id.getRoles(), getRoleType())
                || !isTutor(id, argumentos)) {
            throw new NotAuthorizedFilterException();
        }
    }

    /**
     * @param id
     * @param argumentos
     * @return
     */
    private boolean isTutor(IUserView id, Object[] argumentos) {
        if (argumentos == null) {
            return false;
        }
        if(argumentos[0] == null)return false;	

        try {
            IPersistentTutor persistentTutor = persistentSupport.getIPersistentTutor();
            IPersistentTeacher persistentTeacher = persistentSupport.getIPersistentTeacher();
            
            Teacher teacher = persistentTeacher.readTeacherByUsername((String) argumentos[0]);

            List tutorStudents = persistentTutor.readStudentsByTeacher(teacher.getIdInternal(), teacher.getTeacherNumber());
            
            if (tutorStudents == null) {
            	 return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}