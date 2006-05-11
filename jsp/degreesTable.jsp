<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<bean:define id="degreeType" type="java.lang.String" toScope="request">
	<bean:write name="degreeType"/>
</bean:define>

<bean:define id="renderBolonha" type="java.lang.String" toScope="request">
	<bean:write name="renderBolonha"/>
</bean:define>

&nbsp;&nbsp;<h3><bean:message key="<%= degreeType.toString() %>" bundle="ENUMERATION_RESOURCES"/> :</h3>
<BR/>

<TABLE>
	
	<logic:iterate id="degree" name="degrees" type="net.sourceforge.fenixedu.domain.Degree">
		<logic:equal name="degree" property="degreeType" value="<%= degreeType.toString() %>">
			<%if (renderBolonha.equals("false") || (renderBolonha.equals("true") && degree.isBolonhaDegree())) { %>
				<bean:define id="degreeCode" name="degree" property="sigla"/>
				<bean:define id="degreeName" name="degree" property="nome"/>
				<TR>
					<TD>
						<html:link href="<%= degreeCode.toString() %>" title="<%= degreeName.toString() %>"><bean:write name="degree" property="sigla"/></html:link>
					</TD>
					<TD>
						<html:link href="<%= degreeCode.toString() + "/disciplinas"%>">
							<bean:message key="courseSite.url.subpattern" bundle="GLOBAL_RESOURCES"/>
						</html:link>
					</TD>
					<TD>
						<html:link href="<%= degreeCode.toString() + "/horarios"%>">
							<bean:message key="schedules.url.subpattern" bundle="GLOBAL_RESOURCES"/>
						</html:link>
					</TD>
					<TD>
						<html:link href="<%= degreeCode.toString() + "/exames"%>">
							<bean:message key="exams.url.subpattern" bundle="GLOBAL_RESOURCES"/>
						</html:link>
					</TD>
				</TR>
			<% } %>
		</logic:equal>
	</logic:iterate>

</TABLE>
