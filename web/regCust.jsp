<%-- 
    Document   : regCust
    Created on : Jan 8, 2024, 5:04:05 PM
    Author     : HP SmartUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="IndexPage/css/logincss.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: 'Jost', sans-serif;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: #8787ff;
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 999;
        }

           .logo img {
            width: 70px;
            height: 70px;
        }

        .hambuger {
            display: none;
        }

        .bar {
            display: block;
            width: 25px;
            height: 3px;
            margin: 5px auto;
            transition: all 0.3s ease-in-out;
            background-color: #fff;
        }

        ul {
            display: flex;
            justify-content: space-between;
            align-items: center;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        ul li {
            margin-left: 3rem;
        }

        ul li a {
            font-size: 1.2rem;
            font-weight: 400;
            color: white;
            transition: 0.5s;
            text-decoration: none;
        }

        ul li a:hover {
            color: #C1B086;
        }

        @media only screen and (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: center;
            }

            ul {
                display: none;
                position: fixed;
                top: 8vh;
                left: 0;
                width: 100%;
                background: #8787ff;
                flex-direction: column;
                text-align: center;
            }

            ul.active {
                display: flex;
            }

            .hambuger {
                display: block;
                cursor: pointer;
            }

            .hambuger.active .bar:nth-child(2) {
                opacity: 0;
            }

            .hambuger.active .bar:nth-child(1) {
                transform: translateY(8px) rotate(45deg);
            }

            .hambuger.active .bar:nth-child(3) {
                transform: translateY(-8px) rotate(-45deg);
            }
        }

        .main {
            margin-top: 8%;
            width: 400px;
            height: 700px;
            background: linear-gradient(120deg, #a6c0fe, #f68084); /* Mint gradient background */
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 5px 20px 50px #000;
            display: flex;
            
            align-items: center;
            justify-content: center;
        }

        .main .Sign\ Up {
            width: 400px; /* Width adjustment */
            height: auto; /* Dynamic height based on content */
            display: flex;
            flex-direction: column;
            align-items: center;
            background: red; /* Replace with your background image */
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 5px 20px 50px #000;
            margin: 10px;
            padding: 20px; /* Increased padding for better spacing */
        }

        .main .Sign\ Up label {
            color: #fff;
            font-size: 2.3em;
            font-weight: bold;
            cursor: pointer;
            transition: .5s ease-in-out;
            text-align: center;
            margin-bottom: 20px; /* Adjusted margin for label */
        }

        .main .Sign\ Up input {
            width: 100%; /* Full width input */
            height: 40px; /* Increased height for better visibility */
            background: #e0dede;
            margin: 10px 0; /* Spacing between inputs */
            padding: 10px;
            border: none;
            outline: none;
            border-radius: 5px;
        }

        .main .Sign\ Up button {
            width: 100%; /* Full width button */
            height: 50px; /* Adjusted height */
            color: #fff;
            background: #573b8a;
            font-size: 1.2em; /* Slightly increased font size */
            font-weight: bold;
            margin: 20px 0; /* Adjusted margin for the button */
            outline: none;
            border: none;
            border-radius: 5px;
            transition: .2s ease-in;
            cursor: pointer;
        }

        .main .Sign\ Up button:hover {
            background: #6d44b8;
        }
    </style>
</head>

<body>
    <header class="header" id="navigation-menu">
        <div class="container">
            <nav>
                <a href="index.jsp" class="logo"> <img src="IndexPage/image/logo.png" alt=""> </a>
                <ul class="nav-menu">
                  <li> <a href="index.jsp" class="nav-link">Home</a> </li>
                    <li> <a href="index.jsp#about" class="nav-link">About</a> </li>
                    <li> <a href="LoginCust.jsp"class="nav-link">Booking</a> </li>
                    <li class="nav-item dropdown">
                        <a href="#login" class="nav-link">Log In &#9662;</a>
                        <div class="dropdown-content">
                            <a href="LoginCust.jsp">Customer</a>
                             <a href="LoginAdmin.jsp">Admin</a>
                        </div>
                    </li>
                </ul>

                <div class="hambuger">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </div>
            </nav>
        </div>
    </header>

    <div class="main">
        <div class="Sign\ Up">
    <form method="post" action="RegCustServlet"> 
    <label for="chk" aria-hidden="true">Sign Up</label>
    <!-- Update input names to match the servlet parameters -->
    <input type="text"  name="custFName" placeholder="First Name" required="">
    <input type="text"  name="custLName" placeholder="Last Name" required="">
    <input type="text"  name="custPhoneNumber" placeholder="Phone Number" required="">
    <input type="text"  name="custEmail" placeholder="Email" required="">
    <input type="text"  name="custAddress" placeholder="Address" required="">
    <input type="text"  name="custUsername" placeholder="Username" required="">
    <input type="password"  name="custPassword" placeholder="Password" required="">
    <button type="submit">Sign Up</button>
</form>

          
        </div>
    </div>
</body>

</html>