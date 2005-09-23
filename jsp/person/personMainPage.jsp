<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<tiles:insert page="/fenixLayout_2col.jsp" flush="true">
  <tiles:put name="title" value="�rea Pessoal" />
  <tiles:put name="serviceName" value="�rea Pessoal" />
  <tiles:put name="navLocal" value="/person/mainMenu.jsp" />
  <tiles:put name="navGeral" value="/person/commonNavGeralPerson.jsp" />
  <tiles:put name="body-context" value="/common/blank.jsp"/>  
  <tiles:put name="body" value="/person/welcomeScreen.jsp" />
  <tiles:put name="footer" value="/copyright.jsp" />
</tiles:insert>

