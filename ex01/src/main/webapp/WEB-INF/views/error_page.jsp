<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<h3><c:out value="${exception.getMessage() }"></c:out></h3>
	<ul>
		<c:forEach var="stack" items="${exception.getStackTrace() }">
		<li><c:out value="${stack }"></c:out></li>
		</c:forEach>
	</ul>
</body>
</html>