<%@page import="com.koreait.cobox.model.domain.Paymethod"%>
<%@page import="com.koreait.cobox.model.common.Formatter"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.cobox.model.domain.Cart"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList = (List)request.getAttribute("cartList");
	List<Paymethod> paymethodList = (List)request.getAttribute("paymethodList");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
    	<%@ include file="../inc/header.jsp"%>
        <meta charset="utf-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> Goshop HTML Theme || Checkout</title>

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
		function orderFinish(){
			alert("주문이 완료되었습니다");
			location.href="/client/main"
		}
		
		</script>


    </head>
    <body class="woocommerce-checkout">
		<%@include file="../inc/top.jsp"%>
        

        <!-- CONTENT + SIDEBAR -->
        <div class="main-wrapper clearfix">
            

            <div class="container theme-container">
                <main id="main-content" class="main-container" itemprop="mainContentOfPage" itemscope="itemscope" itemtype="http://schema.org/Blog">
                    <article itemscope="itemscope" itemtype="http://schema.org/BlogPosting" itemprop="blogPost">

                                    <div id="order_review" class="woocommerce-checkout-review-order ">
                                        <div class="col-lg-6 col-sm-6 border">
                                            <div class="chck-ttl">
                                                <h4 id="order_review_heading" class="cart-title-highlight title-3">Your order</h4>
                                                <table class="shop_table woocommerce-checkout-review-order-table">
                                                    <thead>
                                                        <tr>
                                                            <th class="product-name">Product</th>
                                                            <th class="product-total">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    	<%int sum=0; %>
                                                    	<%for(Cart cart : cartList){ %>
                                                        <tr class="cart_item">
                                                            <td class="product-name"><%=cart.getSnack_name() %><strong class="product-quantity">&times; <%=cart.getQuantity() %></strong></td>
                                                            <td class="product-total"><b class="amount"><%=Formatter.getCurrency(cart.getPrice()*cart.getQuantity()) %></b></td>
                                                        </tr>
                                                        <%sum = sum + (cart.getPrice()*cart.getQuantity()); %>
                                                        <%} %>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Sub Total:</th>
                                                            <td><span class="drk-gry"><%=Formatter.getCurrency(sum) %></span></td>
                                                        </tr>

                                                        
                                                        <tr class="shipping">
                                                            <th><!-- Promo Discount : --></th>
                                                            <td>
                                                                <b class="drk-gry"><!-- 50% --></b>
                                                            </td>
                                                        </tr>
                                                        <tr class="order-total">
                                                            <th>Order Total</th>
                                                            <td><b class="amount"><%=Formatter.getCurrency(sum) %></b> </td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="payment" class="col-lg-6 col-sm-6 border woocommerce-checkout-payment">
                                            <h4 class="cart-title-highlight title-3">Your Payment</h4>

                                            <div class="woocommerce-checkout-payment-inner">
                                                <ul class="payment_methods methods list-unstyled">
                                                
                                                
                                                
                                                
                                                	<%for(Paymethod paymethod : paymethodList){ %>
                                                    <li class="payment_method_bacs">
                                                        <div class="form-group">
                                                            <label class="radio-inline"> <input type="radio" value="" name="payment_method"> <span><%=paymethod.getMname() %></span>  </label>
                                                        </div>

                                                        <div class="payment_box payment_method_bacs" >
                                                            <p></p>
                                                        </div>
                                                    </li>                                                    
													<%} %>



                                                </ul>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="wc-proceed-to-checkout text-center">
                                            <a class="checkout-button button alt wc-forward" href="javascript:orderFinish()">
                                                <i class="fa fa-check-circle"></i>결제하기
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </article>
                </main>
            </div>

            
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