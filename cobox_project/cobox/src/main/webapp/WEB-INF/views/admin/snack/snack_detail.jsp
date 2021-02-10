<%@page import="com.koreait.cobox.model.domain.Snack"%>
<%@page import="com.koreait.cobox.model.domain.TopCategory"%>
<%@page import="java.util.List"%>
<%
	Snack snack = (Snack)request.getAttribute("snack");
	List<TopCategory> topList = (List)request.getAttribute("topList");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../inc/header.jsp" %>
<style>
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=button]:hover {
  background-color: #45a049;
}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
/* 드래그 영역 관련 */
#dragArea{
	width:100%;
	height:300px;
	overflow:scroll;
	border:1px solid #ccc;
	float:left;
}
.dragBorder{
	background:#ffffff;
}
.box{
	width:100px;
	float:left;
	padding:5px;
}
.box > img{
	width:100%;
}

.close{
	color:red;
	cursor:pointer;
}
</style>
<script>
$(function(){
	
	CKEDITOR.replace("detail");	

});

function editSnack() {
	if(confirm("제품을 수정하시겠습니까?")){
		$("form").attr({
			action:"/admin/snack/edit",
			method:"post"
		});
		$("form").submit();
	}
}
function delSnack(snack_id){
	if(confirm("제품을 삭제하시겠습니까?")){
		location.href="/admin/snack/del?snack_id="+snack_id;	
	}
}


</script>
</head>
<body>
<%@ include file="../inc/main_navi.jsp" %>

<h3>스낵 디테일</h3>
<div class="container">
  <form>
  	<select name="topCategory.topcategory_id">
  		<option><%=snack.getTopCategory().getName() %></option>
  		<%for(TopCategory topCategory : topList){%>
  		<option value="<%=topCategory.getTopcategory_id()%>"><%=topCategory.getName() %></option>
  		<%} %>
  	</select>
  	
    <input type="text" name="snack_name" value="<%=snack.getSnack_name()%>">
    <input type="text" name="price" value="<%=snack.getPrice()%>">
    <input type="text" name="amount" value="<%=snack.getAmount()%>">
    <textarea id="detail" name="detail"  style="height:200px"><%=snack.getDetail() %></textarea>

	<p>스낵이미지: <input type="file"  name="snackImg" selected="<%=snack.getSnack_id()%>.<%=snack.getFilename()%>"></p>
    
    <input type="button" value="수정하기" onClick="editSnack()">
    <input type="button" value="삭제하기" onClick="delSnack(<%=snack.getSnack_id()%>)">
    <input type="button" value="목록보기" onClick="location.href='/admin/snack/list'">
  </form>
</div>

</body>
</html>