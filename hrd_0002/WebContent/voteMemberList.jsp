<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원 투표 프로그램 ver 2020-05</title>
<style>
	header {
		background-color: skyblue;
		margin: 0px;
		padding: 15px;
	}
	header h3{
		text-align: center;
	}
	nav{
		height: 50px;
		background-color: orange;
		padding: 5px;
		margin: 0px; 
	}
	ul {
		margin-bottom: 10px;
	}
	ul li{
		list-style: none;
		margin-left: 20px;
		float:left;
	}
	a {
		color:white;
		font-weight: bold;
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}
	section{
		clear:both;
		height: 400px;
		background-color: silver;
		margin-top: 0px;
		padding: 10px;
		text-align: center;
	}
	footer{
		text-align: center;
		color:white;
		padding: 5px;
		height: 50px;
		background-color: skyblue;
		margin: 0px;
	}
	table{
		margin: 0 auto;
	}
	th,td{
		padding: 5px;
		text-align: center;
	}
	table,td,tr,th{
		border:1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<header>
		<h3>(과정평가형 정보처리 산업기사) 지역구의원투표 프로그램 ver 2020-05</h3>
	</header>
	<nav>
		<ul>
			<li><a href="/hrd_0002/vote/voteMemberList.do">후보조회</a></li>
			<li><a href="/hrd_0002/voteForm.jsp">투표하기</a></li>
			<li><a href="/hrd_0002/vote/voteInfo.do">투표검수조회</a></li>
			<li><a href="/hrd_0002/vote/voterank.do">후보자등수</a></li>
			<li><a href="/hrd_0002/index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h3>후보조회</h3>
		<table>
			<tr>	
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>		
			</tr>
			<c:forEach var ="mem" items="${memberList}">
			<tr>
				<td>${mem.m_no}</td>
				<td>${mem.m_name}</td>
				<td>${mem.p_name}</td>
				<c:if test="${mem.p_school == '1'}">
				<td>고졸</td>
				</c:if>
				<c:if test="${mem.p_school == '2'}">
				<td>학사</td>
				</c:if>
				<c:if test="${mem.p_school == '3'}">
				<td>석사</td>
				</c:if>
				<c:if test="${mem.p_school == '4'}">
				<td>박사</td>
				</c:if>
				<td>${mem.m_jumin}</td>
				<td>${mem.m_city}</td>
				<td>${mem.p_tel1}-${mem.p_tel2}-${mem.p_tel3}</td>
			</tr>			
			</c:forEach>
		</table>
	</section>
	<footer>
		<h3>HRDKOREA Copyrightⓒ2015 All right reserved Human Resources Development Server of Korea</h3>
	</footer>
</body>
</html>
</html>