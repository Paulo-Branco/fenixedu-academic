<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<html:xhtml/>

<ul>
	<li>
		<html:link page="<%= "/index.do" %>">
			<bean:message key="link.website.listSites"/>
		</html:link>
	</li>
</ul>