<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <!-- only admin -->
    <h3>sample/admin</h3>
    
    <p>Principal : <sec:authentication property="principal" />
    <p>Principal : <sec:authentication property="principal.Username" />

    <p><a href="/customLogout">Logout</a></p>
</body>

</html>