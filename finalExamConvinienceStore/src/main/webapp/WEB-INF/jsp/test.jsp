<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:choose>
		<c:when test="${id!=null }">
			welcome ${id }
		</c:when>
		<c:otherwise>
			wrong id/password
		</c:otherwise>
	</c:choose> 
	
</body>
</html>