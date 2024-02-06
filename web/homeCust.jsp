<%-- 
    Document   : homeCust
    Created on : Jan 10, 2024, 11:19:21 PM
    Author     : HP SmartUser
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>King Land Hotel</title>
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

    <section class="site-hero overlay" style="background-image: url(customerPage/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <span class="custom-caption text-uppercase text-white d-block  mb-3">Welcome To </span>
            <h1 class="heading">King Land Hotel</h1>
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

   
    <section class="section pb-4">
      <div class="container">
       
        <div class="row check-availabilty" id="next">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

            <form action="roomsCust.jsp" method="get">
    <div class="row">
        <div class="col-md-6 col-lg-3 align-self-end">
            <button type="submit" class="btn btn-primary btn-block text-white">Book Now</button>
        </div>
    </div>
</form>
          </div>


        </div>
      </div>
    </section>
    

    <section class="section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Rooms &amp; Suites</h2>
            <p data-aos="fade-up" data-aos-delay="100">In the distant embrace of mountains, a world secluded from Vokalia and Consonantia exists, where the blind texts make their home. Isolated within Bookmarksgrove on the shores of the Semantics, they find solace in a sprawling sea of language.</p>
          </div>
        </div>
       <section class="section">
    <div class="container">
        <div class="row mx-auto justify-content-center">
            <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                // Get a database connection
                connection = DBConnection.createConnection();

                // Query to retrieve room details
                String query = "SELECT roomType, roomPrice, roomPax FROM ROOM";
                preparedStatement = connection.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();

                // Display room details
                while (resultSet.next()) {
                    String roomType = resultSet.getString("roomType");
                    double roomPrice = resultSet.getDouble("roomPrice");
                    String roomPax = resultSet.getString("roomPax");
            %>
                    <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up">
                        <div class="room">
                            <figure class="img-wrap">
                                <img src="customerPage/images/<%= roomType.toLowerCase().replace(" ", "") %>.jpg" alt="<%= roomType %>" class="img-fluid mb-3">
                            </figure>
                            <div class="p-3 text-center room-info">
                                <h2><%= roomType %></h2>
                                <span class="text-uppercase letter-spacing-1">RM <%= roomPrice %> / per night</span>
                                <!-- Additional room information can be displayed here -->
                                <br>
                                <span>Pax: <%= roomPax %></span>
                              
                            </div>
                        </div>
                    </div>
            <%
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Print the full stack trace for debugging
            } finally {
                // Close the resources in a finally block to ensure they are closed even if an exception occurs
                if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
                if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignored) {}
                if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
            }
            %>
        </div>
    </div>
</section>


        
      </div>
    </section>
    
  
    <!-- END section -->
    <section class="section testimonial-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">People Says</h2>
          </div>
        </div>
        <div class="row">
          <div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
            
            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="customerPage/images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="customerPage/images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="customerPage/images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>


            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="customerPage/images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="customerPage/images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="customerPage/images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

          </div>
            <!-- END slider -->
        </div>

      </div>
    </section>
    

    

    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          
         
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
           
            <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span> 123 Pulau Kemang, Port Dickson <br>Negeri Sembilan</span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span> 03-2274-5627</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span> kinglandhotel@gmail.com</span></p>
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
