<%@ page contentType="text/html; charset=UTF-8"%>
<%
   String seat_name= request.getParameter("seat_name");
   session.setAttribute("seat_name", seat_name);
%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
</head>
<style>

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
   alert("코로나로 인해 축소운영합니다 :) ");
}); 

function change(obj){
   alert();
   if(obj.getAttribute('class') == 'sits__place sits-price--middle'){ 
      obj.setAttribute('class', 'sits__place sits-price--cheap sits-state--not'); 
   }else{
      // obj.removeAttribute('class'); 
      obj.setAttribute('class', 'sits__place sits-price--cheap sits-state--not'); 
   }; 
}

</script>
<body class="single-cin">
<div class="wrapper">
   <%@include file="../inc/top.jsp"%>
   <!-- Main content -->
   <div class="place-form-area">
      <section class="container">
      <h2 class="page-heading">Reservation</h2>
         <div class="order-step-area">
            <div class="order-step first--step">1.영화/상영관/날짜</div>
            <div class="order-step second--step">2.좌석선택</div>
         </div>

         <div class="choose-sits">
            <div class="choose-sits__info choose-sits__info--first">
               <ul>
                  <li class="sits-price marker--none"><strong>Price</strong></li>
                  <!-- <li class="sits-price sits-price--cheap">$10</li> -->
                  <li class="sits-price sits-price--middle">100,000원</li>
                  <!-- <li class="sits-price sits-price--expensive">$30</li> -->
               </ul>
            </div>

            <div class="choose-sits__info">
               <ul>
                  <li class="sits-state sits-state--not">Not available</li>
                  <li class="sits-state sits-state--your">Your choice</li>
               </ul>
            </div>

               <div class="col-sm-12 col-lg-10 col-lg-offset-1">
                  <div class="sits-area hidden-xs">
                     <div class="sits-anchor">screen</div>

                     <div class="sits">
                        <aside class="sits__line">
                           <span class="sits__indecator">A</span>
                           <span class="sits__indecator">B</span>
                           <span class="sits__indecator">C</span>
                           <span class="sits__indecator">D</span>
                           <span class="sits__indecator">E</span>
                           <span class="sits__indecator">F</span>
                           <span class="sits__indecator">G</span>
                           <span class="sits__indecator">I</span>
                           <span class="sits__indecator additional-margin">J</span>
                           <span class="sits__indecator">K</span>
                           <span class="sits__indecator">L</span>
                        </aside>
                        
                        <div class="sits__row" >
                        <%for(int i=2;i<18;i++){ %>
                           <span class="sits__place sits-price--cheap sits-state--not" data-place='A<%=i %>' data-price='10'>A<%=i%></span>
                        <%} %>
                        </div>

                        <div class="sits__row">
                        <%for(int i=1;i<19;i++){ %>
                           <span class="sits__place sits-price--cheap sits-state--not" data-place='B<%=i %>' data-price='10'>B<%=i%></span>
                        <%} %>
                        </div>

                        <div class="sits__row">
                        <%for(int i=1;i<19;i++){ %>
                           <span class="sits__place sits-price--cheap " data-place='C<%=i %>' data-price='10'>C<%=i%></span>
                        <%} %>
                        </div>

                        <div class="sits__row">
                        <%for(int i=1;i<19;i++){ %>
                           <span class="sits__place sits-price--cheap sits-state--not" data-place='D<%=i %>' data-price='10'>D<%=i%></span>
                        <%} %>
                        </div>
                        
                        <div class="sits__row" id="button" >
                        <%for(int i=1;i<19;i++){ %>
                           <span id="useSeat" onclick="change(this)" class="sits__place sits-price--middle " data-place='E<%=i %>' data-price='20'>E<%=i %></span>                        
                        <%} %>
                        </div>
                        
                        <div class="sits__row">
                        <%for(int i=1;i<19;i++){ %>
                           <span class="sits__place sits-price--middle sits-state--not" data-place='F<%=i %>' data-price='20'>F<%=i %></span>                        
                        <%} %>
                        </div>
                        
                        <div class="sits__row">
                        <%for(int i=1;i<19;i++){ %>
                           <span class="sits__place sits-price--middle sits-state--not" data-place='G<%=i %>' data-price='20'>G<%=i %></span>                        
                        <%} %>
                        </div>
                        
                        <div class="sits__row">
                        <%for(int i=3;i<17;i++){ %>
                           <span class="sits__place sits-price--middle sits-state--not" data-place='I<%=i %>' data-price='20'>I<%=i %></span>                        
                        <%} %>
                        </div>

                        <div class="sits__row additional-margin">
                        <%for(int i=5;i<15;i++){ %>
                           <span class="sits__place sits-price--expensive sits-state--not" data-place='J<%=i %>' data-price='20'>J<%=i %></span>                        
                        <%} %>
                        </div>
                        
                        <div class="sits__row">
                        <%for(int i=5;i<15;i++){ %>
                           <span class="sits__place sits-price--expensive sits-state--not" data-place='K<%=i %>' data-price='20'>K<%=i %></span>                        
                        <%} %>
                        </div>
                        
                        <div class="sits__row">
                        <%for(int i=6;i<14;i++){ %>
                           <span class="sits__place sits-price--expensive sits-state--not" data-place='L<%=i %>' data-price='20'>L<%=i %></span>                        
                        <%} %>
                        </div>
                        
                  <!-- 체크한 좌석 나오는 부분  -->
                        <aside class="sits__checked">
                           <div class="checked-place"></div>
                           <div class="checked-result">$0</div>
                        </aside>
                        <footer class="sits__number">
                        <%for(int i=1;i<19;i++){ %>
                           <span class="sits__indecator"><%=i %></span>
                        <%} %>
                        </footer>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </div>
   </div>
   
<!--    <form id='film-and-time' class="booking-form" method='get' action='/client/movie/reservation3'>
      <input type='text' name='choosen-number' class="choosen-number">
      <input type='text' name='choosen-number--cheap' class="choosen-number--cheap"> 
      <input type='text' name='choosen-number--middle' class="choosen-number--middle">
      <input type='text' name='choosen-number--expansive' class="choosen-number--expansive">
      <input type='text' name='choosen-cost' class="choosen-cost">
      <input type='text'name='choosen-sits' class="choosen-sits">
   </form> -->

      <div class="booking-pagination booking-pagination--margin">
         <a href="/client/movie/reservation" class="booking-pagination__prev"> 
            <span class="arrow__text arrow--prev">prev step</span>
            <span class="arrow__info">영화예매</span>
         </a> 
         <a href="/client/movie/reservation3" class="booking-pagination__next" onClick="alert('로그인이 필요한 서비스입니다.')">
            <span class="arrow__text arrow--next">next step</span> 
            <span class="arrow__info">결제하기</span>
         </a>
      </div>
<%@include file="../inc/footer.jsp"%>
<%@include file="../inc/script.jsp"%>
<!-- <script type="text/javascript">
   $(document).ready(function() {
      init_BookingTwo();
   });
</script> -->
</body>
</html>