<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:if test="${sessionScope.objUsuario == null}">
	<c:set var="mensaje" value="Debe autenticarse para ingresar al sistema" scope="request"/>
	<jsp:forward page="/WEB-INF/vistas/intranetLogin.jsp" />
</c:if>

