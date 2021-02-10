<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.koreait.cobox.model.domain.Member"%>
<%
	Member member = (Member) session.getAttribute("member");
%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/script.jsp"%>
<style>
h, td, tr, textarea, FORM {
	font-family: 고딕;
	font-size: 1em;
	border-radius: 5px;
}

table {
	border: 1px solid rgba(255, 255, 255, 0.8);
	border-spacing: 15px;
}

FORM .input {
	border-radius: 10px;
	border: solid 5px #A9AD1C;
	background-color: rgba(255, 255, 255, 0.8);
	border-spacing: 15px;
}

input {
	width: 60%;
	padding: 5px;
	border-radius: 5px;
	margin: 5px 0;
	opacity: 0.85;
	display: inline-block;
	font-size: 17px;
	line-height: 10px;
	text-decoration: none;
	background-color: rgb(222, 222, 222);
	color: black;
}

#form_container {
	width: 80%;
	height: 100%;
	position: relative;
	border: solid 5px #A9AD1C;
	border-radius: 10px;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px 0 30px 0;
	margin: 0 auto;
}

#edit_btn {
	width: 49.5%;
	padding: 10px;
	position: relative;
	float: left;
	color: black;
	background-color: rgb(222, 222, 222);
}

#reset_btn {
	width: 49.5%;
	padding: 10px;
	position: relative;
	float: left;
	color: black;
	background-color: rgb(222, 222, 222);
}

select, #doublecheck {
	background-color: #ffffff;
	color: black;
	padding: 5px;
	border-radius: 5px;
	font-size: 17px;
	line-height: 10px;
}
</style>

<!-- 
 -->

<script>
$(function(){
	//회원가입 처리 
	$("input[type='button']").click(function(){
		redata();
	});	
});


//요청이 완료되는 시점에 프로그래스바를 감춘다!!
function redata(){
	//form 태그의 파라미터들을 전송할수있는 상태로 둬야  data키값에 form 자체를 넣을 수 있다.
	var formData = $("#redatatable").serialize(); //전부 문자열화 시킨다!!
	
	$.ajax({
		url:"/client/mypage/member_edit",
		type:"post",
		data:formData,
		success:function(responseData){
			//데이터를 받으면 문구없애기
			var json = JSON.parse(responseData);
			if(json.result==1){
				alert("회원정보 수정이 완료되었습니다");
				location.href="/client/member/formtable"; //로그인 페이지
			}else{
				alert("회원정보 수정에 실패했습니다. \n 다시 시도해주세요.");
			}
		}
	});
}


</script>
</head>
<body class="single-cin">
	<div class="wrapper">
		<%@ include file="../inc/top.jsp"%>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

		<div>
			<table id="form_container">
				<!--  
			<div id="loader" style="margin:auto; color:red;">잠시만 기다려주세요</div>
			-->
				<form id="redatatable">
					<h1 style="padding:30px; text-align: center; font-size:50px;">회원정보 수정</h1>
				<tr>
					<td>아이디  ( * 아이디는 수정이 불가능합니다.)</td>
					<td>
						<input id="mid" type="text" name="mid" value="<%=member.getMid()%>" readonly="readonly"></input> 
						<!-- 
							 <input id="doublecheck" type="button" onClick="idcheck" value="중복확인"></input>
						-->
					</td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td>
						<input id="pw" type="password" name="password" value="<%=member.getPassword()%>"></input>
					</td>
				</tr>
				
		
				
				<tr>
					<td>성명   ( * 이름은 수정이 불가능합니다.)</td>
					<td>
						<input id="name" type="text" name="name" value="<%=member.getName()%>" readonly="readonly"></input>
					</td>
				</tr>

				<tr>
					<td>생년월일</td>
					<td>
						<input id="birth" type="date" name="birth" value="<%=member.getBirth()%>"></input>
					</td>
				</tr>

				<tr>
					<td>이메일</td>
					<td>
					<input id="email_id" type="text" name="email_id" value="<%=member.getEmail_id()%>"> @ 
						<select name="email_server" value="<%=member.getEmail_server()%>">
							<option>naver.com</option>
							<option>gmail.com</option>
							<option>nate.com</option>
					</select>
					</td>
				</tr>

				<tr>
					<td>핸드폰 번호</td>
					<td>
						<input id="phone" type="text" name="phone" value="<%=member.getPhone()%>">
						</input>
					</td>
				</tr>

				<tr>
					<td>
						<input id="edit_btn" type="button" value="정보 수정하기" onClick="redata()">
						<input id="reset_btn" type="reset" value="다시 입력">
					</td>
				</tr>


				</form>
			</table>

		</div>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<%@include file="../inc/footer.jsp"%>
	</div>
</body>
</html>
