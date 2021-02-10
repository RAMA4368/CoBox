<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
 <html class="no-js"> 
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>영화 예매 사이트</title>
<script type="text/javascript">

function sendMail(){
	if (confirm("관리자에게 1:1문의를 보내시겠습니까?")) {
		var form = document.querySelector("form");
		form.action="/client/contact/sendmail";
		form.method="post";
	}
	form.submit();
}

/*
function sendMail(){
	var formData = $("#contact_form").serialize();
	
	$.ajax({
		url:"/client/contact/sendmail",
		type:"post",
		data:formData,
		success:function(responseData){
			var json = JSON.parse(responseData);
			if (json.result==1) {
				alert(json.msg);
				location.href="/";
			}else{
				alert(json.msg);
			}
		}
	});
}
*/
</script>
</head>
<body>
	<form id="contact_form">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<input type="text" name="uName" placeholder="이름">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<input type="text" name="uEmail" placeholder="본인 이메일을 가져오자! ">
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<textarea name="uMessage" cols="30" rows="7"	placeholder="문의사항"></textarea>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<input type="submit" value="Send Mail" onclick="sendMail()">
				</div>
			</div>
		</div>
	</form>
</body>
</html>

