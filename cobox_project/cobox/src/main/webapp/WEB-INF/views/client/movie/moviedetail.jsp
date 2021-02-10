<%@page import="java.util.List"%>
<%@page import="com.koreait.cobox.model.domain.Comments"%>
<%@page import="com.koreait.cobox.model.domain.Member"%>
<%@page import="com.koreait.cobox.model.domain.Genre"%>
<%@page import="com.koreait.cobox.model.domain.Movie"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
Movie movie=(Movie)request.getAttribute("movie");
List<Comments> commentsList=(List)request.getAttribute("commentsList");
//Member member=(Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.reply-list{
	background:yellow;

}
#list-area{
	/* //border:1px solid black; */
	
}
.inner-div{
	/* //border:1px solid black; */
	/* background-color:green; */
}

#msgbox{
background-color:yellow;
width:650px;
float:left;

}
.deletebox{
/*b order:1px solid black; */
width:50px;
cursor:pointer;
/* background-color:red; */
fontsize:25px;
float:right;
}
.editbox{
/* border:1px solid black; */
width:50px;
cursor:pointer;
/* background-color:red; */
fontsize:25px;
float:right;
}

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script>
//온로드 하자마자 댓글 가져오기
$(document).ready(function() {
	getCommentsList();
});

	
//댓글 목록 가져오기
function getCommentsList(){
	$.ajax({
		url:"/client/comments/list",
		type:"get",
		data:{
			movie_id:<%=movie.getMovie_id()%>
		},
		success:function(result){
			
			$("#list-area").html(""); //등록이 완료되면 textarea를 비워준다.
			
			var tag=""; //tag 값 비워주기
			for(var i=0; i<result.length; i++){
			var commentsList = result[i];	
			
			tag+="<div class=\"inner-div\" value=\""+commentsList.comments_id+"\>";
			tag+="<div id=\"msgbox\">";
			tag+="<a class=\"comment__author\"><span class=\"social-used fa fa-vk\"></span>"+commentsList.member_name+"</a></p>";
			tag+="</div>"
			tag+="<div class=\"deletebox\" onclick=\"deleteComments(this)\" value=\""+commentsList.comments_id+"\" id=\""+commentsList.member_name+"\">삭제</div>";
			
			tag+="<p class=\"comment__date\">"+commentsList.cdate+"</p>";
			tag+="<p class=\"comment__message\">"+commentsList.msg+"</p>";
			tag+="</div>"
			}
			$("#list-area").html(tag);
		}
	});
}
	

//댓글등록 요청
function registComment(){
	
	$.ajax({
		url:"/client/comments/json",
		type:"post",
		data:{
			msg:$("textarea[name='msg']").val(),
			movie_id:<%=movie.getMovie_id()%>
		
		},
		success:function(responseData){
				var json = JSON.parse(responseData);
				$('textarea').val('');
			if(json.result==1){
				//alert(json.msg); alert가 없어야 비동기 같으므로..
				getCommentsList();
			}else{ 
				alert(json.msg); 
			}
		}
		  
	});
	
}



//댓글 한건 삭제하기 //x 변수에 confirm. 확인 후 삭제
function deleteComments(obj){
		var x = confirm("정말 삭제 하시겠어요?");
		if(x)
	 $.ajax({
		url:"/client/comments/delete",
		type:"get",
		data:{
			movie_id:<%=movie.getMovie_id()%>,
			comments_id:$(obj).attr("value"),
			member_name:$(obj).attr("id") //해당 class의 value값에 member_name을 담아서 넘겨주기
		},
		success:function(responseData){
	
			var json = JSON.parse(responseData);
			alert(json.msg);
			
			if(json.result==1){
				getCommentsList();
			}else{ 
				alert(json.msg); 
			}
			}
		
});
 
}
	
	//영화 장바구니 담기
	function addCart(){
			var formData = $("#cart_form").serialize(); //파라미터를 전송할 수 있는 상태의 문자열로 나열

		$.ajax({
			url:"/client/moviecart/regist",
			type:"post",
			data:formData,
			success:function(responseData){
				if(responseData.resultCode==1){
					
					if(confirm(responseData.msg+"\n영화를 보러갈까요?")){
					location.href=responseData.url;
				}
				}else{
					alert(responseData.msg);
				}
				
			}
		});
	}
	

</script>


<%@ include file="../inc/header.jsp"%>
</head>
<body class="single-cin">
	<div class="wrapper">
		<%@include file="../inc/top.jsp"%>
		<!-- Main content -->
		<section class="container">
			<div class="col-sm-12">
				<div class="movie">
					<h2 class="page-heading"><%=movie.getMovie_name() %></h2>

					<div class="movie__info">
						<div class="col-sm-4 col-md-3 movie-mobile">
							<div class="movie__images">
								<img alt='' src="/resources/data/movie/<%=movie.getMovie_id()%>.<%=movie.getPoster()%>">
							</div>
						</div>

						<div class="col-sm-8 col-md-9">
							<p class="movie__time">169 min</p>

							<p class="movie__option">
							
								<strong>장르: </strong><%for(Genre genre:movie.getGenreList()){ %><a><%=genre.getGenre_name() %>,</a>
							<%} %> 
							</p>
							<p class="movie__option">
								<strong>개봉일: </strong><a ><%=movie.getRelease() %></a>
							</p>
							<p class="movie__option">
								<strong>감독: </strong><a><%=movie.getDirector() %></a>
							</p>
							<p class="movie__option">
								<strong>배우: </strong><%=movie.getActor() %>
							</p>
							<p class="movie__option">
								<strong>관람연령: </strong><a ><%=movie.getRating().getRating_name()%></a>
							</p>
							<p class="movie__option">
								<strong>줄거리: </strong><a><%=movie.getStory() %></a>							
							</p>
						<!--  영화담기 -->
							<form id="cart_form">
							<input type="hidden" name="movie_id" value="<%=movie.getMovie_id()%>">
							<!-- <button type="button" name="addmovie" onClick="addCart()">영화담기</button>
							<input type="number" name="quantity" placeholder="티켓수량" > -->
							</form>
							<p>
							<a href="#" class="comment-link">Comments: 15</a>
						</div>
					</div>
				</div>
				
				<div class="clearfix"></div>
				<h2 class="page-heading">영화 후기 (15)</h2>
				
				<div class="comment-wrapper">
					<form id="comment-form" class="comment-form" method='post'>
						<textarea class="comment-form__text"
							placeholder='후기를 작성하세요' name="msg" id="msg"></textarea>
						
						
						<input type="button" class="btn btn-md btn--danger comment-form__btn" onClick="registComment()" value="댓글등록">
					</form>
				</div>	

					<div class="comment-sets">
	
						<div class="comment">
							<div class="comment__images">
								
							</div>
							
						<div id="list-area">
									 <div class="comment">
                            <div class="comment__images">
                                <img alt='' src="images/comment/avatar-olia.jpg">
                            </div>

                           
                        </div>					
						</div>
						<div id="deletebox"></div>
						

					
						<div class="comment-more">
							<a href="#" class="watchlist">Show more comments</a>
						</div>
					</div>
				</div>
			</div>
	</section>

	<%@include file="../inc/footer.jsp"%>
	</div>
	<%@include file="../inc/script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			init_MovieList();
		});
	</script>
</body>
</html>