<%-- 
    Document   : AddCust
    Created on : Jan 9, 2024, 8:03:42 PM
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
        <title>Add Customer</title>
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
        <c:set var="custID" value="${param.custID}"/> 
        <c:set var="custFName" value="${param.custFName}"/> 
        <c:set var="custLName" value="${param.custLName}"/> 
        <c:set var="custPhoneNumber" value="${param.custPhoneNumber}"/>
        <c:set var="custEmail" value="${param.custEmail}"/> 
        <c:set var="custAddress" value="${param.custAddress}"/>
        <c:set var="custUsername" value="${param.custUsername}"/> 
        <c:set var="custPassword" value="${param.custPassword}"/>

        <c:if test="${(custID != null) && (custFName != null) && (custLName != null) && (custPhoneNumber != null) && (custEmail != null) && (custAddress != null) && (custUsername != null) && (custPassword != null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO CUSTOMER (custID, custFName, custLName, custPhoneNumber, custEmail, custAddress, custUsername, custPassword)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)

                <sql:param value="${custID}"/>
                <sql:param value="${custFName}"/>
                <sql:param value="${custLName}"/>
                <sql:param value="${custPhoneNumber}"/>
                <sql:param value="${custEmail}"/>
                <sql:param value="${custAddress}"/>
                <sql:param value="${custUsername}"/>
                <sql:param value="${custPassword}"/>
            </sql:update>
        </c:if>
                
                <div class="scrollable-container">                    
                    <div class="formbold-main-wrapper">

                        <div class="formbold-main-wrapper">
                            <!-- Author: FormBold Team -->
                            <!-- Learn More: https://formbold.com -->
                            <div class="formbold-form-wrapper">
                                <h2>Add Customer</h2>
                              <form action="AddCustServlet" method="POST">
                                    <input type="hidden" name="action" value="Add"/>
                                    <div class="formbold-mb-3">
                                      <label for="custID" class="formbold-form-label"> ID </label>
                                      <input
                                        type="text"
                                        name="custID"
                                        id="custID"
                                        placeholder="Customer ID"
                                        class="formbold-form-input"
                                      />
                                    </div>
                                    
                                    <div class="formbold-input-wrapp formbold-mb-3">
                                      <label for="custFName" class="formbold-form-label"> Name </label>
                                      <div>
                                        <input
                                          type="text"
                                          name="custFName"
                                          id="custFName"
                                          placeholder="First name"
                                          class="formbold-form-input"
                                        />

                                        <input
                                          type="text"
                                          name="custLName"
                                          id="custLName"
                                          placeholder="Last name"
                                          class="formbold-form-input"
                                        />
                                      </div>
                                    </div>

                                    <div class="formbold-mb-3">
                                      <label for="custPhoneNumber" class="formbold-form-label"> Phone Number </label>
                                      <input
                                        type="text"
                                        name="custPhoneNumber"
                                        id="custPhoneNumber"
                                        placeholder="ex:0123456789"
                                        class="formbold-form-input"
                                      />
                                    </div>

                                    <div class="formbold-mb-3">
                                        <label for="custEmail" class="formbold-form-label"> Email </label>
                                        <input
                                          type="email"
                                          name="custEmail"
                                          id="custEmail"
                                          placeholder="example@email.com"
                                          class="formbold-form-input"
                                        />
                                    </div>

                                    <div class="formbold-mb-3">
                                        <label for="custAddress" class="formbold-form-label"> Address </label>

                                        <input
                                          type="text"
                                          name="custAddress"
                                          id="custAddress"
                                          placeholder="Full address"
                                          class="formbold-form-input formbold-mb-3"
                                        />
                                    </div>
                                    
                                    <div class="formbold-mb-3">
                                        <label for="custUsername" class="formbold-form-label"> Username </label>

                                        <input
                                          type="text"
                                          name="custUsername"
                                          id="custUsername"
                                          placeholder="Username"
                                          class="formbold-form-input formbold-mb-3"
                                        />
                                    </div>
                                    
                                    <div class="formbold-mb-3">
                                        <label for="custPassword" class="formbold-form-label"> Password </label>

                                        <input
                                          type="password"
                                          name="custPassword"
                                          id="custPassword"
                                          placeholder="Password"
                                          class="formbold-form-input formbold-mb-3"
                                        />
                                    </div>
                                    <button class="formbold-btn">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
    </body>
</html>