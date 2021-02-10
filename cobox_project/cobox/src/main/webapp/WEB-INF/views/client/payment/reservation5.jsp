<%@page import="com.koreait.cobox.model.common.MessageData"%>
<%@page import="com.koreait.cobox.model.domain.Mcart"%>
<%@page import="com.koreait.cobox.model.domain.Schedule"%>
<%@page import="com.koreait.cobox.model.domain.Theater"%>
<%@page import="com.koreait.cobox.model.domain.Location"%>
<%@page import="com.koreait.cobox.model.domain.Movie"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
List<Movie> movieList = (List) request.getAttribute("movieList");
List<Location> locationList = (List) request.getAttribute("locationList");
List<Mcart> mcartList=(List)request.getAttribute("mcartList");
MessageData messageData=(MessageData)request.getAttribute("messageData"); //moviecart에서 alert뿌려줄 messageData가져오기
%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<%@include file="../inc/script.jsp"%>
</head>
<style>
* {
   box-sizing: border-box;
}
body {
   font-family: Arial, Helvetica, sans-serif;
}
h3{
   margin-bottom:30px;
}
/*사진 */
/* Float four columns side by side */
.column {
   float: left;
   width: 30%;
   padding: 0 15px;
   
}
/* Responsive columns */
@media screen and (max-width: 600px) {
   .column {
      width: 100%;
      display: block;
      margin-bottom: 20px;
      
   }
}
/* Style the counter cards */
.card {
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
   padding: 14px;
   text-align: center;
   background-color: #f1f1f1;
   width:100%;
   height:500px;
   overflow:scroll;
   
}
#pic{
   width:300px;
   height:150px;
}
/*극장st */
/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 30%;
}
/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 9.5px 12px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}
/* Change background color of buttons on hover */
.tab button:hover {
  background-color: skyblue;
}
/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #fff;
}
/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 70%;
  border-left: none;
  height:100%;
}
#birthday{
   width:230px;
   height:30px;
}
/*시간버튼  */ 
#time{
   width:230px;
   height:30px;
   margin-top:20px;
}
input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top:100%;
}
input[type=button]:hover {
  background-color: #45a049;
}
.movie_poster{
   width: 300px;
   height: 500px;
}
.selectMovie{
   font-style: oblique;
   font-size: 20px;
   font-weight: bold;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

//비동기 극장가져오기
function getTheaterList(obj) {
   //alert();
   $.ajax({
      url:"/client/movie/theater",
      type:"get",
       data:{
         location_id:$(obj).val()
      }, 
      success:function(result){
         //alert("서버로 부터 받은 결과는 "+result);
         $("#tselect").empty();
            
         for(var i=0;i<result.length;i++){
            var theater=result[i];
            $("#tselect").append("<input name=\"theater.theater_id\" type=\"hidden\" value=\""+theater.theater_id+"\"><button id=\"btn"+i+"\" type=\"button\" style =\"font-size:1em;\">"+theater.theater_name+"</button></input>");
         } 
      } 
   });   
}

function next(){
   if (confirm("좌석선택 단계로 넘어가시겠습니까??")) {
      var form = document.querySelector("form");
      form.action="/client/movie/reserRegist";
      form.method="post";
   }
   form.submit();
}
function test(){
	alert();
}


function myFunction(imgs) {
	
  var expandImg = document.getElementById("expandedImg");
  var imgText = document.getElementById("imgtext");
  expandImg.src = imgs.src;
  imgText.innerHTML = imgs.alt;
  expandImg.parentElement.style.display = "block";
}


$(function() {
   var selectLocation = document.getElementById("selectLocation");
   for (var i = 0; i < 8; i++) {
      $("#location_id"+i).click(function(obj) {
         //alert($(this).text());
         selectLocation.innerHTML =$(this).text();
      });
   }
});
</script>

<%@include file="../inc/top.jsp"%>
<body>
   <section class="container">
   <form id="movie_form">
      <h2 class="page-heading">Reservation</h2>
      <div class="order-step-area">
         <div class="order-step first--step">1.영화/상영관/날짜</div>
         <div class="order-step second--step order-step--disable">2.좌석선택</div>
           <div class="order-step third--step order-step--disable">3.결제하기</div>
      </div>

         <h2 class="page-heading heading--outcontainer">찜한 영화</h2>
	
	
	<div class="cinema-wrap">
                        <div class="row">
                          <%for(Mcart mcart:mcartList){ %>
                           
                            <div class="col-xs-6 col-sm-3 cinema-item">
                                <div class="cinema">
                                <input name="mcart.movie_id" type="hidden" value="<%=mcart.getMovie_id()%>"/>
                                    <a href="javascript:myFunction(this)" class="cinema__images" >
                                        <img alt="<%=mcart.getMovie_name() %>" src="/resources/data/movie/<%=mcart.getMovie_id()%>.<%=mcart.getPoster()%>" name="movie_id" id="<%=mcart.getMovie_id()%>" alt="<%=mcart.getMovie_name() %>">
                                      	<span class="cinema-rating">5.0</span> 
                                    </a>
                                    <a href="single-cinema.html" class="cinema-title"><%=mcart.getMovie_name()%>/   개봉일 <%=mcart.getRelease() %> </a>
                                </div>
                            </div>
                               <%} %>
                           
                       </div>
    </div>
    
         <div class="row">
         
            <%-- <div class="column">
               <h3>영화선택</h3>
               <div class="card">
                  <div class="thumbnail clearfix">
                  <%for(int i=0;i<movieList.size();i++){%>
                  <%Movie movie=movieList.get(i); %>
                     <input name="movie.movie_id" type="hidden" value="<%=movie.getMovie_id()%>"/>
                     <img onclick="myFunction(this)" name="movie_id" id="<%=movie.getMovie_id()%>" src="/resources/data/movie/<%=movie.getMovie_id()%>.<%=movie.getPoster() %>" alt="<%=movie.getMovie_name() %>" class="movie_poster" style='margin-right:10px'>
                        <h4><a href="/client/movie/detail?movie_id=<%=movie.getMovie_id() %>" ><%=movie.getMovie_name() %></a></h4>
                  <%} %>
                  </div>
               </div>
            </div> --%>
           
            <div class="column">
               <div>
               <h3>극장선택</h3>
               </div>
               <div class="card">
                  <div class="tab">
                     <%for(int i=0;i<locationList.size();i++){ %>
                     <%Location location=locationList.get(i); %>
                          <button onclick="getTheaterList(this)" type="button" name="location_id" id="location_id<%=i %>"  value="<%=location.getLocation_id()%>"><span><%=location.getLoc_name() %></span></button>
                     <%} %>     
                  </div>
                  <!--극장선택-->
                  <div class="tabcontent tab" id="tselect">
                  </div>
               </div>
            </div>
   
            <div class="column">
               <h3>시간선택</h3>
               <div class="card">
                    <label >날짜</label>
                    <input type="date" id="sdate" name="sdate" onchange="date_click()">
                    <div>
                       <img id="expandedImg" style="width:200px">
                     <div class="selectMovie" id="imgtext"></div>
                     <div class="selectMovie" id="selectLocation"></div>
                    </div>
                     <label for="country">시간</label>
                      <select name="stime" id="stime" onchange="time_click()">
                        <option value="시간선택">시간선택</option>
                        <option value="10:00">10:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:30">13:30</option>
                        <option value="14:40">14:40</option>
                        <option value="15:30">15:30</option>
                        <option value="17:00">17:00</option>
                        <option value="19:20">19:20</option>
                        <option value="20:30">20:30</option>
                        <option value="22:00">22:00</option>
                      </select>
                      <input type="button" value="다음" onclick="next()">
               </div>
            </div>
         </div>
        
      </form>
      
   </section>
   <%@include file="../inc/footer.jsp"%>
</body>
</html>