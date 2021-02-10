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
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* style the container */
#form_container {
	position: relative;
	border: solid 5px #A9AD1C;
	border-radius: 10px;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px 0 30px 0;
	margin: 150px;
}

/* style inputs and link buttons */
input, .btn {
	width: 100%;
	padding: 12px;
	border-radius: 5px;
	margin: 5px 0;
	opacity: 0.85;
	display: inline-block;
	font-size: 17px;
	line-height: 20px;
	text-decoration: none; /* remove underline from anchors */
	background-color: rgb(222, 222, 222);
	color: black;
}

input:hover, .btn:hover {
	opacity: 1;
}

/* add appropriate colors to fb, twitter and google buttons */

/* style the submit button */
input[type=submit] {
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

#memberdelete {
	color: black;
	background-color: rgb(222, 222, 222);
	width: 49.5%
}

#cancel {
	color: black;
	background-color: rgb(222, 222, 222);
	width: 49.5%
}

/* Two-column layout */
.col {
	float: left;
	width: 80%;
	margin: auto;
	padding: 0 50px;
	margin-top: 6px;
	margin-left: 10%;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* vertical line */
.vl {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	border: 2px solid #ddd;
	height: 175px;
}

/* text inside the vertical line */
.vl-innertext {
	position: absolute;
	top: 50%;
	transform: translate(-50%, -50%);
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	border-radius: 50%;
	padding: 8px 10px;
}

/* hide some text on medium and large screens */
.hide-md-lg {
	display: none;
}

/* bottom container */
.bottom-container {
	text-align: center;
	background-color: #666;
	border-radius: 0px 0px 4px 4px;
}
</style>
<script>
	$(function() {
		$("#memberdelete").on("click", function() {
			requestquit();
		});
	});

	function requestquit() {
		$.ajax({
			url : "/client/mypage",
			type : "post",
			data : {
				mid : $("input[name='mid']").val(),
				password : $("input[name='password']").val()
			}
		})
		$("#removetable").submit();
		alert("회원탈퇴가 완료되었습니다");
		location.href="/"
	};
</script>
</head>

<body class="single-cin">
	<div class="wrapper">
		<%@ include file="../inc/top.jsp"%>
		<!-- Main content -->
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


		<div id="form_container">
			<form id="removetable">
				<div class="row">
					<div class="col">
						<div style="text-align: center; padding: 15px; font-size: 50px">회원탈퇴</div>
						<div style="text-align: center; padding: 15px; font-size: 25px">
							회원탈퇴를 원하시면 아이디와 비밀번호를 입력해주세요.</div>

						<input type="text" name="mid" value="<%=member.getMid()%>" readonly="readonly" /> 
						<input type="password" name="password" placeholder="비밀번호를 입력해주세요" required /> 
						<input id="memberdelete" type="button" value="회원 탈퇴" /> 
						
						<a href="/client/mypage"> 
							<input id="cancel" type="button" value="취소" onclick="requestquit()"/>
						</a>
					</div>
				</div>
			</form>
		</div>



		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<%@include file="../inc/footer.jsp"%>
	</div>
	<!-- Custom -->

</body>
</html>