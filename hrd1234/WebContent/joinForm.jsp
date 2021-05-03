<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" import="java.util.*,java.text.*"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	table{
		margin:0 auto;
		text-align: center;
	}
	th{
		text-align: left;
	}
	td input[type=button]{
		text-align: center;
	}
</style>
</head>
<script>
	function frmcheck(){
		var frm = document.frm;
		var custname = frm.custname;
		var phone = frm.phone;
		var address = frm.address;
		var grade = frm.grade;
		var city = frm.city;
		if(custname.value==""){
			alert('회원 성명이 입력되지 않았습니다.');
			custname.focus();
		}else if(phone.value == ""){
			alert('회원 전화가 입력되지 않았습니다.');
			phone.focus();
		}else if(address.value==""){
			alert('회원 주소가 입력되지 않았습니다.');
			address.focus();
		}else if(grade.value==""){
			alert('회원 등급이 입력되지 않았습니다.');
			grade.focus();
		}else if(!(grade.value =='A' | grade.value =='B' | grade.value =='C')){
			alert('고객 등급이 잘못입력되었습니다.');
			grade.value="";
			grade.focus();
		}else if(city.value==""){
			alert('도시 코드가 입력되지 않았습니다.');
			city.focus();
		}else if(city.value.length != 2){
			alert('도시코드는 숫자 2글자로 적어주세요');
			city.value="";
			city.focus();
		}else{
			alert('회원정보가 저장되었습니다.');
			frm.method="post";
			frm.action="${contextPath}/member/addMember.do";
			frm.submit();
		}
		
	}
</script>
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
		<h3>홈쇼핑 회원 등록</h3>
	<form name="frm">
		<table>
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" id="custno" value="${count}" readonly="readonly"/></td>
			</tr>
			<tr>	
				<th>
					회원성명
				</th>
				<td>
					<input type="text" name="custname" id="custname"/>
				</td>
			</tr>
			<tr>	
				<th>
					회원전화
				</th>
				<td>
					<input type="text" name="phone" id="phone"/>
				</td>
			</tr>
			<tr>	
				<th>
					회원주소
				</th>
				<td>
					<input type="text" name="address" id="address"/>
				</td>
			</tr>
			<tr>	
				<th>
					가입일자
				</th>
				<td>
					<input type="text" name="joindate" id="joindate" value="<%=toDate %>" readonly="readonly"/>
				</td>
			</tr>
			<tr>	
				<th>
					고객등급[A:VIP, B:일반, C:직원]
				</th>
				<td>
					<input type="text" name="grade" id="grade"/>
				</td>
			</tr>
			<tr>	
				<th>
					도시코드
				</th>
				<td>
					<input type="text" name="city" id="city"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="frmcheck()"/>
					<input type="button" value="조회" onclick="location.href='${contextPath}/member/listMember.do'"/>
				</td>
			</tr>
		</table>
	</form>
	</section>
	<footer>
		HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resource Development Service of Korea.
	</footer>
</body>
</html>