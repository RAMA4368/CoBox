
<%@page import="com.koreait.cobox.model.domain.Rating"%>
<%@page import="com.koreait.cobox.model.common.Pager"%>
<%@page import="com.koreait.cobox.model.domain.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.cobox.model.domain.Genre"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
Pager pager=(Pager)request.getAttribute("pager");
List<Movie>movieList=(List)pager.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../inc/header.jsp" %>
<style>
.pageNum{
	font-size:12pt;
	color: #5C5E60;
	font-weight:bold;
}


</style>
<script>
$(function(){
	$("button").click(function(){
		location.href="/admin/movie/registform"; //글쓰기 폼 요청
	});
});
function regist(){
	var formData = new FormData($("form")[0]);//<form>태그와는 틀리다..전송할때 파라미터들을 담을수있지만 이 자체가 폼태그는 아니다!!
	/*비동기 업로드*/
	$.ajax({
		url:"/admin/movie/excel/regist",
		data:formData,
		contentType:false, /* false일 경우 multipart/form-data*/
		processData:false, /* false일 경우 query-string으로 전송하지 않음*/
		type:"post",
		success:function(responseData){
			console.log(responseData);
			//var json = JSON.parse(responseData); //string --> json 으로 파싱..
			//alert(json);
		}
	});
}

</script>
</head>
<body>

<%@ include file="../inc/main_navi.jsp" %>

<h3>영화 리스트</h3>

   
<p>
	<table>
		<tr>
			<th>No</th>
			<th>이미지</th>
			<th>영화명</th>
			<th>관람등급</th>
			<th>감독</th>
			<th>배우</th>
			<th>개봉일</th>
			
		</tr>
		<% 
			int curPos=pager.getCurPos();
			int num = pager.getNum();
		%>
		<%for(int i=1; i<=pager.getPageSize();i++){ %>
		<%if(num<1)break; %>
		<%Movie movie=movieList.get(curPos++); %>
		<tr>
			<td><%=num-- %></td>
			<td><img src="/resources/data/movie/<%=movie.getMovie_id()%>.<%=movie.getPoster()%>" width="100px"></td>
			<td><a href="/admin/movie/detail?movie_id=<%=movie.getMovie_id()%>"><%=movie.getMovie_name() %></td>
			
			<td><%=movie.getRating().getRating_name()%></td>
			<td><%=movie.getDirector() %></td>
			<td><%=movie.getActor() %></td>
			<td><%=movie.getRelease() %></td>
			
			
		</tr>
		<%} %>
		<tr>
			<td colspan="7">
				<button>영화등록</button>
			</td>
		</tr>
				  <!-- end movie preview item -->
                <!-- <<<<prev 버튼 눌렀을 때 페이징 처리 -->
          <tr>
           	<td colspan ="7" style="text-align: center">     
                <div class="coloum-wrapper">
                    <div class="pagination paginatioon--full">
                <%if((pager.getFirstPage()-1)>=1){ %>
                	<a href ='/admin/movie/list?currrentPage=<%=pager.getFirstPage()-1 %>' class="pagination_prev">◀</a>
                            <%}else{ %>
                            <a href="javascript:alert('첫 페이지입니다.');" class="pagination__prev">◀</a>
                            <%} %>
                         
                <!--페이징 숫자 눌렀을때 처리 -->
                
                	<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){ %>
                		<%if(i>pager.getTotalPage())break; %>
                		<a <%if(pager.getCurrentPage()==i){ %> class="pageNum"<%} %> href="/admin/movie/list?currentPage=<%=i %>">[<%=i %>]</a>  
                	<%} %>
                
                <!--   >>>>next 버튼 눌렀을 때 페이징 처리  -->
                
                <%if((pager.getLastPage()+1)<pager.getTotalPage()){ %>
   	             	<a href="/admin/movie/list?currentPage=<%=pager.getLastPage()+1 %>" class="pagenation_next">▶</a>
               	<%}else{ %>
                     <a href="javascript:alert('마지막 페이지입니다.');" class="pagination__next">▶</a>
                     <%} %>
                	  </div>
                </div>
            
                </td>
                </tr>
	</table>	
			
		      


</body>
</html>
