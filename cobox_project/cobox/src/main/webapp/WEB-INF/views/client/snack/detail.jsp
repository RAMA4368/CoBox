<%@page import="com.koreait.cobox.model.common.Formatter"%>
<%@page import="com.koreait.cobox.model.domain.Snack"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Snack snack = (Snack)request.getAttribute("snack");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<%@ include file="../inc/header.jsp"%>
        <meta charset="utf-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> Goshop HTML Theme || Product Detail Page</title>

        <!-- Favicon -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="shortcut icon" href="/resources/assets/ico/favicon.ico">

        <!-- CSS Global -->
        <link href="/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">        
        <link href="/resources/assets/plugins/bootstrap-select-1.9.3/dist/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">         
        <link href="/resources/assets/plugins/owl-carousel2/assets/owl.carousel.css" rel="stylesheet" type="text/css"> 
        <link href="/resources/assets/plugins/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css">   
        <link href="/resources/assets/plugins/royalslider/skins/universal/rs-universal.css" rel="stylesheet">
        <link href="/resources/assets/plugins/royalslider/royalslider.css" rel="stylesheet">
        <link href="/resources/assets/plugins/subscribe-better-master/subscribe-better.css" rel="stylesheet" type="text/css">

        <!-- Icons Font CSS -->
        <link href="/resources/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 

        <!-- Theme CSS -->
        <link href="/resources/assets/css/style.css" rel="stylesheet" type="text/css">
        <link href="/resources/assets/css/header.css" rel="stylesheet" type="text/css"> 

        <!--[if lt IE 9]>
       <script src="/resources/assets/plugins/iesupport/html5shiv.js"></script>
       <script src="/resources/assets/plugins/iesupport/respond.js"></script>
       <![endif]-->
	<script>
	function addCart(){
		var formData = $("#cart_form").serialize();
		$.ajax({
			url:"/client/cart/regist",
			type:"post",
			data:formData,
			success:function(responseData){
				if(responseData.resultCode==1){
					if(confirm(responseData.msg+"\n장바구니로 이동하시겠습니까?")){
						location.href=responseData.url;					
					}
				}else{
					alert(responseData.msg);
				}
			}
			
		});
	}
	
	</script>
    </head>
    <body class="single single-product woocommerce woocommerce-page">
		<%@include file="../inc/top.jsp"%>

        <!-- CONTENT + SIDEBAR -->
        <div class="main-wrapper clearfix">
            <div class="theme-container container">
                <main id="main-content" class="main-content">                  
                    <div itemscope itemtype="http://schema.org/Product" class="product has-post-thumbnail product-type-variable">

                        <div class="row">
                            <div class="col-lg-6 col-md-8 col-sm-10 col-xs-12">
                                
                                     <img  src="/resources/data/snack/<%=snack.getSnack_id() %>.<%=snack.getFilename() %>" alt="" >
                               
                            </div>
                            <div class="spc-15 hidden-lg clear"></div>
                            <div class="col-lg-6 col-sm-12 col-md-12 col-xs-12">
                                <div class="summary entry-summary">
                                    <div class="woocommerce-product-rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                                        

                                        <div  class="posted_in">
                                            <h3 class="funky-font-2 fsz-20">Cobox</h3>
                                        </div>
                                    </div>

                                    <div class="product_title_wrapper">
                                        <div itemprop="name" class="product_title entry-title">
                                            <%=snack.getSnack_name() %> <span class="thm-clr"></span>
                                            <p class="font-3 fsz-18 no-mrgn price"> <b class="amount blk-clr"><%=Formatter.getCurrency(snack.getPrice()) %></b>  </p>       
                                        </div>
                                    </div>

                                    <div itemprop="description" class="fsz-15">
                                        <p><%=snack.getDetail() %></p>                                  
                                    </div>


                                    <form id="cart_form" class="variations_form cart" >
                                        <div class="row">
                                           <input type="hidden" name="snack_id" value="<%=snack.getSnack_id()%>">
                                            <div class="col-sm-4">
                                                <div class="form-group selectpicker-wrapper">
                                                    <label class="fsz-15 title-3"> <b> QUANTITY </b> </label>
                                                    <div class="search-selectpicker selectpicker-wrapper">
                                                        <div class="quantity">
						                                    <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
						                                    <input type="number" name="quantity" class="qty-text" id="qty" step="1" min="1" max="12" value="1">
						                                    <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
					                                	</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <button type="button" class="single_add_to_cart_button button alt fancy-button left" onClick="addCart()">Add to cart</button>
                                                </div>    
                                            </div>
                                        </div>
                                    </form>
                                </div><!-- .summary -->
                            </div>
                        </div>
                        <div class="clearfix"></div>

        <%@include file="../inc/footer.jsp"%>     
        <!-- Top -->
        <div class="to-top" id="to-top"> <i class="fa fa-long-arrow-up"></i> </div>

        <!-- JS Global -->
        <script src="/resources/assets/plugins/jquery/jquery-2.1.3.js"></script>  
        <script src="/resources/assets/plugins/royalslider/jquery.royalslider.min.js"></script>
        <script src="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="/resources/assets/plugins/bootstrap-select-1.9.3/dist/js/bootstrap-select.min.js"></script>             
        <script src="/resources/assets/plugins/owl-carousel2/owl.carousel.min.js"></script> 
        <script src="/resources/assets/plugins/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js"></script> 
        <script src="/resources/assets/plugins/isotope-master/dist/isotope.pkgd.min.js"></script>  

        <!-- Page JS -->      
        <script src="/resources/assets/js/jquery.sticky.js"></script>
        <script src="/resources/assets/js/custom.js"></script>
    </body>
</html>