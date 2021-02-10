<%@page import="com.koreait.cobox.model.common.MessageData"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
MessageData messageData=(MessageData)request.getAttribute("messageData");


%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript">

		alert("<%=messageData.getMsg()%>");
		<%if(messageData.getUrl()!=null){%>
		location.href="<%=messageData.getUrl()%>";
		<%}%>
		
</script>
<style>


</style>

</head>
<body>

</body>
</html>