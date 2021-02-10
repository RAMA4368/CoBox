<%@page import="com.koreait.cobox.model.common.Pager"%>
<%@page import="com.koreait.cobox.model.common.Formatter"%>
<%@page import="com.koreait.cobox.model.domain.TopCategory"%>
<%@page import="com.koreait.cobox.model.domain.Snack"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<TopCategory> topList = (List)request.getAttribute("topList");
	//Pager pager = (Pager)request.getAttribute("pager");
	//List<Snack> snackList = pager.getList();
	List<Snack> snackList = (List)request.getAttribute("snackList");
	//out.print("가져온 상품 수는 "+clientSnackList.size());
%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<%@ include file="../inc/header.jsp"%>
        <meta charset="utf-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
        <link href="/resources/assets/plugins/nouislider/nouislider.min.css" rel="stylesheet">
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
		function getList(topcategoryID){
			//alert(topcategoryID);	
			location.href="/client/snack/topcategory/list?topcategory_id="+topcategoryID;
		}
		
		function getDetailpopup(obj){
			var snack_id = $(obj).data("snack_id");
			var snack_name = $(obj).data("snack_name");
			var price = $(obj).data("price");
			var amount = $(obj).data("amount");
			var detail = $(obj).data("detail");
			var filename = $(obj).data("filename");
			
			//alert(snack_name); 
			console.log(snack_id);
			console.log(snack_name);
			console.log(price);
			console.log(amount);
			console.log(detail);
			console.log(filename);
			
			$(".product_title_wrapper div").html(snack_name);
			$(".product_title_wrapper p").html(price);
			$(".fsz-15 p").html(detail);
			$(".diblock img").attr({
				src:"/resources/data/snack/"+snack_id+"."+filename
			});
			
			
			
				/*
			$(".col-sm-6 button").on("click", function(){
				//alert(snack_id+"갖고 가려고?");
				
				var selectedQuantity = $("#snack_quantity option:selected").val();
				
				$.ajax({
					url:"/client/cart/regist",
					type:"post",
					data:{
						snack_id:snack_id,
						quantity:selectedQuantity
					},
					success:function(responseData){
						if(responseData.resultCode==1){
							if(confirm(responseData.msg+"\n장바구니에 담긴 상품을 보러갈까요?")){
								location.href=responseData.url;					
							}
						}else{
							alert(responseData.msg);
						}
					}
				});
				//location.href="/client/cart/list"
			});
				*/
				location.href="/client/snack/detail?snack_id="+snack_id;
			
			
		}
		
		
		
	</script>

    </head>
    <body class="woocommerce">
		<%@include file="../inc/top.jsp"%>
        <!-- CONTENT + SIDEBAR -->
        <div class="main-wrapper clearfix">
           

            <div class="theme-container container">
                <div class="main-container row">
                    <aside class="col-md-3 col-sm-4">
                        <div class="main-sidebar">
                           

                            <div class="widget sidebar-widget widget_categories clearfix">
                                <h6 class="widget-title">SNACK</h6>
                                <div class="panel-group">
                                	<%for(TopCategory topCategory : topList){ %>
                                    <div class="panel panel-cate">
                                        <div class="cate-heading">                                            
                                            <a data-toggle="collapse" href="#crl4" onClick="getList(<%=topCategory.getTopcategory_id() %>)" class="collapsed no-item"> <%=topCategory.getName() %> <span></span> </a>                                           
                                        </div>
                                        <div id="crl4" class="panel-collapse collapse">                                                                                  
                                        </div>
                                    </div>
                                    <%} %>
                                    
                                </div>
                            </div>

                        </div>
                    </aside>

                    <main class="col-md-9 col-sm-8 shop-wrap">
                      	

                        <div class="tab-content">
                            <!-- Product Grid View -->
                            <div id="grid-view" class="tab-pane fade active in" role="tabpanel">
                                <div class="row text-center hvr2 clearfix">
                                
                                <%for(int i=0; i<snackList.size(); i++){ %>
                                <%Snack snack = snackList.get(i); %>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="portfolio-wrapper">
                                            <div class="portfolio-thumb">
                                                <img src="/resources/data/snack/<%=snack.getSnack_id() %>.<%=snack.getFilename() %>" width="250px" height="250px" alt="">
                                                <div class="portfolio-content">
                                                	<div class="rating"></div>
                                                    <div class="pop-up-icon">                 
                                                        <a  data-toggle="modal" href="" data-target="#product-preview" class="center-link"><i class="fa fa-search" onClick="getDetailpopup(this)" 
                                                        	data-snack_id="<%=snack.getSnack_id() %>"
                                                        	data-snack_name="<%=snack.getSnack_name() %>" 
                                                        	data-price="<%=snack.getPrice() %>"
                                                        	data-amount="<%=snack.getAmount() %>"
                                                        	data-detail="<%=snack.getDetail() %>"
                                                        	data-filename="<%=snack.getFilename() %>"
                                                        	></i>
                                                        </a>
                                                        <!-- <a class="right-link" href="#"><i class="cart-icn"> </i></a> -->
                                                    </div>                                                   
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3> <a class="title-3 fsz-16" href="#"> <%=snack.getSnack_name() %> </a> </h3>
                                                <p class="font-3">Price: <span class="thm-clr"> <%=Formatter.getCurrency(snack.getPrice()) %> </span> </p>    
                                            </div>
                                        </div>
                                    </div>
                                  <%} %>
                                                                         
                                </div>                               
                                
                                
                            </div>
                            <!-- / Product Grid View -->                       
                        </div>        
                    </main>
                    
                </div>
            </div>
        </div>
        
        
        <div class="clear"></div>
        

        <!-- Product Preview Popup -->
        <section class="modal fade" id="product-preview" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg product-modal">
                <button class="close close-btn popup-cls" aria-label="Close" data-dismiss="modal" type="button" onClick="closePopup()">
                    <i class="fa-times fa"></i>
                </button>
                <div class="modal-content single-product">
                    <div class="diblock">
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                                <img  src="/resources/assets/img/products/single-2.jpg" alt="" >
                        </div>
                        <div class="spc-15 hidden-lg clear"></div>
                        <div class=" col-sm-12 col-lg-6 col-xs-12">
                            <div class="summary entry-summary">
                                <div class="woocommerce-product-rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                                    

                                    <div  class="posted_in">
                                        <h3 class="funky-font-2 fsz-20">Cobox</h3>
                                    </div>
                                </div>

                                <div class="product_title_wrapper">
                                    <div itemprop="name" class="product_title entry-title">
                                        Flusas Denim <span class="thm-clr">Dress</span>
                                        <p class="font-3 fsz-18 no-mrgn price"> <b class="amount blk-clr" id="cobox_price">$175</b></p>       
                                    </div>
                                </div>

                                <div itemprop="description" class="fsz-15">
                                    <p>Qossi is an emerging company and dedicated to making high quality bags and fashions.Qossi designers are internationally renowned designers,having participated in many international fashion designing contests,and perform outstandingly</p>                                  
                                </div>


                                <form id="cart_form" class="variations_form cart">
                                    <div class="row">
                                       
                                        
                                        <div class="col-sm-6">
                                            <div class="form-group" id="btn_cartRegist">
                                                <button type="button" class="single_add_to_cart_button button alt fancy-button left" >상세보기</button>
                                            </div>    
                                        </div>
                                    </div>
                                </form>
                            </div><!-- .summary -->
                        </div>  
                    </div>
                </div>
            </div>
        </section>
        <!-- / Product Preview Popup -->




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
        <script src="/resources/assets/plugins/nouislider/nouislider.min.js"></script>
    </body>
</html>