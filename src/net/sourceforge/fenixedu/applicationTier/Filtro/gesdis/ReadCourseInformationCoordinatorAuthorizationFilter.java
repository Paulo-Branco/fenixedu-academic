/*
 * Created on 14/Nov/2003
 *  
 */
package net.sourceforge.fenixedu.applicationTier.Filtro.gesdis;

import java.util.List;

import net.sourceforge.fenixedu.applicationTier.IUserView;
import net.sourceforge.fenixedu.applicationTier.Filtro.framework.DomainObjectAuthorizationFilter;
import net.sourceforge.fenixedu.domain.ExecutionCourse;
import net.sourceforge.fenixedu.domain.Teacher;
import net.sourceforge.fenixedu.domain.person.RoleType;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;
import net.sourceforge.fenixedu.persistenceTier.IPersistentExecutionDegree;
import net.sourceforge.fenixedu.persistenceTier.IPersistentTeacher;

/**
 * @author Leonor Almeida
 * @author Sergio Montelobo
 *  
 */
public class ReadCourseInformationCoordinatorAuthorizationFilter extends DomainObjectAuthorizationFilter {
    /*
     * (non-Javadoc)
     * 
     * @see ServidorAplicacao.Filtro.framework.DomainObjectTeacherAuthorizationFilter#domainObjectBelongsToTeacher(ServidorAplicacao.IUserView,
     *      java.lang.Integer)
     */
    protected boolean verifyCondition(IUserView id, Integer objectId) {
        try {
            IPersistentTeacher persistentTeacher = persistentSupport.getIPersistentTeacher();
            IPersistentExecutionDegree persistentExecutionDegree = persistentSupport.getIPersistentExecutionDegree();

            Teacher teacher = persistentTeacher.readTeacherByUsername(id.getUtilizador());
            ExecutionCourse executionCourse = (ExecutionCourse) persistentObject.readByOID(
                    ExecutionCourse.class, objectId);
            List executionDegrees = persistentExecutionDegree.readByExecutionCourseAndByTeacher(
                    executionCourse.getIdInternal(), teacher.getIdInternal());

            return !executionDegrees.isEmpty();
        } catch (ExcepcaoPersistencia e) {
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see ServidorAplicacao.Filtro.framework.DomainObjectAuthorizationFilter#getRoleType()
     */
    protected RoleType getRoleType() {
        return RoleType.COORDINATOR;
    }
}