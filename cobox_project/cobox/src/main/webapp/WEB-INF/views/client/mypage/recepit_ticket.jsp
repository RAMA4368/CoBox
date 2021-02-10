<%@ page contentType="text/html; charset=UTF-8"%>

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


      <h1>티켓 예매내역 확인</h1>

      <table>
         <tr>
            <th></th>
            <th>예매날짜</th>
            <th>상영날짜</th>
            <th>인원수</th>
            <th>영화제목</th>
         </tr>
         <tr>
            <td>1</td>
            <td>2020-04-01</td>
            <td>2020-04-02</td>
            <td>3</td>
            <td>관상</td>
         </tr>
         <tr>
            <td>2</td>
            <td>2020-05-21</td>
            <td>2020-05-22</td>
            <td>1</td>
            <td>도깨비</td>
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