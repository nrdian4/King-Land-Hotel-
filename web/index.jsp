<%-- 
    Document   : index
    Created on : Jan 10, 2024, 11:09:16 PM
    Author     : HP SmartUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <title>Hotel Website</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="IndexPage/css/style.css">

  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />


  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A==" crossorigin="anonymous"
    referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>

</head>

<body>
  <header class="header" id="navigation-menu">
    <div class="container">
      <nav>
        <a href="#" class="logo"> <img src="IndexPage/image/logo.png" alt=""> </a>

        <ul class="nav-menu">
          <li> <a href="#home" class="nav-link">Home</a> </li>
          <li> <a href="#about" class="nav-link">About</a> </li>
          <li> <a href="LoginCust.jsp" class="nav-link">Booking</a> </li>
         <li class="nav-item dropdown">
    <a href="#login" class="nav-link">Log In &#9662;</a>
    <div class="dropdown-content">
        <a href="LoginCust.jsp">Customer</a>
        <a href="LoginAdmin.jsp">Admin</a>
    </div>
</li>
          <li> <a href="#footer" class="nav-link">Contact</a> </li>
        </ul>

        <div class="hambuger">
          <span class="bar"></span>
          <span class="bar"></span>
          <span class="bar"></span>
        </div>
      </nav>
    </div>
  </header>
  

  <section class="home" id="home">
    <div class="head_container">
      <div class="box">
        <div class="text">
          <h1>King Land</h1>
          <h3>A Home Away From Home</h3>
          <a href="LoginCust.jsp">
                    <button>Book Now</button>
                </a>
        </div>
      </div>
      <div class="image">
        <img src="IndexPage/image/home1.jpg" class="slide">
      </div>
      <div class="image_item">
        <img src="IndexPage/image/home1.jpg" alt="" class="slide active" onclick="img('IndexPage/image/home1.jpg')">
        <img src="IndexPage/image/home2.jpg" alt="" class="slide" onclick="img('IndexPage/image/home2.jpg')">
        <img src="IndexPage/image/home3.jpg" alt="" class="slide" onclick="img('IndexPage/image/home3.jpg')">
        <img src="IndexPage/image/home4.jpg" alt="" class="slide" onclick="img('IndexPage/image/home4.jpg')">
      </div>
    </div>
  </section>
  <script>
    function img(anything) {
      document.querySelector('.slide').src = anything;
    }

    function change(change) {
      const line = document.querySelector('.image');
      line.style.background = change;
    }
  </script>
  
  <section class="about top" id="about">
    <div class="container flex">
      <div class="left">
        <div class="img">
          <img src="IndexPage/image/a1.jpg" alt="" class="image1">
          <img src="IndexPage/image/a2.jpg" alt="" class="image2">
        </div>
      </div>
      <div class="right">
        <div class="heading">
          <h4>RAISING COMFORT TO THE HIGHEST LEVEL</h5>
          <h2>Welcome to King Land Hotel </h2>
          <p>King Land Hotel sits along the most popular beachfront of Pantai Teluk Kemang in Port Dickson, a tropical eden amidst a Balinese landscape garden. Being a hotel near Teluk Kemang, a sense of calm and relaxation greets you right upon your check in.</p>
          <p>The spacious and inviting apartments are further enhanced by ethnic interior decor and natural textiles that gives one a sense of 'A Home Away From Home'. </p>
          
        </div>
      </div>
    </div>
  </section>
  <section class="wrapper top">
    <div class="container">
      <div class="text">
        <h2>Our Amenities</h2>
        <p>Explore the range of amenities and services we offer at our hotel: </p>

        <div class="content">
          <div class="box flex">
            <i class="fas fa-swimming-pool"></i>
            <span>Swimming pool</span>
          </div>
          <div class="box flex">
            <i class="fas fa-dumbbell"></i>
            <span>Gym & yoga</span>
          </div>
          <div class="box flex">
            <i class="fas fa-spa"></i>
            <span>Spa & massage</span>
          </div>
          <div class="box flex">
            <i class="fas fa-ship"></i>
            <span>Boat Tours</span>
          </div>
          <div class="box flex">
            <i class="fas fa-swimmer"></i>
            <span>Surfing Lessons</span>
          </div>
          <div class="box flex">
            <i class="fas fa-microphone"></i>
            <span>Conference room</span>
          </div>
          <div class="box flex">
            <i class="fas fa-water"></i>
            <span>Diving & snorkeling</span>
          </div>
          <div class="box flex">
            <i class="fas fa-umbrella-beach"></i>
            <span>Private Beach</span>
          </div>
        </div>
      </div>
    </div>
  </section>
  
       
  <section class="gallary mtop " id="gallary">
    <div class="container">
      <div class="heading_top flex1">
        <div class="heading">
          
          <h2>Room Types</h2>
        </div>
        
      </div>

      <div class="owl-carousel owl-theme">
        <div class="item">
          <img src="IndexPage/image/standard room.jpg" alt="">
          <div class="text">
            <h3>Standard Room</h3>
            <p> <span>RM</span>300 <span>/per night</span> </p>
          </div>
        </div>
        <div class="item">
          <img src="IndexPage/image/superior.jpg" alt="">
          <div class="text">
            <h3>Superior Room</h3>
            <p> <span>RM</span>350 <span>/per night</span> </p>
          </div>
        </div>
        <div class="item">
          <img src="IndexPage/image/superior king.jpg" alt="">
          <div class="text">
            <h3>Superior King Room</h3>
            <p> <span>RM</span>450 <span>/per night</span> </p>
          </div>
        </div>
        <div class="item">
          <img src="IndexPage/image/deluxe.jpg" alt="">
          <div class="text">
            <h3>Deluxe Room</h3>
            <p> <span>RM</span>500 <span>/per night</span> </p>
          </div>
        </div>
      
      </div>

    </div>
  </section>

  
  <script>
    var accItem = document.getElementsByClassName('accordionItem');
    var accHD = document.getElementsByClassName('accordionIHeading');

    for (i = 0; i < accHD.length; i++) {
      accHD[i].addEventListener('click', toggleItem, false);
    }

    function toggleItem() {
      var itemClass = this.parentNode.className;
      for (var i = 0; i < accItem.length; i++) {
        accItem[i].className = 'accordionItem close';
      }
      if (itemClass == 'accordionItem close') {
        this.parentNode.className = 'accordionItem open';
      }
    }
  </script>



  <section class="gallary mtop " id="gallary">
    <div class="container">
      <div class="heading_top flex1">
        <div class="heading">
          <h5>WELCOME TO OUR PHOTO GALLERY</h5>
          <h2>Photo Gallery of Our Hotel</h2>
        </div>
        
      </div>

      <div class="owl-carousel owl-theme">
        <div class="item">
          <img src="IndexPage/image/g1.jpg" alt="">

        </div>
        <div class="item">
          <img src="IndexPage/image/g2.jpg" alt="">
        </div>
        <div class="item">
          <img src="IndexPage/image/g3.jpg" alt="">
        </div>
        <div class="item">
          <img src="IndexPage/image/g4.jpg" alt="">
        </div>
        <div class="item">
          <img src="IndexPage/image/g5.jpg" alt="">
        </div>
        <div class="item">
          <img src="IndexPage/image/g6.jpg" alt="">
        </div>
        <div class="item">
          <img src="IndexPage/image/g7.jpg" alt="">
        </div>
        <div class="item">
          <img src="IndexPage/image/g8.jpg" alt="">
        </div>
      </div>

    </div>
  </section>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js" integrity="sha512-gY25nC63ddE0LcLPhxUJGFxa2GoIyA5FLym4UJqHDEMHjp8RET6Zn/SHo1sltt3WuVtqfyxECP38/daUc/WVEA==" crossorigin="anonymous"
    referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"
    referrerpolicy="no-referrer"></script>
  <script>
    $('.owl-carousel').owlCarousel({
      loop: true,
      margin: 10,
      nav: true,
      dots: false,
      navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
      responsive: {
        0: {
          items: 1
        },
        768: {
          items: 2
        },
        1000: {
          items: 4
        }
      }
    })
  </script>



  <section class="map top">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.1493081665095!2d101.8758566153096!3d2.609850738850664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cd8c43e5de83f5%3A0xbdc6e3a7e1e1663e!2sPulau%20Kemang!5e0!3m2!1sen!2snp!4v1637764960007!5m2!1sen!2snp" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</section>



  <footer>
      <div class="footer-content" id="footer">
        <p>Contact us: KinglandHotel@email.com</p>
        <p>Phone: +1123</p>
        <p>Address: 123 Pulau Kemang, Port Dickson, Negeri Sembilan</p>
    </div>
    <div class="social-icons">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </div>
</footer>

</body>

</html>