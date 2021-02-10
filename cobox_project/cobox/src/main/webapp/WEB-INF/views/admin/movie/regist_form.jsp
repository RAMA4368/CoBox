
<%@page import="com.koreait.cobox.model.domain.Rating"%>
<%@page import="com.koreait.cobox.model.domain.Genre"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
List<Genre> genreList = (List) request.getAttribute("genreList");
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
</style>
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
var genre=[];//선택한 장르사이즈를 담는 배열

	$(function(){
		CKEDITOR.replace("story");
		
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
		
	
	
	//달력생성
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
	//장르 선택시 
	//영화 등록 (이미지 첨부 필수)
	function regist(){
		var formData = new FormData($("form")[0]);
		//파일 업로드 여부 확인하기
		var fileCheck = document.getElementById("repImg").value;
		if(!fileCheck){
			alert("영화 이미지를 첨부하세요");
			return false;
		}
		//폼데이터에 에디터값 추가하기
		formData.append("story",CKEDITOR.instances["story"].getData());
		for(var i=0;i<genre.length;i++){
			formData.append("genre["+i+"].genre_name",genre[i]);
		}
		/*비동기 업로드*/
		$.ajax({
			url:"/admin/movie/regist",
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

	
	
</script>



</head>

<body>
	<%@ include file="../inc/main_navi.jsp"%>
	<div class="title">
	<h1>영화 등록</h1>
	</div>
	<div class="genreDiv">
		<form>
			<h4>1.장르선택(복수 가능 3개 이하)</h4>
			<input type="checkbox" id="genre_name" name="genre_name" value="hrror" />호러
			<input type="checkbox" id="genre_name" name="genre_name" value="drama" />드라마
			<input type="checkbox" id="genre_name" name="genre_name" value="SF" />SF
			<input type="checkbox" id="genre_name" name="genre_name" value="romance" />로맨스
			<input type="checkbox" id="genre_name" name="genre_name" value="comic" />코믹
			<p>
			<input type="checkbox" id="genre_name" name="genre_name" value="ani" />애니메이션
			<input type="checkbox" id="genre_name" name="genre_name" value="noir" />느와르
			<input type="checkbox" id="genre_name" name="genre_name" value="docu" />다큐멘터리
			<input type="checkbox" id="genre_name" name="genre_name" value="music" />음악
			<input type="checkbox" id="genre_name" name="genre_name" value="mystery" />미스테리
			<p>
			<input type="checkbox" id="genre_name" name="genre_name" value="crime" />범죄
			<input type="checkbox" id="genre_name" name="genre_name" value="omnibus" />옴니버스
			<input type="checkbox" id="genre_name" name="genre_name" value="thriller" />스릴러
			<input type="checkbox" id="genre_name" name="genre_name" value="sports" />스포츠
			<input type="checkbox" id="genre_name" name="genre_name" value="saguk" />사극
			<p>
			<input type="checkbox" id="genre_name" name="genre_name" value="child" />어린이
			<input type="checkbox" id="genre_name" name="genre_name" value="action" />액션
			<input type="checkbox" id="genre_name" name="genre_name" value="adventure" />어드벤쳐
			<input type="checkbox" id="genre_name" name="genre_name" value="history" />역사
			<input type="checkbox" id="genre_name" name="genre_name" value="war" />전쟁
		</p>
		</div>
		
		<div class="container">
			<h4>2.영화정보 입력</h4>
			<input type="text" name="movie_name" placeholder="영화명" id=""> 

			<select name="rating_id">		
				<option >관람등급 선택</option>
				<option value="1">전체관람가</option>
				<option value="2">12세관람가</option>
				<option value="3">15세관람가</option>
				<option value="4">청소년관람불가</option>
			</select>
			
			 <input type="text" name="director" placeholder="감독">
			 <input type="text" name="actor" placeholder="배우">
			 <input type="text" name="release" placeholder="개봉일" id="datepicker1">
			</div>
			<div class=bottom>
			 <h4>3.줄거리</h4>
			<textarea id="story" name="story" placeholder="영화 줄거리" style="height: 200px"></textarea>

			
			<p>
				대표이미지: <input type="file" name="repImg" id="repImg">
			</p>

			<input type="button" value="글등록" onClick="regist()" id="registBtn"> 
			<input type="button" value="목록보기" onClick="location.href='/admin/movie/list'">
			</div>
		</form>
	

</body>
</html>