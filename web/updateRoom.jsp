<%-- 
    Document   : updateRoom
    Created on : Jan 3, 2024, 8:19:00 PM
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
    <title>Update Room Page</title>
    <link rel="stylesheet" href="adminPage/css/dashcss.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .scrollable-container {
            max-height: 600px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
        <c:set var="roomID" value="${param.roomID}"/>      
        <c:set var="roomType" value="${param.roomType}"/> 
        <c:set var="roomStatus" value="${param.roomStatus}"/>
        <c:set var="roomPrice" value="${param.roomPrice}"/> 
        <c:set var="roomPax" value="${param.roomPax}"/> 
    
    <c:if test="${not empty param.roomID}">
        <sql:update dataSource="${myDatasource}">
            UPDATE ROOM SET ROOMTYPE=?, ROOMSTATUS=?, ROOMPRICE=?, ROOMPAX=? WHERE ROOMID=?
            
            <sql:param value="${roomType}"/>
            <sql:param value="${roomStatus}"/>
            <sql:param value="${roomPrice}"/> 
            <sql:param value="${roomPax}"/> 
            <sql:param value="${roomID}"/>
        </sql:update>
    </c:if>

    <div class="scrollable-container">   
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form action="UpdateRoomServlet" method="POST">
                    <input type="hidden" name="action" value="Update"/>
                    
                    <div class="formbold-input-wrapp formbold-mb-3">
                        <div>
                            <input
                                type="text"
                                name="roomID"
                                id="roomID"
                                placeholder="Room ID"
                                class="formbold-form-input"
                                value="${param.roomID}"
                                readonly
                            />
                        </div>
                    </div>
                                
                    <div class="formbold-mb-3">
                        <label for="roomType" class="formbold-form-label">Room Type</label>
                        <input
                            type="text"
                            name="roomType"
                            id="roomType"
                            class="formbold-form-input"
                            value="${param.roomType}" 
                            readonly
                        />
                    </div>

                    <div class="formbold-mb-3">
    <label for="roomStatus" class="formbold-form-label">Room Status</label>
    <select name="roomStatus" id="roomStatus" class="formbold-form-input">
        <option value="">--Choose Status--</option>
        <option value="Available" ${param.roomStatus == 'Available' ? 'selected' : ''}>Available</option>
        <option value="Reserved" ${param.roomStatus == 'Reserved' ? 'selected' : ''}>Reserved</option>
        <option value="Occupied" ${param.roomStatus == 'Occupied' ? 'selected' : ''}>Occupied</option>
    </select>
</div>

                            
                    <div class="formbold-mb-3">
                        <label for="roomPrice" class="formbold-form-label">Room Price (RM)</label>
                        <input
                            type="text"
                            name="roomPrice"
                            id="roomPrice"
                            class="formbold-form-input"
                            value="${param.roomPrice}" 
                        />
                    </div>
                        
                    <div class="formbold-mb-3">
                        <label for="roomPax" class="formbold-form-label">Room Pax</label>
                        <input
                            type="text"
                            name="roomPax"
                            id="roomPax"
                            class="formbold-form-input"
                            value="${param.roomPax}" 
                        />
                    </div>
                    
                    <button class="formbold-btn">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>