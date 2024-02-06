<%-- 
    Document   : updateCustomer
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
    <title>Update Customer</title>
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
    <c:if test="${not empty param.custID}">
        <sql:update dataSource="${myDatasource}">
            UPDATE CUSTOMER SET CUSTFNAME=?, CUSTLNAME=?, CUSTPHONENUMBER=?, CUSTEMAIL=?, CUSTADDRESS=? WHERE CUSTID = ? 

            <sql:param value="${param.custFName}"/>
            <sql:param value="${param.custLName}"/>
            <sql:param value="${param.custPhoneNumber}"/>
            <sql:param value="${param.custEmail}"/>
            <sql:param value="${param.custAddress}"/>
            <sql:param value="${param.custID}"/> 
        </sql:update>
    </c:if>

    <div class="scrollable-container">   
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <h2>Update Customer</h2>
                <form action="UpdateCustServlet" method="POST">
                    <input type="hidden" name="action" value="Update"/>
                    
                    <div class="formbold-input-wrapp formbold-mb-3">
                        <div>
                            <input
                                type="text"
                                name="custID"
                                id="custID"
                                placeholder="ID"
                                class="formbold-form-input"
                                value="${param.custID}"
                                readonly
                            />
                        </div>
                        
                        <label for="custFName" class="formbold-form-label"> Name </label>
                        <div>
                            <input
                                type="text"
                                name="custFName"
                                id="custFName"
                                placeholder="First name"
                                class="formbold-form-input"
                                value="${param.custFName}"
                            />

                            <input
                                type="text"
                                name="custLName"
                                id="custLName"
                                placeholder="Last name"
                                class="formbold-form-input"
                                value="${param.custLName}"
                            />
                        </div>
                    </div>

                    <div class="formbold-mb-3">
                        <label for="custPhoneNumber" class="formbold-form-label"> Phone Number </label>
                        <input
                            type="text"
                            name="custPhoneNumber"
                            id="custPhoneNumber"
                            placeholder="ex:25"
                            class="formbold-form-input"
                            value="${param.custPhoneNumber}"                                
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
                            value="${param.custEmail}"                                                              
                        />
                    </div>

                    <div class="formbold-mb-3">
                        <label for="custAddress" class="formbold-form-label"> Address </label>

                        <input
                            type="text"
                            name="custAddress"
                            id="custAddress"
                            placeholder="Street address"
                            class="formbold-form-input formbold-mb-3"
                            value="${param.custAddress}"
                        />
                    </div>
                    
                    <button class="formbold-btn">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
