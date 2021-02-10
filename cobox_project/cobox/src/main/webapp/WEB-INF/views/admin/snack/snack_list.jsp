<%@page import="com.koreait.cobox.model.common.Pager"%>
<%@page import="com.koreait.cobox.model.domain.Snack"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Pager pager =(Pager)request.getAttribute("pager");
	List<Snack> snackList = (List)pager.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../inc/header.jsp" %>
<style>
.btn{
	border:none;
	border-radius:4px;
	color: white;
	padding:14px 28px;
	font-size:16px;
	cursor:pointer;
	background-color:#2196F3;
}
.btn:hover{
	background-color:#0b7dda;
}
</style>
</head>
<body>
<%@ include file="../inc/main_navi.jsp" %>
<script>
$(function(){
	$("button").click(function(){
		location.href="/admin/snack/registform";
	});	
});

function getDetail(snack_id){
	location.href="/admin/snack/detailList?snack_id="+snack_id;
}
</script>
<h2>Snack List</h2>

<table>
  <tr>
    <th>No</th>
    <th>이미지</th>
    <th>카테고리</th>
    <th>스낵명</th>
    <th>가격</th>
    <th>수량</th>
  </tr>
  <%for(int i=0; i<snackList.size(); i++){ %>
  <%Snack snack = snackList.get(i); %>
  <tr>
    <td><%=snack.getSnack_id() %></td>
    <td><img src="/resources/data/snack/<%=snack.getSnack_id()%>.<%=snack.getFilename()%>" width="50px"></td>
    <td><%=snack.getTopCategory().getName() %></td>
    <td><a href="javascript:getDetail(<%=snack.getSnack_id()%>)"><%=snack.getSnack_name() %></td>
    <td><%=snack.getPrice() %></td>
    <td><%=snack.getAmount() %></td>
  </tr>
  <%} %>
  <tr>
  	<td colspan="6">
	    <button>스낵등록</button>
  	</td>
  </tr>
</table>

</body>
</html>