<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<tiles:insert page="/fenixLayout_2col.jsp" flush="true">
  <tiles:put name="title" value="&Aacute;rea de Funcionário" />
  <tiles:put name="serviceName" value="&Aacute;rea de Funcionário" />
  <tiles:put name="navLocal" value="/employee/mainMenu.jsp" />
  <tiles:put name="navGeral" value="/employee/commonNavGeralEmployee.jsp" />
  <tiles:put name="body-context" value="/commons/blank.jsp"/>  
  <tiles:put name="body" value="/assiduousness/consultarFuncionarioMostrar_bd.jsp" />
  <tiles:put name="footer" value="/copyright.jsp" />
</tiles:insert>