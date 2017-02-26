package org.fenixedu.academic.domain;

public class ExecutionCourseGradeSubmissionBlock extends ExecutionCourseGradeSubmissionBlock_Base {
    
    public ExecutionCourseGradeSubmissionBlock() {
        super();
    }

    public ExecutionCourseGradeSubmissionBlock(String reason) {
        setReason(reason);
    }

    public void delete() {
        setExecutionCourse(null);
        deleteDomainObject();
    }
    
}
