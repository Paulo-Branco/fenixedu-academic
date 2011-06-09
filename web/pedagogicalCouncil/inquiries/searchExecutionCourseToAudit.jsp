<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>
<html:xhtml />

<em><bean:message key="pedagogical.council" bundle="PEDAGOGICAL_COUNCIL"/></em>
<h2><bean:message key="title.inquiry.quc.auditProcesses" bundle="INQUIRIES_RESOURCES"/></h2>

<bean:define id="executionSemester" name="executionCourseSearchBean" property="executionPeriod"/>
<h3>
	<bean:message key="label.inquiry.audit.processes" bundle="INQUIRIES_RESOURCES"/>
	(<bean:write name="executionSemester" property="semester"/>� Semestre <bean:write name="executionSemester" property="executionYear.year"/>)
</h3>

<logic:present name="success">
	<span class="success0"><bean:message key="label.inquiry.audit.process.success" bundle="INQUIRIES_RESOURCES"/></span>
</logic:present>
<logic:notEmpty name="executionCoursesAudits">
	<fr:view name="executionCoursesAudits">
		<fr:schema bundle="INQUIRIES_RESOURCES" type="net.sourceforge.fenixedu.domain.inquiries.ExecutionCourseAudit">
			<fr:slot name="executionCourse.name" key="label.executionCourse.name" bundle="APPLICATION_RESOURCES"/>
			<fr:slot name="teacherAuditor.person.name" key="teacher.docente" bundle="APPLICATION_RESOURCES"/>
			<fr:slot name="studentAuditor.person.name" key="student" bundle="APPLICATION_RESOURCES"/>
			<fr:slot name="approvedByTeacher" key="label.inquiry.audit.approvedByTeacher" layout="boolean-icon">
				<fr:property name="nullAsFalse" value="true"/>
			</fr:slot>
			<fr:slot name="approvedByStudent" key="label.inquiry.audit.approvedByStudent" layout="boolean-icon">
				<fr:property name="nullAsFalse" value="true"/>
			</fr:slot>
		</fr:schema>
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle1 thlight mtop1"/>
			<fr:property name="columnClasses" value=",,,acenter, acenter, "/>
			<fr:property name="linkFormat(view)" value="/qucAudit.do?method=viewProcessDetails&executionCourseAuditOID=${externalId}"/>
			<fr:property name="key(view)" value="link.inquiry.auditProcess" />
			<fr:property name="bundle(view)" value="INQUIRIES_RESOURCES" />
			<fr:property name="linkFormat(edit)" value="/qucAudit.do?method=prepareSelectPersons&executionCourseOID=${executionCourse.externalId}"/>
			<fr:property name="key(edit)" value="link.inquiry.editAuditors" />
			<fr:property name="bundle(edit)" value="INQUIRIES_RESOURCES" />
		</fr:layout>
	</fr:view>
</logic:notEmpty>
<logic:empty name="executionCoursesAudits">
	<em>N�o existem processos criados.</em>
</logic:empty>

<h3>
	Pesquisar UC Execu��o
	(<bean:write name="executionSemester" property="semester"/>� Semestre <bean:write name="executionSemester" property="executionYear.year"/>)
</h3>

<fr:form action="/qucAudit.do?method=searchExecutionCourse">		
	<fr:edit id="executionCourseSearchBean" name="executionCourseSearchBean">
		<fr:schema type="net.sourceforge.fenixedu.dataTransferObject.inquiries.ExecutionCourseQucAuditSearchBean" bundle="APPLICATION_RESOURCES">
			<fr:slot name="executionPeriod" key="label.executionPeriod" layout="menu-select-postback" validator="pt.ist.fenixWebFramework.renderers.validators.RequiredValidator">
				<fr:property name="providerClass" value="net.sourceforge.fenixedu.presentationTier.Action.departmentMember.ViewQUCResultsDA$ExecutionSemesterQucProvider" />
				<fr:property name="format" value="${semester}� Semestre ${executionYear.year}" />
			</fr:slot>
			<fr:slot name="executionDegree" key="label.executionDegree" layout="menu-select">
				<fr:property name="providerClass" value="net.sourceforge.fenixedu.presentationTier.renderers.providers.ExecutionDegree1stAnd2ndCycleProviderForExecutionCourseSearchBean" />
				<fr:property name="format" value="${presentationName}" />
				<fr:property name="defaultText" value="label.inquiry.executionCoursesToImprove"/>
				<fr:property name="key" value="true" />
				<fr:property name="bundle" value="INQUIRIES_RESOURCES" />
			</fr:slot>
		</fr:schema>
		<fr:layout name="tabular" >
			<fr:property name="classes" value="tstyle5 thlight thright"/>
		</fr:layout>
	</fr:edit>
	<html:submit><bean:message key="button.submit"/></html:submit>
</fr:form>

<logic:present name="executionCourses">
	<fr:view name="executionCourses">
		<fr:schema bundle="APPLICATION_RESOURCES" type="net.sourceforge.fenixedu.domain.ExecutionCourse">
			<fr:slot name="nome" key="label.executionCourse.name"/>
		</fr:schema>
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle1"/>
   	    	<fr:property name="columnClasses" value=",,noborder"/>
			<fr:property name="linkFormat(create)" value="/qucAudit.do?method=prepareSelectPersons&executionCourseOID=${externalId}"/>
			<fr:property name="key(create)" value="label.create" />
			<fr:property name="bundle(create)" value="APPLICATION_RESOURCES" />
			<fr:property name="visibleIfNot(create)" value="hasExecutionCourseAudit" />
			<fr:property name="linkFormat(view)" value="/qucAudit.do?method=viewProcessDetails&executionCourseAuditOID=${executionCourseAudit.externalId}"/>
			<fr:property name="key(view)" value="link.inquiry.auditProcess" />
			<fr:property name="bundle(view)" value="INQUIRIES_RESOURCES" />
			<fr:property name="visibleIf(view)" value="hasExecutionCourseAudit" />
		</fr:layout>
	</fr:view>
</logic:present>
