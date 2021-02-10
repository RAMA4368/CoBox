<%@page import="com.koreait.cobox.model.common.Pager"%>
<%@page import="com.koreait.cobox.model.domain.Notice"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Pager pager = (Pager)request.getAttribute("pager");
	List<Notice> noticeList= (List)pager.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
/* 게시판메뉴바 디자인 */
body {
  font-family: Arial, Helvetica, sans-serif;
}

.pill-nav a {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px;
  text-decoration: none;
  font-size: 17px;
  border-radius: 5px;
}

.pill-nav a:hover {
  background-color: #ddd;
  color: black;
}

.pill-nav a.active {
  background-color: #B80000;
  color: white;
}
/* 게시판 디자인 */
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #E6E0EC;
}

button {
  background-color: #005072;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #B80000;
}

a{
	text-decoration: none;
	color: black;
}

a:hover {
	color: #B80000;
}

.pageNum{
	font-size:12pt;
	color: #5C5E60;
	font-weight:bold;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<%@ include file="../inc/header.jsp" %>
</head>
<body>
<%@ include file="../inc/main_navi.jsp" %>
<!-- 글씨체 변경가능!!!  -->
<h2 style="font-family:맑은 고딕;">공지/뉴스</h2>
<p>COBOX의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다</p>

<div class="pill-nav" style="border-bottom:2px solid black;">
	<a class="active" href="#home">전체</a>
</div>

<p>총 <%=noticeList.size() %>건이 검색되었습니다.</p>

	<table>
		<tr>
			<th>No.</th>
			<th>구분</th>
			<th>제목</th>
			<th>등록일</th>
			<th>작성자</th>
		</tr>
		<% 
			int curPos=pager.getCurPos();
			int num = pager.getNum();
		%>
		<%for(int i=1; i<=pager.getPageSize();i++){ %>
		<%if(num<1)break; %>
			<%Notice notice = noticeList.get(curPos++); %>
			<tr>
				<td><%=num-- %></td>
				<td><%=notice.getDivision().getDname() %></td>
				<td><a href="/admin/notice/detail?notice_id=<%=notice.getNotice_id() %>"><%=notice.getTitle() %></a></td>
				<td><%=notice.getRegdate().substring(0, 10)%></td>
				<td><%=notice.getWriter()%></td>
			</tr>
		<%} %>
		<tr>
			<td colspan="6" style="text-align: center">
			<%if((pager.getFirstPage()-1)>=1){ %>
				<a href="/admin/notice/list?currentPage=<%=pager.getFirstPage()-1 %>" class="pagination__prev">prev</a>
			<%}else{ %>
				<a href="javascript:alert('첫 페이지입니다.');" >◀</a>
			<%} %>
			
			<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){ %>
			<%if(i>pager.getTotalPage()) break; %>
				<a <%if(pager.getCurrentPage()==i){ %>class="pageNum"<%} %> href="/admin/notice/list?currentPage=<%=i%>">[<%=i %>]</a>
			<%} %>
			
			<%if((pager.getLastPage()+1)<pager.getTotalPage()){ %>
				<a href="/admin/notice/list?currentPage=<%=pager.getLastPage()+1 %>" class="pagination__next">next</a>
			<%}else{ %>
				<a href="javascript:alert('마지막 페이지입니다.');">▶</a>
			<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<button onclick="location.href='registform'">글등록</button>
			</td>
		</tr>
	</table>

</body>
</html>
