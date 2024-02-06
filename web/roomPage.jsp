<%-- 
    Document   : roomPage
    Created on : Jan 5, 2024, 4:21:00 PM
    Author     : mohd azrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/KingLandHotel" user="app" password="app"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Room Dashboard Page</title>
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
        <c:set var="roomID" value="${param.roomID}"/>      
        <c:set var="roomType" value="${param.roomType}"/> 
        <c:set var="roomStatus" value="${param.roomStatus}"/>
        <c:set var="roomPrice" value="${param.roomPrice}"/> 
        <c:set var="roomPax" value="${param.roomPax}"/> 
        
        <c:if test="${(roomID!=null)&&(roomType!=null)&&(roomStatus!=null)&&(roomPrice!=null)&&(roomPax!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO ROOM VALUES (?,?,?,?,?)
                <sql:param value="${roomID}"/>    
                <sql:param value="${roomType}"/>
                <sql:param value="${roomStatus}"/>
                <sql:param value="${roomPrice}"/> 
                <sql:param value="${roomPax}"/> 
            </sql:update>
        </c:if>
        
        <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM ROOM
        </sql:query>
        <!-- scroll bar -->
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
                <span style="font-size:60px;cursor:pointer; color: white;" class="nav"  >DASHBOARD</span>
                <span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  >☰ Booking Details</span>
            </div>
        <div class="col-div-6">
        <div class="profile">
        </div>
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
            <p>Room Detail </p>
            <a href="addRoom.jsp">
            <button class="add-button-right">Add Room</button>
        </a>
            <br/>
        <table>
                <!-- column headers -->
                <tr>
                    <th>Room ID</th>
                    <th>Type Of Room</th>
                    <th>Room Status</th>
                    <th>Room Price</th>
                    <th>Room Pax</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <!-- column data -->
                <c:forEach var="row" items="${result.rowsByIndex}">
                    <tr>
                        <c:forEach var="column" items="${row}" varStatus="loop">
                            <c:if test="${loop.index <5}">
                                <td><c:out value="${column}" /></td>
                            </c:if>
                        </c:forEach>

                        <td>      
                            <button class="update-button" onclick="window.location.href='updateRoom.jsp?roomID=${row[0]}&roomType=${row[1]}&roomStatus=${row[2]}&roomPrice=${row[3]}&roomPax=${row[4]}'">
                                Update
                            </button>
                        </td>
                        <td>
                            <form action="DeleteRoomServlet" method="POST">
                                <input type="hidden" name="roomID" value="${row[0]}"/>
                                <button class="delete-button" type="submit" onclick="return confirm('Are you sure you want to delete this room?')">Delete</button>
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