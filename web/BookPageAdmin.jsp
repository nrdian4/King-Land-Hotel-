<%-- 
    Document   : bookPage
    Created on : Jan 5, 2024, 12:13:10 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/KingLandHotel" user="app" password="app"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of Booking</title>
    <link rel="stylesheet" href="adminPage/css/dashcss.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .scrollable-container {
            max-height: 600px; /* Set the maximum height for the scrollable area */
            overflow-y: auto; /* Add a vertical scrollbar when content overflows */
        }
    </style>
</head>
<body>
    
    <c:set var="bookingID" value="${param.bookingID}"/> 
    <c:set var="checkInDate" value="${param.checkInDate}"/> 
    <c:set var="checkOutDate" value="${param.checkOutDate}"/> 
    <c:set var="roomID" value="${param.roomID}"/>
    <c:set var="adminID" value="${param.adminID}"/>
    <c:set var="bookingPrice" value="${param.bookingPrice}"/>
    
    <c:if test="${(bookingID!=null)&&(checkInDate!=null)&&(checkOutDate!=null)&&(roomID!=null)&&(adminID!=null)&&(bookingPrice!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO BOOKING
                VALUES (?,?,?,?,?,?)
                
                <sql:param value="${bookingID}"/>                 
                <sql:param value="${checkInDate}"/> 
                <sql:param value="${checkOutDate}"/> 
                <sql:param value="${roomID}"/>
                <sql:param value="${adminID}"/>
                <sql:param value="${bookingPrice}"/>
                
            </sql:update>
        </c:if>
                
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM BOOKING
                </sql:query>
    
    <div class="scrollable-container">
        <div class="formbold-main-wrapper">
            <div id="mySidenav" class="sidenav">
                <p class="logo"><span>King</span>Land</p>  
                    <a href="AdminPage.jsp" class="icon-a"><i class="fa fa-users icons"></i>   Customers</a>
                    <a href="BookPageAdmin.jsp" class=""><i class="fa fa-list icons"></i>   Booking</a>
                    <a href="roomPage.jsp" class=""><i class="fa fa-tasks icons"></i>   Room</a>
                    <a href="LogoutAdminServlet" class=""><i class="fa fa-users icons"></i>   Logout</a>
            </div>
            <div id="main">
                <div class="head">
                    <div class="col-div-6">
                        <span style="font-size:60px;cursor:pointer; color: white;" class="nav">DASHBOARD</span>
                        <span style="font-size:30px;cursor:pointer; color: white;" class="nav2">☰ Booking Details</span>
                    </div>
                    <div class="col-div-6">
                        <div class="profile"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
                <br/>
             <sql:query var="custCount" dataSource="${myDatasource}">
       SELECT COUNT(*) AS custCount FROM CUSTOMER
    </sql:query>

    <div class="col-div-3">
       <div class="box">
          <p>${custCount.rows[0].custCount}<br/><span>Customer</span></p>
          <a href="AdminPage.jsp" class="icon-link">
             <i class="fa fa-users box-icon"></i>
          </a>
       </div>
    </div>  

    <sql:query var="bookingCount" dataSource="${myDatasource}">
       SELECT COUNT(*) AS bookingCount FROM BOOKING
    </sql:query>

    <div class="col-div-3">
       <div class="box">
          <p>${bookingCount.rows[0].bookingCount}<br/><span>Booking</span></p>
          <a href="BookPageAdmin.jsp" class="icon-link">
             <i class="fa fa-list box-icon"></i>
          </a>
       </div>
    </div>

    <sql:query var="roomCount" dataSource="${myDatasource}">
       SELECT COUNT(*) AS roomCount FROM ROOM
    </sql:query>

    <div class="col-div-3">
       <div class="box">
          <p>${roomCount.rows[0].roomCount}<br/><span>Room</span></p>
          <a href="roomPage.jsp" class="icon-link">
             <i class="fa fa-bed box-icon"></i>
          </a>
       </div>
    </div>
                          
                <div class="clearfix"></div>
                <br/><br/>
                <div class="col-div-8">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Booking Details</p>
                            <a href="AddBooking.jsp">
                                <button class="add-button-right">Add Booking</button>
                            </a>
                            <br/>
                            <table>
                                <tr>
                                    <th>ID</th>
                                    <th>Check In Date</th>
                                    <th>Check Out Date</th>
                                    <th>Customer ID</th>
                                    <th>Room ID</th>
                                    <th>Admin ID</th>
                                    <th>Price</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                </tr>
                                <c:forEach var="row" items="${result.rowsByIndex}">
                                    <tr>
                                        <c:forEach var="column" items="${row}" varStatus="loop">
                                            <c:if test="${loop.index <8}">
                                                <td><c:out value="${column}" /></td>
                                            </c:if>
                                        </c:forEach>
                                        <td>
                                            <button class="update-button" onclick="window.location.href='updateBooking.jsp?bookingID=${row[0]}&checkInDate=${row[1]}&checkOutDate=${row[2]}&custID=${row[3]}&roomID=${row[4]}&adminID=${row[5]}&bookingPrice=${row[6]}'">
                                                Update
                                            </button>
                                        </td>
                                        <td>
                                                <form action="DeleteBookServlet" method="POST">
                                                    <input type="hidden" name="bookingID" value="${row[0]}"/>
                                                    <button class="delete-button" type="submit" onclick="return confirm('Are you sure you want to delete this customer?')">Delete</button>
                                                </form>
                                            </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
