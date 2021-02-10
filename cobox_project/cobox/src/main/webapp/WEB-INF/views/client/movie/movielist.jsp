<%@page import="com.koreait.cobox.model.common.Pager"%>
<%@page import="com.koreait.cobox.model.domain.Location"%>
<%@page import="com.koreait.cobox.model.domain.Genre"%>
<%@page import="com.koreait.cobox.model.domain.Movie"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
// List<Movie> movieList = (List)request.getAttribute("movieList");
Pager pager=(Pager)request.getAttribute("pager");
List<Movie>movieList=(List)pager.getList();
out.print("movieList의 사이즈"+movieList.size());

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<style>

  #ip{text-align: center;}
.pageNum{
   font-size: 15pt;
   color: red;
   font-weight: bold;
}
</style>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script>


	//리턴값은 movie_id 가List로 날라온다
	//obj 는 genre_name 이므로 controller에넘겨준다
	function getGenreMovieList(obj){
		//alert($(obj).val());
	
	$.ajax({
		url:"/client/movie/genremovie",
		type:"get",
		data:{
			genre_name:$(obj).val()
		},
		success:function(result){
			//alert("결과는"+result);
			
			$($("select")[3]).empty();
			$($("select")[3]).append("<option>movie_id</option>");
			
			for(var i=0;i<result.length;i++){
				var genremovie=result[i];
				console.log("넘어온 movie_id 는"+genremovie.movie_id);
				$($("select")[3]).append("<option value=\""+genremovie.movie_id+"\">"+genremovie.movie_id+"</option>");
			
			}
		}
	});
	}
	//비동기 방식으로 장바구니에 담자! /movie_id가 넘어와야함 
	/* function addCart(){
		
		var formData=$("#cart_form").serializeArray(); //파라미터를 전송할 수 있는 상태의 문자열로 나열해줌
		alert(formData);						//이상태로넘기면 한페이지에 들어있는 for문을 다돌려, 모든 movie_id 가 넘어가버림-->해결책 강구중
		
		$.ajax({
			url:"/client/moviecart/regist",
			type:"post",
			data:formData,
			
			success:function(responseData){
				if(responseData.resultCode==1){
					if(confirm(responseData.msg+"\n찜한 영화를 보러갈까요?")){
						location.href=responseData.url;
					}
				}else{
					alert(responseData.msg);
				}
			}
		});
	}
 */

</script>
	
</head>
<body class="single-cin">
    <div class="wrapper">
    <%@include file="../inc/top.jsp"%>         
        <!-- Main content -->
         <div class="search-wrapper">
            <div class="container container--add">
                <form name ="form1" id='search-form' method="post" class="search">
                    <input type="text" class="search__field" placeholder="Search" name = "text" id="text">
                    <select name="sorting_item" id="search-sort" class="search__sort" tabindex="0">
                        <option value="1" selected='selected'>영화제목</option>
                        <option value="2">배우</option>
                       
                    </select>
                    <button type='submit' class="btn btn-md btn--danger search__button" onClick="search()">search a movie</button>
                </form>
            </div>
        </div>
        <section class="container">
            <div class="col-sm-12" id="movielist">
                <h2 class="page-heading">영화 목록</h2>     
                </div>
                <!-- Movie preview item -->
        	<form id="cart_form">
	        	<% 
					int curPos=pager.getCurPos();
					int num = pager.getNum();
				%>
				<%for(int i=1; i<=pager.getPageSize();i++){ %>
				<%if(num<1)break; %>
				<%Movie movie=movieList.get(curPos++); %>
				
				
				<div class="movie">
                <div class="movie movie--preview movie--full release">
                    <div class="col-sm-3 col-md-2 col-lg-2">
                            <div class="movie__images"> 
                                <img src="/resources/data/movie/<%=movie.getMovie_id()%>.<%=movie.getPoster()%>" alt="" >
                            </div>
                    </div>
			<!-- 영화정보 -->
                    <div class="col-sm-9 col-md-10 col-lg-10 movie__about">
                            <a href='/client/movie/detail?movie_id=<%=movie.getMovie_id()%>' class="movie__title link--huge"><%=movie.getMovie_name() %></a>
                            <p class="movie__time">영화정보</p>
                            <p class="movie__option"><strong>개봉일:<%=movie.getRelease()%> </strong></p>               
                            <p class="movie__option"><strong>배우:<%=movie.getActor()%> </strong></p>
                         <div class="movie__btns">
                                <a href="#" class="btn btn-md btn--warning">book a ticket <span class="hidden-sm">for this movie</span></a>
                                 <a href='/client/moviecart/regist?movie_id=<%=movie.getMovie_id()%>' class="watchlist" name ="mcart"  value='<%=movie.getMovie_id() %>'>Add to watchlist</a> 
                            <!--    <a class="watchlist" name ="movie_id" onClick = "addCart()" value='<%=movie.getMovie_id() %>'>Add to watchlist</a>
                      		 < input type="hidden" name = "movie_id" value="<%=movie.getMovie_id() %>"> -->           
                            </div>
                    </div>
                </div>
                </div>
                        <div class="clearfix"></div>
                <%}%>
                </form>
                   
                <!-- end movie preview item -->
                <!-- <<<<prev 버튼 눌렀을 때 페이징 처리 -->
                <tr>
                <td>
	                <div class="coloum-wrapper">
	                    <div class="pagination paginatioon--full">
	                <%if((pager.getFirstPage()-1)>=1){ %>
	                	<a href ='/client/movie/list?currrentPage=<%=pager.getFirstPage()-1 %>' class="pagination_prev">prev</a>
	                            <%}else{ %>
	                            <a href="javascript:alert('첫 페이지입니다.');" class="pagination__prev">prev</a>
	                            <%} %>
                              
                <!--페이징 숫자 눌렀을때 처리 -->
           
 					<p id="ip">            
                	<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){ %>
                		<%if(i>pager.getTotalPage())break; %>
               
                		<a <%if(pager.getCurrentPage()==i){ %> class="pageNum"<%} %> href="/client/movie/list?currentPage=<%=i %>" style="text-align: center">[<%=i %>]</a>  
                	<%} %>
                     </p> 
                <!--   >>>>next 버튼 눌렀을 때 페이징 처리  -->
               
	                <%if((pager.getLastPage()+1)<pager.getTotalPage()){ %>
	   	             	<a href="/client/movie/list?currentPage=<%=pager.getLastPage()+1 %>" class="pagenation_next">next</a>
	               	<%}else{ %>
	                     <a href="javascript:alert('마지막 페이지입니다.');" class="pagination__next">next</a>
	                     <%} %>
	                	</div>
	                </div>     
                </td>
                </tr>
            </section>
            </div>
        
    <%@include file="../inc/footer.jsp"%>
    <%@include file="../inc/script.jsp"%>

		<script type="text/javascript">
            $(document).ready(function() {
                init_MovieList();
            });
		</script>
</body>
</html>