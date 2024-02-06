<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/KingLandHotel" user="app" password="app"/>






<!DOCTYPE HTML>
<html>
  <head>
      
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Customer Booking Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">

    <link rel="stylesheet" href="customerPage/css/bootstrap.min.css">
    <link rel="stylesheet" href="customerPage/css/animate.css">
    <link rel="stylesheet" href="customerPage/css/owl.carousel.min.css">
    <link rel="stylesheet" href="customerPage/css/aos.css">
    <link rel="stylesheet" href="customerPage/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="customerPage/css/jquery.timepicker.css">
    <link rel="stylesheet" href="customerPage/css/fancybox.min.css">
    
    <link rel="stylesheet" href="customerPage/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="customerPage/fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="customerPage/css/style.css">
         
</head>
<body>
      
    <header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="homeCust.html">King Land Hotel</a></div>
          <div class="col-6 col-lg-8">


            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

            <div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6 mx-auto">
                      <ul class="list-unstyled menu">
                       <li class="active"><a href="homeCust.jsp">Home</a></li>
                        <li><a href="roomsCust.jsp">Rooms</a></li>
                        <li><a href="bookCust.jsp">Booking</a></li>
                        <li><a href="LogoutCustServlet">Logout</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- END head -->

    <section class="site-hero inner-page overlay" style="background-image: url(customerPage/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Booking Form</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="homeCust.jsp">Home</a></li>
              <li>&bullet;</li>
              <li>Booking</li>
            </ul>
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
    </section>
    <!-- END section -->
   <h2 class="text-center">Booking Form</h2>
<section class="section contact-section" id="next">
    <div class="container">
        <div class="row">
            <div class="col-md-7 mx-auto" data-aos="fade-up" data-aos-delay="100">
                <form action="bookCustServlet" method="post" class="border p-5 rounded">
        <div class="form-group">
                               <label for="customerFirstName">Customer First Name:</label>
                               <input type="text" name="customerFirstName" class="form-control" required>
                           </div>
                    
                    <div class="form-group">
                        <label for="checkInDate">Check-In Date:</label>
                        <input type="date" name="checkInDate" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="checkOutDate">Check-Out Date:</label>
                        <input type="date" name="checkOutDate" class="form-control" required>
                    </div>

                   

                    <div class="form-group">
                        <label for="roomType">Room Type:</label>
                        <select name="roomType" class="form-control" required>
                            <option value="Standard">Standard</option>
                            <option value="Superior">Superior</option>
                            <option value="SuperiorKing">Superior King</option>
                            <option value="Deluxe">Deluxe</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                </form>
            </div>
        </div>
    </div>
</section>
<footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span> No 11 Jalan Desa Aman 9 Taman Desa Aman 5Th Mile <br>Kuala Lumpur 56100</span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span> 03-2274-5627</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span> kinglandhotel@gmail.com</span></p>
          </div>
          
        </div>
        <div class="row pt-5">
          <p class="col-md-6 text-left">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved.
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
        </div>
      </div>
    </footer>
    
    <script src="customerPage/js/jquery-3.3.1.min.js"></script>
    <script src="customerPage/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="customerPage/js/popper.min.js"></script>
    <script src="customerPage/js/bootstrap.min.js"></script>
    <script src="customerPage/js/owl.carousel.min.js"></script>
    <script src="customerPage/js/jquery.stellar.min.js"></script>
    <script src="customerPage/js/jquery.fancybox.min.js"></script>
    
    <script src="customerPage/js/aos.js"></script>
    
    <script src="customerPage/js/bootstrap-datepicker.js"></script> 
    <script src="customerPage/js/jquery.timepicker.min.js"></script> 
    <script src="customerPage/js/main.js"></script>
 
  </body>
  
</html>
