<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<%//@include file="../inc/script.jsp"%>

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
	
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px 0 30px 0;
	margin: 150px;
}

input {
	padding: 20px;
	margin: auto;
}

/* style inputs and link buttons */
input:hover, .btn:hover {
	opacity: 0.9;
}


/* style the submit button */
input[type=button] {
	width: 250px;
	height: 250px;
	background-color: #A9AD1C;
	color: white;
	cursor: pointer;
	border: solid 5px #A9AD1C;
	border-radius: 10px;
	position: relative;
	float: left;
	margin: auto;
	font-size: 21px;
	padding:10px 10px 10px 10px;
}

input[type=button]:hover {
	background-color: rgba(222, 222, 222, 0.5);
	color:black;
}

input[type=hidden]:hover {
	background-color: black;
}

/* Two-column layout */
.col {
	float: left;
	width: 50%;
	margin: auto;
	padding: 0 50px;
	margin-top: 6px;
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

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
	.col {
		width: 100%;
		margin-top: 0;
	}
	/* hide the vertical line */
	.vl {
		display: none;
	}
	/* show the hidden text on small screens */
	.hide-md-lg {
		display: block;
		text-align: center;
	}
}
</style>
<script>
	
</script>
</head>
<body class="single-cin">
	<div class="wrapper">
		<%@ include file="../inc/top.jsp"%>
		<!-- Main content -->
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


		<div id="form_container">
			<form id="editform" method="post">
				<div class="row">
				
					<div style="text-align: center; padding: 50px; font-size: 50px">마이페이지</div>
					
					<div style="width:24%; height:250px; background-color:white; position:relative; float:left; padding:50px 20px 0 20px;"></div>

					<a href="/client/mypage/edit" style="padding: 20px; margin: auto;"> 
						<input id="mypage_edit" type="button" value="회원정보 수정" onClick="memberEdit()">
					</a> 
					
					<a href="/client/mypage/recepit_ticket"> 
					<input id="recepit_ticket" type="button" value="예매정보 확인및환불" onClick="recepitTicket()">
					</a> 
					
					<a href="/client/mypage/recepit_snack"> 
						<input id="recepit_snack" type="button" value="스낵 구매내역" onClick="recepitSnack()">
					</a> 
					
					<a href="/client/mypage/delete"> 
						<input id="mypage_delete" type="button" value="회원탈퇴" onClick="memberDelete()">
					</a>
					
				</div>
			</form>
		</div>
		
		<div class="col">
			<div class="hide-md-lg"></div>
		</div>



		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<%@include file="../inc/footer.jsp"%>
	</div>
	<!-- Custom -->

</body>
</html>
