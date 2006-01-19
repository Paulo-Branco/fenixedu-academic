/*
 * Created on 24/Set/2003
 */

package net.sourceforge.fenixedu.applicationTier.Servico.teacher.onlineTests;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.InvalidArgumentsServiceException;
import net.sourceforge.fenixedu.dataTransferObject.comparators.CalendarDateComparator;
import net.sourceforge.fenixedu.dataTransferObject.comparators.CalendarHourComparator;
import net.sourceforge.fenixedu.domain.onlineTests.Metadata;
import net.sourceforge.fenixedu.domain.onlineTests.Question;
import net.sourceforge.fenixedu.domain.onlineTests.StudentTestQuestion;
import net.sourceforge.fenixedu.domain.onlineTests.TestQuestion;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;
import net.sourceforge.fenixedu.persistenceTier.ISuportePersistente;
import net.sourceforge.fenixedu.persistenceTier.PersistenceSupportFactory;

import org.apache.struts.util.LabelValueBean;

import net.sourceforge.fenixedu.applicationTier.Service;

/**
 * @author Susana Fernandes
 */
public class DeleteExerciseVariation extends Service {

    public List<LabelValueBean> run(Integer executionCourseId, Integer questionCode) throws ExcepcaoPersistencia, InvalidArgumentsServiceException {
        final ISuportePersistente persistentSuport = PersistenceSupportFactory.getDefaultPersistenceSupport();
        List<LabelValueBean> result = new ArrayList<LabelValueBean>();

        Question question = (Question) persistentSuport.getIPersistentQuestion().readByOID(Question.class, questionCode);
        if (question == null) {
            throw new InvalidArgumentsServiceException();
        }

        for (StudentTestQuestion studentTestQuestion : question.getStudentTestsQuestions()) {
            if (compareDates(studentTestQuestion.getDistributedTest().getEndDate(), studentTestQuestion.getDistributedTest().getEndHour())) {
                result.add(new LabelValueBean(studentTestQuestion.getDistributedTest().getTitle(), studentTestQuestion.getStudent().getNumber()
                        .toString()));
            }
        }

        if (result.size() == 0) {
            Question newQuestion = getNewQuestion(question);
            for (TestQuestion testQuestion : question.getTestQuestions()) {
                if (newQuestion == null) {
                    testQuestion.getTest().deleteTestQuestion(testQuestion);
                } else {
                    testQuestion.setQuestion(getNewQuestion(question));
                }
            }
            Metadata metadata = question.getMetadata();
            if (question.getStudentTestsQuestions() == null || question.getStudentTestsQuestions().size() == 0) {
                question.delete();
                if (persistentSuport.getIPersistentMetadata().getNumberOfQuestions(metadata) <= 1) {
                    persistentSuport.getIPersistentMetadata().deleteByOID(Metadata.class, metadata.getIdInternal());
                } else if (metadata.getVisibleQuestions().size() == 0) {
                    metadata.setVisibility(new Boolean(false));
                }
            } else {
                if (metadata.getVisibleQuestions().size() <= 1) {
                    metadata.setVisibility(new Boolean(false));
                }
                question.setVisibility(new Boolean(false));
            }
        }

        return result;
    }

    private boolean compareDates(Calendar date, Calendar hour) {
        final Calendar calendar = Calendar.getInstance();
        final CalendarDateComparator dateComparator = new CalendarDateComparator();
        final CalendarHourComparator hourComparator = new CalendarHourComparator();
        if (dateComparator.compare(calendar, date) <= 0) {
            if (dateComparator.compare(calendar, date) == 0) {
                if (hourComparator.compare(calendar, hour) <= 0) {
                    return true;
                }

                return false;
            }
            return true;
        }
        return false;
    }

    private Question getNewQuestion(Question oldQuestion) {
        Metadata metadata = oldQuestion.getMetadata();
        if (metadata.getVisibleQuestions().size() > 1) {
            for (Question question : metadata.getVisibleQuestions()) {
                if (question.equals(oldQuestion)) {
                    return question;
                }
            }
        }
        return null;
    }
}