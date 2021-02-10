<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="../inc/header.jsp"%>
<%@include file="../inc/script.jsp"%>
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
.kakao {
	background-color: #EBD300;
	color: white;
}

.naver {
	background-color: #30BA14;
	color: white;
}

.fb {
	background-color: #3B5998;
	color: white;
}

/* style the submit button */
input[type=submit] {
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

#login_btn {
	color: black;
	background-color: rgb(222, 222, 222);
	width: 49.5%
}

#join_btn {
	color: black;
	background-color: rgb(222, 222, 222);
	width: 49.5%
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

</head>
<body class="single-cin">
<div class="container">
	<%@ include file="../inc/top.jsp"%>
	<h1>이용에 불편을 드려 죄송합니다</h1>
	<%=request.getAttribute("msg")%>
	<%@include file="../inc/footer.jsp"%>
</div>
</body>
</html>