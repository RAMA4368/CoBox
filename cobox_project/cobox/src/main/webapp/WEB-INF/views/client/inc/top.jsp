<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import ="com.koreait.cobox.model.domain.Member" %>
<!-- Banner -->


<script>
	function requestLogout() {
		$("#logout").attr({
			action : "/client/member/logout",
			method : "post"
		});
		$("#logout").submit();
	}
</script>

<!-- Header section -->
<header class="header-wrapper">
	<div class="container">
		<!-- Logo link-->
		<a href='/' class="logo"> <img alt='logo'
			src="/resources/images/logo.png">
		</a>

		<!-- Main website navigation-->
		<nav id="navigation-box">
			<!-- Toggle for mobile menu mode -->
			<a href="#" id="navigation-toggle"> <span class="menu-icon">
					<span class="icon-toggle" role="button"
					aria-label="Toggle Navigation"> <span class="lines"></span>
				</span>
			</span>
			</a>

			<!-- Link navigation -->
			<ul id="navigation">
				<li><span class="sub-nav-toggle plus"></span> <a
					href="/client/movie/list">영화</a></li>
				<li><span class="sub-nav-toggle plus"></span> 
				<%-- <%if(session.getAttribute("member")!=null){ %> --%>
				<a href="/client/movie/reservation">영화예매</a></li>
				<%-- <%}else{ %> --%>
				<!-- <a href="javascript:alert('로그인 해주세요!')">영화예매</a></li> -->
				<%-- <%} %> --%>
				<li><span class="sub-nav-toggle plus"></span> <a
					href="/client/snack/list">스낵</a></li>
				<li><span class="sub-nav-toggle plus"></span> <a
					href="/client/notice/list">공지사항</a></li>
				<li><span class="sub-nav-toggle plus"></span> <a
					href="/client/cart/list">Cart</a></li>
			</ul>
		</nav>

		<!-- Additional header buttons / Auth and direct link to booking-->
		<div class="control-panel">
			<%
			if (session.getAttribute("member") == null) {
			%>
			<a href="/client/member/formtable" id="login"
				style="color: #ffffff; width: 17px; height: 20px; background-color: #F2A14B; border-radius: 3px; font: 12px 'aleobold', sans-serif; text-transform: uppercase; transition: 0.5s; padding: 7px 20px; margin-top: 30px;">Login</a>
			<%
			} else {
			%>
			<a href="/client/mypage" id="Mypage"
				style="color: #ffffff; width: 17px; height: 20px; background-color: #E35822; border-radius: 3px; font: 12px 'aleobold', sans-serif; text-transform: uppercase; transition: 0.5s; padding: 7px 20px; margin-top: 30px;">Mypage</a>
			<a href="/client/member/logout" id="logout"
				style="color: #ffffff; width: 17px; height: 20px; background-color: #F2A14B; border-radius: 3px; font: 12px 'aleobold', sans-serif; text-transform: uppercase; transition: 0.5s; padding: 7px 20px; margin-top: 30px;">Logout</a>
			<%
			}
			%>
		</div>

	</div>
	
</header>