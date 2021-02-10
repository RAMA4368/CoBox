<%@page import="com.koreait.cobox.model.domain.TopCategory"%>
<%@page import="java.util.List"%>
<%
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

//상품등록 (비동기)
function regist(){
	var formData = new FormData($("form")[0]);
	
	formData.append("detail", CKEDITOR.instances["detail"].getData());
	
	$.ajax({
		url:"/admin/snack/regist",
		data:formData,
		contentType:false,
		processData:false,
		type:"post",
		success:function(responseData){
			var json = JSON.parse(responseData);
			if(json.result==1){
				alert(json.msg);
				location.href="/admin/snack/list";
			}else{
				alert(json.msg);
			}
		}
	});

}
</script>
</head>
<body>
<%@ include file="../inc/main_navi.jsp" %>

<h3>스낵 등록</h3>
<div class="container">
  <form>
  	<select name="topCategory.topcategory_id">
  		<option>카테고리 선택</option>
  		<%for(TopCategory topCategory : topList){%>
  		<option value="<%=topCategory.getTopcategory_id()%>"><%=topCategory.getName() %></option>
  		<%} %>
  	</select>
  	
    <input type="text" name="snack_name" placeholder="스낵명">
    <input type="text" name="price" placeholder="가격">
    <input type="text" name="amount" placeholder="수량">
    <textarea id="detail" name="detail" placeholder="상세정보.." style="height:200px"></textarea>

	<p>스낵이미지: <input type="file"  name="snackImg"></p>
    
    <input type="button" value="글등록" onClick="regist()">
    <input type="button" value="목록보기" onClick="location.href='/admin/snack/list'">
  </form>
</div>

</body>
</html>