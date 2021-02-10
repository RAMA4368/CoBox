<%@page import="com.koreait.cobox.model.domain.Notice"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[type='button']").click(function(){//목록
		location.href="/client/notice/list";
	});
});
</script>
</head>
<body class="single-cin">
	<div class="wrapper">
	<%@ include file="../inc/top.jsp" %>
	<!-- Main content -->
       <section class="container">
            <div class="col-sm-12">
                <h2 class="page-heading">Single post(상세보기)</h2>
				<input type="hidden" name="notice_id" value="<%=notice.getNotice_id()%>">
                <div class="post">
                    <div class="post__preview">
                        <a class="arrow-left no-hover" href="#"><span class="slider__info"></span></a> 
                        <a class="arrow-right" href="#"><span class="slider__info"></span></a>
                    </div>
                    <h1><%=notice.getTitle()%></h1>
                    <p class="post__date">29 October 2013 </p>
                    <div class="wave-devider"></div>
                    <h2></h2>
                    <p><%= notice.getContents() %> </p>
                </div>
                <div class="row" align="right">
			      <input type="button" class="btn btn-md btn--warning" value="목록보기" >
			    </div>
            </div>
        </section>
    <%@include file="../inc/footer.jsp" %>
	</div>
	<%@include file="../inc/script.jsp"%>
	<!-- Custom -->
	<script type="text/javascript">
		$(document).ready(function() {
			init_Home();
		});
	</script>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> e67746f7da3158b3653e25e65dea06fccdcd9523
