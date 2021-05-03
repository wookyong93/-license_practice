<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" import="java.util.*,java.text.*"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	String toDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
<style>
	header {
		text-align: center;
		background-color: skyblue;
		color:white;
		padding: 3px;
		margin: 0px;
	}
	nav{
		background-color:#8977AB;
		padding: 0px;
		margin: 0px;
	}
	ul{
		margin: 0px;
		padding: 10px;
	}
	li{
		margin-left:20px;
		list-style-type: none;
		display: inline-block;
	}
	section{
		text-align: cetner;
		height: 500px;
		background-color: silver;
		padding: 3px;
		margin: 0px;
	}
	footer{
		background-color:skyblue;
		text-align: center;
		color:white;
		padding: 10px;
		margin: 0px;
	}
	h3{
		text-align: center;
	}
	footer{
		text-align: center; 
	}
	a{
		text-decoration: none;
		color: white;
	}
	a:hover{
		text-decoration: none;
	}
	a:focus{
		text-decoration: none;
	}
	table,tr,th,td{
		margin:0 auto;
		text-align: center;
		border: 1px solid black;
		border-collapse: collapse;
	}
	th{
		text-align: center;
	}
	th,td{
		padding:2px;
	}
	td input[type=button]{
		text-align: center;
	}
</style>
</head>

<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav>
		<ul>
			<li><a href="${contextPath}/member/joinForm.do">회원등록</a></li>
			<li><a href="${contextPath}/member/listMember.do">회원목록조회/수정</a></li>
			<li><a href="${contextPath}/member/moneyList.do">회원매출 조회</a></li>
			<li><a href="${contextPath }/index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h3>회원 매출 정보</h3>
		<table>
			<tr>
				<th width="10%">회원 번호</th>
				<th width="10%">회원 성명</th>
				<th width="10%">고객 등급</th>
				<th width="10%">구매 금액</th>
			</tr>
		<c:forEach var="member" items="${moneyList}">
			<tr>
				<td>${member.custno}</td>
				<td>${member.custname}</td>
			<c:choose>
					<c:when test="${member.grade == 'A'}">
						<td>VIP</td>
					</c:when>
					<c:when test="${member.grade == 'B' }">
						<td>일반</td>
					</c:when>
					<c:when test="${member.grade == 'C' }">
						<td>직원</td>
					</c:when>
			</c:choose>
				<td>${member.price}</td>
			</tr>
		</c:forEach>
		</table>
	</section>
	<footer>
		HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resource Development Service of Korea.
	</footer>
</body>
</html>