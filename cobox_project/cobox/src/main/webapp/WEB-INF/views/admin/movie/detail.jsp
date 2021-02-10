
<%@page import="com.koreait.cobox.model.domain.Movie"%>
<%@page import="com.koreait.cobox.model.domain.Rating"%>
<%@page import="com.koreait.cobox.model.domain.Genre"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
 Movie movie=(Movie)request.getAttribute("movie");
//out.print("요청객체에 담겨진 movie_id"+movie.getMovie_id());
List<Genre> genreList=(List)movie.getGenreList();

String[] genre_value=new String[4]; //해당하는 장르 값이 들어가도록 배열로 선언
for(int i=0;i<genreList.size();i++){
//out.print("이 movie_id 에 해당하는 장르는"+genreList.get(i).getGenre_name());
genre_value[i]=genreList.get(i).getGenre_name(); //해당 장르값을 배열안에 대입
out.print("장르는 : "+ genre_value[i]);
}
int i=0;
Rating rating=movie.getRating();
out.print("이 moivie_id에 해당하는 등급연령에 해당하는 value값은" + rating.getRating_id()); 
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../inc/header.jsp"%>
<style>
input[type=text], select, textarea {
	width: 40%;
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
	width:55%;
	border-radius: 5px;
	background-color: #ffffff;
	padding: 20px;
	float:right;
	margin-right:10px;
}


.box {
	width: 100px;
	float: left;
	padding: 5px;
}

.box>img {
	width: 100%;
}

.close {
	color: red;
	cursor: pointer;
}
.genreDiv{
	width:40%;
	padding: 5px;
	margin-left:20px;
	background-color:#ffffff;
	float:left;
	margin-top:30px;
}
.title{
	margin-left:400px;
}
.bottom{
float:left;
width:100%

}
#imgArea{
	width:50%;
	height:300px;
	overflow:scroll;
	border:1px solid #ccc;
}
</style>
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
var genre=[];//선택한 장르사이즈를 담는 배열

//체크박스 체크되있는지 안되어있는지 판단할 수 있는 로직 (온로드)
	$(function(){
		checkbox();
		rating();
		
		
	});
	
	
	
$(function(){
		CKEDITOR.replace("story");
		$($("input[type='button']")[0]).click(function(){
			edit();
		});
		$($("input[type='button']")[1]).click(function(){
			del();
		});
		
		//글수정 요청
		function edit(){
			var formData = new FormData($("form")[0]);
			var fileCheck = document.getElementById("repImg").value;
			if(!fileCheck){//파일이 없으면 그대로 진행.
				if(confirm("이미지 재업로드 없이 수정하시겠어요?")){
				//폼데이터에 에디터값 추가하기
				/* formData.append("story",CKEDITOR.instances["story"].getData()); */
				for(var i=0;i<genre.length;i++){
					formData.append("genre["+i+"].genre_name",genre[i]);
				}
			}
				/*비동기 업로드*/
				$.ajax({
					url:"/admin/movie/edit",
					data:formData,
					contentType:false,
					processData:false,
					type:"post",
					success:function(responseData){
						var json = JSON.parse(responseData);//string-->json
					if(json.result==1){
						alert(json.msg);
						location.href="/admin/movie/list";
					}else{
						alert(json.msg);
					}
						
					}
				});
			
			
			}else{//파일이 있으면
				if(confirm("이미지 파일과 함께 수정하시겠어요?")){
					//폼데이터에 에디터값 추가하기
					//formData.append("story",CKEDITOR.instances["story"].getData());
					for(var i=0;i<genre.length;i++){
						formData.append("genre["+i+"].genre_name",genre[i]);
					}
				}
					/*비동기 업로드*/
					$.ajax({
						url:"/admin/movie/edit1",
						data:formData,
						contentType:false,
						processData:false,
						type:"post",
						success:function(responseData){
							var json = JSON.parse(responseData);//string-->json
						if(json.result==1){
							alert(json.msg);
							location.href="/admin/movie/list";
						}else{
							alert(json.msg);
						}
							
						}
					});
			}
		}
		
		//파일 업로드 여부 확인하기
		/* var fileCheck = document.getElementById("repImg").value;
		if(!fileCheck){ //파일이 없으면
			alert("영화 이미지를 첨부하세요");
			return false;
		}else{//파일이 없로드 되어있으면
			//원래 있던 파일 삭제
		} */
		
		
		
		
		//글삭제 요청
		function del(){
			if(confirm("삭제하시겠어요?")){
				$("form").attr({
					action:"/admin/movie/delete",
					method:"post"
				});
				$("form").submit();
			}
		}
		
		//체크박스 이벤트 구현 (영화장르 값 얻기)
		
		$("input[type='checkbox']").on("click", function(e) {
			var ch = e.target;//이벤트 일으킨 주체컴포넌트 즉 체크박스
			//체크박스의 길이 얻기 
			var ch = $("input[name='genre_name']");
			var len = $(ch).length; //반복문이용하려고..

			genre = [];//배열 초기화
			console.log("채우기 전 genre의 길이는",genre.length);
			
			for (var i = 0; i < len; i++) {
				//만일 체크가 되어있다면, 기존 배열을 모두 지우고, 체크된 체크박스 값만 배열에 넣자!!
				if ($($(ch)[i]).is(":checked")) {
					genre.push($($(ch)[i]).val());
				}
				//console.log(i,"번째 체크박스 상태는 ", $($(ch)[i]).is(":checked"));
				console.log("채우고 genre의 길이는",genre.length);
				
			}
			console.log("서버에 전송할 사이즈 배열의 구성은 ", genre);
		});
		
	 }); 

	//자동으로 체크박스 채워져있도록 구현 
	function checkbox(){		
		
		$("input:checkbox[id='<%=genre_value[0]%>']").prop("checked",true);	
		$("input:checkbox[id='<%=genre_value[1]%>']").prop("checked",true);	
		$("input:checkbox[id='<%=genre_value[2]%>']").prop("checked",true);	
  
	}
	
	//온로드시 movie_id에 맞는 등급연령 선택되어있도록(select box)
	 function rating(){
		$("#rating_id").val("<%=movie.getRating_id()%>").prop("selected",true);
	};

	//달력생성
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
	
	
</script>



</head>

<body >
	<%@ include file="../inc/main_navi.jsp"%>
	<div class="title">
	<h1>영화 수정</h1>
	</div>
		<form>
			<div class="genreDiv">
		
			<h4>1.장르선택(복수 가능 3개 이하)</h4>
			<input type="checkbox" id="hrror" name="genre_name" value="hrror" />호러
			<input type="checkbox" id="drama" name="genre_name" value="drama" />드라마
			<input type="checkbox" id="SF" name="genre_name" value="SF" />SF
			<input type="checkbox" id="romance" name="genre_name" value="romance" />로맨스
			<input type="checkbox" id="comic" name="genre_name" value="comic" />코믹
			<p>
			<input type="checkbox" id="ani" name="genre_name" value="ani" />애니메이션
			<input type="checkbox" id="noir" name="genre_name" value="noir" />느와르
			<input type="checkbox" id="docu" name="genre_name" value="docu" />다큐멘터리
			<input type="checkbox" id="music" name="genre_name" value="music" />음악
			<input type="checkbox" id="mystery" name="genre_name" value="mystery" />미스테리
			<p>
			<input type="checkbox" id="crime" name="genre_name" value="crime" />범죄
			<input type="checkbox" id="omnibus" name="genre_name" value="omnibus" />옴니버스
			<input type="checkbox" id="thriller" name="genre_name" value="thriller" />스릴러
			<input type="checkbox" id="sports" name="genre_name" value="sports" />스포츠
			<input type="checkbox" id="saguk" name="genre_name" value="saguk" />사극
			<p>
			<input type="checkbox" id="child" name="genre_name" value="child" />어린이
			<input type="checkbox" id="action" name="genre_name" value="action" />액션
			<input type="checkbox" id="adventure" name="genre_name" value="adventure" />어드벤쳐
			<input type="checkbox" id="history" name="genre_name" value="history" />역사
			<input type="checkbox" id="war" name="genre_name" value="war" />전쟁
		
			</p>
			</div>
			
		<div class="container">
		<h4>2.영화정보 입력</h4>
 			<input type="text" name="movie_id" id="tx1" value="<%=movie.getMovie_id()%>" readonly/>
			<input type="text" name="movie_name" placeholder="영화명" value="<%=movie.getMovie_name()%>"> 
			<input type="hidden" name="poster" id="poster" value="<%=movie.getPoster()%>"/>
			<select name="rating_id" id="rating_id">		
				<option >관람등급 선택</option>
				<option value="1">전체관람가</option>
				<option value="2">12세관람가</option>
				<option value="3">15세관람가</option>
				<option value="4">청소년관람불가</option>
			</select>
			
			
			 <input type="text" name="director" value="<%=movie.getDirector()%>">
			 <input type="text" name="actor" value="<%=movie.getActor()%>">
			 <input type="text" name="release" id="datepicker1" value="<%=movie.getRelease()%>">
			</div>
			<div class=bottom>
			 <h4>3.줄거리</h4>
			<textarea id="story" name="story" style="height: 200px"><%=movie.getStory() %></textarea>
			<p>
				대표이미지: <input type="file" name="repImg" id="repImg"><span>{<%=movie.getMovie_id()%>.<%=movie.getPoster()%>} </span>
			</p>
			
			<input type="button" value="글수정">
			<input type="button" value="글삭제" >
			<input type="button" value="목록보기" onClick="location.href='/admin/movie/list'">
			
			</div>
			
		</form>



</body>
</html>