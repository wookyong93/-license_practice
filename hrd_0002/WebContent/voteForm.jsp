<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
	td{
		padding:5px;
		float: left;
	}
	th{
		padding:5px;
		text-align: center;
	}
	table,tr,th{
		border:1px solid black;
		border-collapse: collapse;
	}
</style>
<script>
	function fn_voteInsert(){
		var frm = document.frm;
		var v_jumin = frm.v_jumin;
		var v_name = frm.v_name;
		var m_no = frm.m_no;
		var v_time = frm.v_time;
		var v_area = frm.v_area;
		var radio1 = document.getElementById('radio1');
		var radio2 = document.getElementById('radio2');
		
		if(v_jumin.value==""){
			alert('주민번호가 입력되지 않았습니다.');
			v_jumin.focus();
		}else if(v_name.value==""){
			alert('성명이 입력되지 않았습니다.');
			v_name.focus();
		}
		else if(m_no.value==""){
			alert('후보번호가 선택되지 않았습니다.');
			m_no.focus();
		}else if(v_time.value==""){
			alert('투표시간이 입력되지 않았습니다.');
			v_time.focus();
		}else if(v_area.value==""){
			alert('투표장소가 입력되지 않았습니다.');
			v_area.focus();
		}else if(radio1.checked == false && radio2.checked == false){
			alert('유권자확인이 선택되지 않았습니다.');
			radio1.focus();
		}else {
			alert('투표하기 정보가 정상적으로 등록되었습니다!');
			frm.method="post";
			frm.action="/hrd_0002/vote/voteInsert.do";
			frm.submit();
		}
		
	}
	function fn_reset(){
			var frm = document.frm;
			var jumin = frm.v_jumin;
			alert('정보를 지우고 처음부터 다시 입력합니다!');
			frm.reset();
			jumin.focus();
			
	}
</script>
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
		<h2>투표하기</h2>
		<form name="frm">
			<table>
				<tr>
					<th width="30%">주민번호</th><td><input type="text" name="v_jumin" > 예 : 8906153154726</td>
				</tr>
				<tr>
					<th>성명</th><td><input type="text" name="v_name"></td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td>
						<select name="m_no">
							<option value="">후보선택</option>
							<option value="1"> [1] 김후보</option>
							<option value="2"> [2] 이후보</option>
							<option value="3"> [3] 박후보</option>
							<option value="4"> [4] 조후보</option>
							<option value="5"> [5] 최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th><td><input type="text" name="v_time"></td>
				</tr>
				<tr>
					<th>투표장소</th><td><input type="text" name="v_area"></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
					<input type="radio" name="v_confirm" id="radio1" value="Y">확인
					</td>
					<td>
					<input type="radio" name="v_confirm" id="radio2" value="N">미확인
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="fn_voteInsert()">투표하기</button> 
						<button type="button" onclick="fn_reset()">다시하기</button>
					</th>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<h3>HRDKOREA Copyrightⓒ2015 All right reserved Human Resources Development Server of Korea</h3>
	</footer>
</body>
</html>