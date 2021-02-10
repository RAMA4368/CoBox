<%@page import="com.koreait.cobox.model.domain.Notice"%>
<%@page import="com.koreait.cobox.model.domain.Division"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
 }

input[type=button] {
  background-color: #005072;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  margin-right: 4px;
}

input[type=button]:hover {
  background-color: #B80000;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-13 {
  float: left;
  width: 13%;
  margin-top: 6px;
}
.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}
.col-60 {
  float: left;
  width:60%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$($("input[type='button']")[1]).click(function(){//목록
		location.href="/admin/notice/list";
	});
	
	$($("input[type='button']")[2]).click(function(){//수정
		if (confirm("수정하시겠습니까?")) {
			$("form").attr({
				action:"/admin/notice/edit",
				method:"post"
			});
			$("form").submit();
		}
	});
	
	$($("input[type='button']")[3]).click(function(){//삭제
		if (confirm("삭제하시겠습니까?")) {
			$("form").attr({
				action:"/admin/notice/del",
				method:"get"
			});
			$("form").submit();
		}		
	});
});
</script>
<%@ include file="../inc/header.jsp" %>
</head>
<body>
<%@ include file="../inc/main_navi.jsp" %>

<h2>공지사항 상세보기</h2>

<div class="container">
  <form>
  <input type="hidden" name="notice_id" value="<%=notice.getNotice_id()%>">
<%--     <div class="row">
      <div class="col-25">
        <label  for="country">구분</label>
      </div>
      <div class="col-75">
        <input name="division.division_id" value="<%= notice.getDivision().getDname() %>">
      </div>
    </div> --%>
    <div class="row">
      <div class="col-25">
        <label for="lname">제목</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="title" value="<%=notice.getTitle()%>">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">글쓴이</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="writer" value="<%=notice.getWriter()%>">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="fname">첨부파일</label>
      </div>
      <div class="col-60">
        <input type="text" id="fname" name="firstname" placeholder="첨부파일..">
      </div>
      <input class="col-13" type="button" value="파일등록">
    </div>
    <div class="row">
      <div class="col">
        <textarea id="subject" name="contents" style="height:200px"><%= notice.getContents() %></textarea>
      </div>
    </div>
    <div class="row">
      <input type="button" value="목록보기" >
      <input type="button" value="수정">
      <input type="button" value="삭제">
    </div>
  </form>
</div>
</body>
</html>
