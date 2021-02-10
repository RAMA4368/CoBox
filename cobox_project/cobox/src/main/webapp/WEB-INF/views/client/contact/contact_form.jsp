<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
/*
function sendMail(){
	if (confirm("관리자에게 1:1문의를 보내시겠습니까?")) {
		var form = document.querySelector("form");
		form.action="/client/contact/sendmail";
		form.method="post";
	}
	form.submit();
}
*/
/*
$("form").attr({
	action:"/client/contact/sendmail",
	method:"post",
});	
$("form").submit();
*/
$(function(){
	$("button").click(function(){
		if (confirm("관리자에게 1:1문의를 보내시겠습니까?")) {
			var form = document.querySelector("form");
			form.action="/client/contact/sendmail";
			form.method="post";
		}
		form.submit();
	});
});

</script>
</head>
<body>
    <div class="wrapper">
	<%@ include file="../inc/top.jsp" %>
        <!-- Main content -->
		<section  class="container">
			<h2 class="page-heading heading--outcontainer">Contact</h2>
			<div class="col-sm-8 col-md-9 col-sm-push-4 col-md-push-3">
				<div class="contact">
					<p class="contact__title">You have any questions or need help, <br><span class="contact__describe">don’t be shy and contact us</span></p>
					<span class="contact__mail">CoBox@codingbox.com</span>
					<span class="contact__tel">CoBox@codingbox.com</span>
				</div>
		        <div class="contact-form-wrapper">
	                <div class="col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
	                    <form id='contact-form' class="form row" method='post' novalidate="" action="send.php">
	                        <p class="form__title">Drop us a line</p>
	                        <div class="col-sm-6">
	                            <input type='text' placeholder='Your name' name="uname" class="form__name">
	                        </div>
	                        <div class="col-sm-6">
	                            <input type='email' placeholder='Your email' name="uemail" class="form__mail">
	                        </div>
	                        <div class="col-sm-12">
	                            <textarea placeholder="Your message" name="umessage" class="form__message"></textarea>
	                        </div>
	                        <button type="button" class='btn btn-md btn--danger'>send message</button>
	                    </form>
	                </div>
		        </div>
	        </div>
			<aside class="col-sm-4 col-md-3 col-sm-pull-8 col-md-pull-9">
				<ul class="nav nav-tabs" id="vTab">
					<li><a href="/client/notice/list">Notice.</a></li>
					<li><a href="/client/contact/contactform">Contact us.</a></li>
				</ul>
			</aside>
		</section>

<%@include file="../inc/footer.jsp" %>
<%@include file="../inc/script.jsp" %>
</body>
</html>
