<%@page import="com.koreait.cobox.model.domain.TopCategory"%>
<%@page import="com.koreait.cobox.model.domain.Snack"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<TopCategory> topList = (List)request.getAttribute("topList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../inc/header.jsp" %>
<title>Insert title here</title>
<style>
input[type=text]{
  width: 7%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
select{
  width: 15%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  margin-left: 20px;
  resize: vertical;
}

#category-area table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 24%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 30%;
  height: 300px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
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
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 70%;
  border-left: none;
  height: 300px;
}
</style>
<script>
var subList = null;
$(function(){
	$($("select")[0]).change(function(){
		getSubList(this);
	});
});

function getSubList(obj) {
	//alert($(obj).val());
	
	$.ajax({
		url:"/admin/snack/sublist?topcategory_id="+$(obj).val(),
		type:"get",
		data:{
			topcategory_id:$(obj).val()
		},
		success:function(result){
			//alert(result);
			/*
			$("#category-area").html("");		
				var tag="<table width=\"25%\" border=\"1px\">";
				tag+="<tr>";
				tag+="<th>품목 목록</th>";
				tag+="</tr>";
				
				for(var i=0; i<result.length; i++){
				subList = result[i];
	
				tag+="<tr>";
				tag+="<td onClick=\"detail()\">"+subList.snack_name+"</td>";
				tag+="</tr>";				
				}
				tag+="</table>";
			$("#category-area").append(tag);
			*/
			//여기에 가져왔어... subList를 가져왔어...
			//select * from snack where topcategory_id=? 이걸 리스트로 담아왔어
			//그럼 선택한 topcategory_id > 스낵의 모든 정보가 list로 넘어와있다..
			//이걸 뿌리면 된다!!!!!
			
			/*----- 최종 성공코드!! (사이드 탭!)
			밑에 div는 이렇게 해놓기!
			<div class="tab" id="dsjfdlskjtlksdf">

			</div>
			
			
			$("#dsjfdlskjtlksdf").html("");
			var tags = null;
			for(var i=0; i<result.length; i++){
				subList = result[i];
				tags+="<button  class=\"tablinks\" onclick=\"openCity(event, '"+subList.snack_id+"')\" id=\"defaultOpen\">"+subList.snack_name+"</button>";
				
			}
			$("#dsjfdlskjtlksdf").append(tags);
			-----*/
			/*------------------------------------------가격이 나오긴 하는데... 실패
			$("#dsjfdlskjtlksdf").html("");
			$(".tabcontent").html("");
			var tags = null;
			var please = null;
			for(var i=0; i<result.length; i++){
				subList = result[i];
				tags+="<button  class=\"tablinks\" onclick=\"openCity(event, '"+subList.snack_id+"')\" id=\"defaultOpen\">"+subList.snack_name+"</button>";
				
			}
			please+="<div id=\""+subList.snack_id+"\">";
			please+="<h3>"+subList.price+"</h3>";
			please+="<p>London is the capital city of England.</p>";
			please+="</div>";
				
			$("#dsjfdlskjtlksdf").append(tags);
			$(".tabcontent").append(please);
			*/
			
			/*------------------------------------------------
			$("#dsjfdlskjtlksdf").html("");
			var tags = null;
			for(var i=0; i<result.length; i++){
				subList = result[i];
				tags+="<button  class=\"tablinks\" onclick=\"openCity(event, 'snack"+subList.snack_id+"')\" id=\"defaultOpen\">"+subList.snack_name+"</button>";
				$.ajax({
					url:"/admin/snack/detail,
					type:"get",
					data:{
						snack_id:subList.snack_id
					},
					success:function(result){
						$(".tabcontent").html("");
						var please = null;
						
						Snack snack = result;
							please+="<div id=\"snack"+snack.snack_id+"\">";
							please+="<h3>"+snack.price+"</h3>";
							please+="<p>"+snack.amount+"</p>";
							please+="</div>";
							
						
						$(".tabcontent").append(please);
					}
				});
			}
			$("#dsjfdlskjtlksdf").append(tags);
			-----------------------------------------------*/
			
			
			
			
			
			
		}
	});
}

function detail(){
	alert();
}
</script>
</head>
<body>
<%@ include file="../inc/main_navi.jsp" %>
<h3>Snack 관리</h3>
<div class="container">
	<form>
		<input type="text" value="품목 구분">
		<select name="topcategory_id">
			<option>카테고리 선택</option>
			<%for(TopCategory topCategory : topList){%>
			<option value="<%=topCategory.getTopcategory_id() %>" ><%=topCategory.getName() %></option>
			<%} %>
		</select>
		<br><br>
	</form>
	
	<div id="category-area"></div>
	
</div>


<h2>Vertical Tabs</h2>
<p>Click on the buttons inside the tabbed menu:</p>

<div class="tab">
<%for(int i=0; i<3; i++){ %>
  <button class="tablinks" onclick="openCity(event, '변수명0')" >London</button>
  <button class="tablinks" onclick="openCity(event, '변수명1')">Paris</button>
  <button class="tablinks" onclick="openCity(event, '변수명2')">Tokyo</button>
  <%} %>
</div>

<div id="변수명0" class="tabcontent">
  <h3>변수명0</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="변수명1" class="tabcontent">
  <h3>변수명1</h3>
  <p>Paris is the capital of France.</p> 
</div>

<div id="변수명2" class="tabcontent">
  <h3>변수명2</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>


<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

</body>
</html>