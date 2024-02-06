<%-- 
    Document   : updateBooking.jsp
    Created on : Jan 5, 2024, 4:04:02 PM
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
    <title>Update Booking</title>
    <link rel="stylesheet" href="adminPage/css/dashcss.css" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        .scrollable-container {
            max-height: 600px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <c:if test="${not empty param.bookingID}">
        <sql:update dataSource="${myDatasource}">
            UPDATE BOOKING SET CHECKINDATE=?, CHECKOUTDATE=?, ROOMID=?, ADMINID=?, BOOKINGPRICE=?, CUSTID=? WHERE BOOKINGID=? 

            <sql:param value="${checkInDate}"/>
            <sql:param value="${checkOutDate}"/>
            <sql:param value="${roomID}"/>
            <sql:param value="${adminID}"/>
            <sql:param value="${bookingPrice}"/>
            <sql:param value="${custID}"/>            
            <sql:param value="${bookingID}"/>
        </sql:update>
    </c:if>

    <div class="scrollable-container">
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <h2>Update Booking</h2>
                <form action="UpdateBookServlet" method="POST">
                    <input type="hidden" name="action" value="Update"/>  

                    <div class="formbold-mb-3">
                        <label for="bookingID" class="formbold-form-label">ID</label>
                        <input type="text" name="bookingID" id="bookingID" class="formbold-form-input" value="${param.bookingID}" readonly />
                    </div>

                    <div class="formbold-mb-3">
                        <label for="checkInDate" class="formbold-form-label">Check-in Date</label>
                        <input type="date" name="checkInDate" id="checkInDate" class="formbold-form-input" value="${param.checkInDate}" />
                    </div>

                    <div class="formbold-mb-3">
                        <label for="checkOutDate" class="formbold-form-label">Check-out Date</label>
                        <input type="date" name="checkOutDate" id="checkOutDate" class="formbold-form-input" value="${param.checkOutDate}" />
                    </div>

                    <div class="formbold-mb-3">
                        <label for="custID" class="formbold-form-label">Customer ID</label>
                        <input type="text" name="custID" id="custID" class="formbold-form-input" value="${param.custID}" readonly />
                    </div>

                    <div class="formbold-mb-3">
                        <label for="roomID" class="formbold-form-label">Room ID</label>
                        <input type="text" name="roomID" id="roomID" class="formbold-form-input" value="${param.roomID}" readonly/>
                    </div>

                    <div class="formbold-mb-3">
                        <label for="adminID" class="formbold-form-label">Admin ID</label>
                        <input type="text" name="adminID" id="adminID" class="formbold-form-input" value="${param.adminID}" readonly/>
                    </div>

                    <div class="formbold-mb-3">
                        <label for="bookingPrice" class="formbold-form-label">Price: RM</label>
                        <input type="text" name="bookingPrice" id="bookingPrice" class="formbold-form-input" value="${param.bookingPrice}"/>
                    </div>
                    <button class="formbold-btn">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
