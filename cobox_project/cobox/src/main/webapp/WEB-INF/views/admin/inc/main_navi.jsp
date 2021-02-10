<%@ page contentType="text/html; charset=UTF-8"%>
<div class="navbar">
  <a href="/admin/secure">Home</a>
  <div class="dropdown">
    <button class="dropbtn">식품관리 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="/admin/snack/list">스낵 목록</a>
      <a href="/admin/snack/registform">스낵 등록</a>
      <!-- <a href="/admin/snack/snackmanager">스낵 관리</a> -->
    </div>
  </div> 
  <!-- <div class="dropdown">
    <button class="dropbtn">회원관리 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">회원정보</a>
      <a href="#">회원예매정보관리</a>
      <a href="#">Link 3</a>
    </div>
  </div>  -->
  <div class="dropdown">
    <button class="dropbtn">영화관리
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="/admin/movie/list">영화목록</a>
      <a href="/admin/movie/registform">영화 등록</a>
      <!-- <a href="#">좌석관리</a>
      <a href="#">영화댓글관리</a> -->
    </div>
  </div> 
<div class="dropdown">
    <button class="dropbtn">게시판 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="/admin/notice/list">공지사항게시판</a>
      <a href="#">문의게시판</a>
    </div>
  </div> 
  
</div>