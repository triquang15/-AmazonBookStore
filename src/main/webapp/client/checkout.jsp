<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Checkout - Amazon Books Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/icon.png">
    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./assets/js/jquery.validate.min.js"></script>
</head>
<body>
   
 <header>
        <!-- Header Start -->
	<jsp:directive.include file="header.jsp" />
        <!-- Header End -->

    </header>       
          <main>
       
        <!--================Checkout Area =================-->
        <section class="checkout_area">
          <div class="container">
            <div class="returning_customer">
             <h1 class="text-center">Checkout</h1> <br> <br>
              <div class="check_title">           
              	<c:if test="${message != null}">
                	<h2 class="text-center" style="color: red;">${message}</h2>
                </c:if>
                
                <c:set var="cart" value="${sessionScope['cart']}" />
                
                <c:if test="${cart.totalItems == 0}">
					<h2 class="text-center" style="color: red;">There's no items in your cart</h2>
		        </c:if>    
              </div>
            
             
            </div>
           
            <div class="billing_details">
              <div class="row">
                <div class="col-lg-8">
                  <h3>Billing Address</h3>
                  <form class="row contact_form" id="orderForm" action="place_order" method="post">
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" name="recipientName" value="${loggedCustomer.fullname}" placeholder="Recipient Name"/>
                    </div>
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" name="recipientPhone" value="${loggedCustomer.phone}" placeholder="Recipient Phone"/>                   
                    </div>
                    <div class="col-md-12 form-group">
                      <input type="text" class="form-control" name="address" value="${loggedCustomer.address}" placeholder="Address" />
                    </div>
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" name="city" value="${loggedCustomer.city}" placeholder="City" />
                    </div>
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" name="zipcode" value="${loggedCustomer.zipcode}" placeholder="Zip Code" />
                    </div>
                    
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" name="country" value="${loggedCustomer.country}" placeholder="Country" />
                    </div>
                   
                  
                </div>
                <div class="col-lg-4">
                  <div class="order_box">
                    <h2>Your Order</h2>
                    <ul class="list">
                      <li>
                        <a href="#">Product
                          <span>Total</span>
                        </a>
                      </li>
                      
                      <c:forEach items="${cart.items}" var="item">
                      <li>
                        <a href="#">${item.key.title}
                          <span class="middle">x ${cart.totalQuantity}</span>
                          <span class="last">$${item.key.price}</span>
                        </a>
                      </li>
                      </c:forEach>
                     
                    </ul>
                    <ul class="list list_2">
                      <li>
                        <a href="#">Subtotal
                          <span>$${item.value * item.key.price}</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">Shipping
                          <span>Free</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">Total
                          <span>$${cart.totalAmount}</span>
                        </a>
                      </li>
                    </ul>
                    
                      <div class="payment_item">
                      <div class="radion_btn">
                        <input type="radio" id="f-option5" name="selector" />
                        <label for="f-option5">Check payments</label>
                        <select name="paymentMethod" class="form-select">
							<option value="Cash On Delivery">Cash On Delivery</option>
						</select>
                      </div>
                   
                    </div>
                    <br><br>
                  
                    <div class="payment_item active">
                      <div class="radion_btn">
                        <input type="radio" id="f-option6" name="selector" />
                        <label for="f-option6">Paypal </label>
                       
                        <div class="check"></div>
                      </div>
                    
                    </div>
                  
                    <button class="btn primary checkout_btn_1" type="submit">Complete Checkout</button>
                  </div>
                </div>
              </div>
              </form>
            </div>
          </div>
        </section>
        <!--================End Checkout Area =================-->
    </main>
    <footer>
        <!-- Footer Start-->
<jsp:directive.include file="footer.jsp" />
        <!-- Footer End-->
    </footer>
    <!--? Search model Begin -->
    <div class="search-model-box">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-btn">+</div>
            <form class="search-model-form" action="search" method="get">
                <input type="text" id="search-input" placeholder="Search for anything....." name="keyword" size="50" >
            </form>
        </div>
    </div>
    <!-- Search model end -->
    
    <!-- JS here -->
    	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#orderForm").validate({
				rules: {
					recipientName: "required",
					recipientPhone: "required",
					address: "required",
					city: "required",
					zipcode: "required",
					country: "required",
				},
				
				messages: {
					recipientName: "Please enter recipient name",
					recipientPhone: "Please enter phone number",
					address: "Please enter street address",
					city: "Please enter city",
					zipcode: "Please enter zip code",
					country: "Please enter country",					
				}
				
			});

		});
	</script>

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    
    <!-- Scroll up, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>

</body>
    
</html>