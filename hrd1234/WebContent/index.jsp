<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
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
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h3>쇼핑몰 회원관리 프로그램</h3>
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
		프로그램 작성 순서<br>
		1. 회원정보 테이블을 생성한다.<br>
		2. 매출정보 테이블을 생성한다.<br>
		3. 회원정보. 매출정보 테이블에서 제시된 문제지의 참조 데이터를 추가 생성한다.<br>
		4. 회원정보 입력 화면프로그램을 작성한다.<br>
		5. 회원정보 조회 프로그램을 작성한다.<br>
		6. 회원매출 정보 조회 프로그램을 작성한다.<br>
	</section>
	<footer>
		HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resource Development Service of Korea.
	</footer>
</body>
</html>