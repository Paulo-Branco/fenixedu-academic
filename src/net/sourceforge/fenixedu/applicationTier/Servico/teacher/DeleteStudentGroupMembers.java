/*
 * Created on 23/Ago/2003
 *
 */
package net.sourceforge.fenixedu.applicationTier.Servico.teacher;

import java.util.List;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.InvalidArgumentsServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.InvalidSituationServiceException;
import net.sourceforge.fenixedu.applicationTier.strategy.groupEnrolment.strategys.GroupEnrolmentStrategyFactory;
import net.sourceforge.fenixedu.applicationTier.strategy.groupEnrolment.strategys.IGroupEnrolmentStrategy;
import net.sourceforge.fenixedu.applicationTier.strategy.groupEnrolment.strategys.IGroupEnrolmentStrategyFactory;
import net.sourceforge.fenixedu.domain.Attends;
import net.sourceforge.fenixedu.domain.Grouping;
import net.sourceforge.fenixedu.domain.StudentGroup;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;
import net.sourceforge.fenixedu.persistenceTier.ISuportePersistente;
import net.sourceforge.fenixedu.persistenceTier.PersistenceSupportFactory;
import net.sourceforge.fenixedu.applicationTier.Service;

/**
 * @author asnr and scpo
 * @author joaosa and rmalo 31/Ago/2004
 */

public class DeleteStudentGroupMembers extends Service {

    public boolean run(Integer executionCourseID, Integer studentGroupID, Integer groupPropertiesID,
            List studentUsernames) throws FenixServiceException, ExcepcaoPersistencia {

        final ISuportePersistente persistentSupport = PersistenceSupportFactory
                .getDefaultPersistenceSupport();

        final StudentGroup studentGroup = (StudentGroup) persistentSupport.getIPersistentObject().readByOID(
                StudentGroup.class, studentGroupID);
        if (studentGroup == null) {
            throw new InvalidArgumentsServiceException();
        }

        final Grouping grouping = studentGroup.getGrouping();
        final IGroupEnrolmentStrategyFactory enrolmentGroupPolicyStrategyFactory = GroupEnrolmentStrategyFactory
                .getInstance();
        final IGroupEnrolmentStrategy strategy = enrolmentGroupPolicyStrategyFactory
                .getGroupEnrolmentStrategyInstance(grouping);

        if (!strategy.checkStudentsUserNamesInGrouping(studentUsernames, grouping)) {
            throw new InvalidArgumentsServiceException();
        }

        if (!studentGroup.checkStudentUsernames(studentUsernames)) {
            throw new InvalidSituationServiceException();
        }
        for (final String studentUsername : (List<String>) studentUsernames) {
            Attends attend = grouping.getStudentAttend(studentUsername);
            attend.removeStudentGroups(studentGroup);
        }
        return true;
    }
}