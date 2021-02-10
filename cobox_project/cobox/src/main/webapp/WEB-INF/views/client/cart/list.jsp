<%@page import="com.koreait.cobox.model.common.Formatter"%>
<%@page import="com.koreait.cobox.model.domain.Cart"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList = (List)request.getAttribute("cartList");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<%@ include file="../inc/header.jsp"%>
        <meta charset="utf-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> Goshop HTML Theme || Shopping Cart Page</title>

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
	function delCart(){
		if(confirm("장바구니를 모두 비우시겠습니까?")){
			location.href="/client/cart/del";
		}
	}

	function editCart() {
		if(confirm("주문 수량을 변경하시겠습니까?")){
			$("#cart-form").attr({
				action:"/client/cart/edit",
				method:"post"
			});
			$("#cart-form").submit();
		}
	}
	
	function checkout(){
		location.href="/client/checkout/form"
	}
	
	</script>
    </head>

    <body class="woocommerce-cart" itemscope="itemscope" itemtype="http://schema.org/WebPage">
		<%@include file="../inc/top.jsp"%>


        <!-- CONTENT + SIDEBAR -->
        <div class="main-wrapper clearfix">

            <div class="container theme-container">
                <main id="main-content" class="main-container"  itemprop="mainContentOfPage" itemscope="itemscope" itemtype="http://schema.org/Blog">
                    <article itemscope="itemscope" itemtype="http://schema.org/BlogPosting" itemprop="blogPost">
                        <header class="entry-header diblock spc-15">
                            <!-- Post Title -->
                            <h2 class="fsz-18 title-3 pull-left" itemprop="headline">Your Cart</h2>
                            <h2 class="fsz-15 title-3 drk-gry pull-right">CONTINUE SHOPPING</h2>
                        </header>

                        <!-- Main Content of the Post -->
                        <div class="cart-wrap">
                            <div class="woocommerce">
                                <form id="cart-form">
                                    <table class="shop_table cart">
                                        <thead>
                                            <tr>
                                                <th class="product-thumbnail">&nbsp;</th>
                                                <th class="product-name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-subtotal">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                        		<td colspan="2">Snack</td>
                                        		<td>Price</td>
                                        		<td>Quantity</td>
                                        		<td>Total</td>
                                        	</tr>
                                        
                                        	<%int sum=0; %>
                                        	<%for(Cart cart : cartList){ %>
                                            <tr class="cart_item">
                                                <td class="product-thumbnail">
                                                    <a href="single-product.html">
                                                        <img  src="/resources/data/snack/<%=cart.getSnack_id() %>.<%=cart.getFilename() %>" alt="poster_2_up" />
                                                    </a>
                                                </td>
                                                <td class="product-name">
                                                    <div class="cart-product-title">
                                                        <a href="single-product.html"> <%=cart.getSnack_name() %><span class="thm-clr"> </span> </a>
                                                    </div>

                                                    
                                                </td>

                                                <td class="product-price">                                                    
                                                    <p class="font-3 fsz-18 no-mrgn"> <b class="amount blk-clr"><%=Formatter.getCurrency(cart.getPrice()) %></b> </p>                                                   
                                                </td>

                                                <td class="product-quantity">
                                                    <div class="quantity input-group">
														<span class="qty-minus" onclick="var effect = document.getElementById('qty<%=cart.getCart_id() %>'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
														<input type="hidden" name="cart_id" value="<%=cart.getCart_id()%>">
														<input type="number" name="quantity" class="qty-text" id="qty<%=cart.getCart_id() %>" step="1" min="1" max="99"  value="<%=cart.getQuantity()%>">
														<span class="qty-plus" onclick="var effect = document.getElementById('qty<%=cart.getCart_id() %>'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                    </div>
                                                </td>
												<%
													sum = sum + (cart.getPrice()*cart.getQuantity());
												%>
                                                <td class="product-subtotal">
                                                    <p class="font-3 fsz-18 no-mrgn"> <b class="amount blk-clr"><%=Formatter.getCurrency(cart.getPrice()*cart.getQuantity())%></b> </p>
                                                    <a href="#" class="remove" title="Remove this item"> <i class="fa-times fa"></i> </a>
                                                </td>
                                            </tr>
                                            <%} %>
                                            <tr>
                                            	<td colspan="5" text-align="right">
                                            		<a href="javascript:delCart()"><h4>clear cart</h4></a>
                                					<a href="javascript:editCart()"><h4>Update cart</h4></a>
                                            	</td>
                                            </tr>
                                            
                                        </tbody>
                                        
                                    </table>
                                </form>

                                <div class="cart-extra-info clearfix">
                                   

                                    <div class="col-lg-4 col-sm-4 cart-collaterals">
                                        <div class="cart_totals font-2">
                                            <h4 class="cart-title-highlight title-3">Cart Total</h4>
                                            <table>
                                                <tr class="cart-subtotal">
                                                    <th>Sub Total:</th>
                                                    <td><span class="drk-gry"><%=Formatter.getCurrency(sum) %></span></td>
                                                </tr>

                                                <tr class="shipping">
                                                    <th><!-- Promo Discount : --></th>
                                                    <td>
                                                        <span class="drk-gry"><!-- 50% --></span>
                                                    </td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>Order Total</th>
                                                    <td><strong><span class="amount"><%=Formatter.getCurrency(sum) %></span></strong> </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                   
                                </div>

                                <div class="wc-proceed-to-checkout text-center">
                                    <a href="javascript:checkout()" class="checkout-button button alt wc-forward">
                                        <i class="fa fa-check-circle"></i>Proceed to Checkout
                                    </a>
                                </div>
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