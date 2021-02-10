<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.koreait.cobox.model.domain.Member"%>
<%
Member member = (Member) request.getAttribute("member");
%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<%@include file="../inc/script.jsp"%>

<style>
h1 {
   font: bold; 
   font-family : "Verdana";
   color: #E35822;
   text-align: center;
   padding: 18px;
   text-align: center;
   font-family: "Verdana";
}

table, td, th {
   font-size: 22px;
   text-align: center;
   border: solid 5px black;
   padding: 15px;
   height: 15px;
}

table {
   width: 80%;
   border-collapse: collapse;
   margin: auto;
}
</style>
</head>
<body class="single-cin">
   <div class="wrapper">
      <%@ include file="../inc/top.jsp"%>
      <!-- Main content -->
      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


      <h1>스낵 구매내역 확인</h1>

      <table>
         <tr>
            <th>구매날짜</th>
            <th>상품명</th>
            <th>구매금액</th>
         </tr>
         <tr>
            <td>2020-08-22</td>
            <td>나쵸</td>
            <td>370,000</td>
         </tr>
         <tr>
            <td>2021-01-03</td>
            <td>핫도그</td>
            <td>8,000</td>
         </tr>

      </table>

      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기에 필요한 코드 짜기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
      <%@include file="../inc/footer.jsp"%>
   </div>
   <!-- Custom -->
   <script src="/resources/js/custom.js"></script>
   <script type="text/javascript">
      $(document).ready(function() {
         init_Home();
      });
   </script>
</body>
</html>