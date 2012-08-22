<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<tiles:insert definition="df.layout.two-column-photo" beanName="" flush="true">
  <tiles:put name="title" value="SOP" />
  <tiles:put name="serviceName" value="SOP - Servi�o de Organiza��o Pedag�gica" />
  <tiles:put name="navGeral" value="/commons/commonGeneralNavigationBar.jsp" />
  <tiles:put name="photos" value="/resourceAllocationManager/commonEntrPhotosSop.jsp" />
  <tiles:put name="body" value="/resourceAllocationManager/escolherContexto_bd.jsp" />
  <tiles:put name="body-context" value="/commons/blank.jsp" />  
  <tiles:put name="footer" value="/copyright.jsp" />
  <tiles:put name="context" value="/commons/context.jsp" />
</tiles:insert>