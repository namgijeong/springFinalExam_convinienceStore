<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div id="header">
    <div id="header_section1">
        <div id="header_logo"></div>
        <div id="header_title">Convenience Store</div>
        <div id="account_menu">
	    <c:choose>
			<c:when test="${isLogin eq 'true'}">
				<a href="${path}/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="${path}/login">로그인</a>
			</c:otherwise>
		</c:choose> 
            
            <a href="${path}/mypage">마이페이지</a>
        <c:choose>
			<c:when test="${memberType eq 2}">
				<a href="${path}/admin_dailycost">관리자페이지</a>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose> 
            
        </div>
    </div>
    
    <div id="header_section2">
        <div id="food_category">
            <a href="${path}/buy_k_noodle">라면</a>
            <a href="${path}/buy_rice">밥</a>
            <a href="${path}/buy_snack">과자</a>
            <a href="${path}/buy_beverage">음료수</a>
            <a href="${path}/buy_icecream">아이스크림</a>
        </div>
    </div>

</div>