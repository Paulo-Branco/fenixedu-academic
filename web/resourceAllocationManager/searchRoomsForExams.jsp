<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<tiles:insert definition="df.layout.two-column" beanName="" flush="true">
  <tiles:put name="title" value="SOP" />
  <tiles:put name="serviceName" value="Servi�o de Organiza��o Pedag�gica" />
  <tiles:put name="navGeral" value="/resourceAllocationManager/commonNavGeralSopExam.jsp" />
  <tiles:put name="navLocal" value="/resourceAllocationManager/commonNavLocalExamsSop.jsp" />
  <tiles:put name="body-context" value="/commons/blank.jsp"/>  
  <tiles:put name="body" value="/resourceAllocationManager/searchRoomsForExams_bd.jsp" />
  <tiles:put name="footer" value="/copyright.jsp" />
</tiles:insert>