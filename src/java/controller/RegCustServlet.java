package controller;

import bean.regCustBean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegCustServlet", urlPatterns = {"/RegCustServlet"})
public class RegCustServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String custFName = request.getParameter("custFName");
            String custLName = request.getParameter("custLName");
            String custPhoneNumber = request.getParameter("custPhoneNumber");
            String custEmail = request.getParameter("custEmail");
            String custAddress = request.getParameter("custAddress");
            String custUsername = request.getParameter("custUsername");
            String custPassword = request.getParameter("custPassword");

            long currentTime = System.currentTimeMillis();
    String custID = "C" + String.format("%03d", currentTime % 1000);


            regCustBean regCust = new regCustBean(custID, custFName, custLName, custPhoneNumber, custEmail, custAddress, custUsername, custPassword);

            // JDBC Connection parameters (replace with your database information)
            String jdbcUrl = "jdbc:derby://localhost:1527/KingLandHotel";
            String dbUser = "app";
            String dbPassword = "app";

            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
                // Insert customer data into the database
                String insertQuery = "INSERT INTO customer (custID, custFName, custLName, custPhoneNumber, custEmail, custAddress, custUsername, custPassword) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    preparedStatement.setString(1, regCust.getCustID());
                    preparedStatement.setString(2, regCust.getCustFName());
                    preparedStatement.setString(3, regCust.getCustLName());
                    preparedStatement.setString(4, regCust.getCustPhoneNumber());
                    preparedStatement.setString(5, regCust.getCustEmail());
                    preparedStatement.setString(6, regCust.getCustAddress());
                    preparedStatement.setString(7, regCust.getCustUsername());
                    preparedStatement.setString(8, regCust.getCustPassword());

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Registration successful, you can redirect or show a success message
                        response.sendRedirect("SuccessRegistration.jsp");
                    } else {
                        // Registration failed, handle accordingly (redirect, show error message, etc.)
                        response.sendRedirect("RegistrationFailed.jsp");
                    }
                }
            } catch (SQLException e) {
                // Handle database connection or query execution errors
                e.printStackTrace();
                response.sendRedirect("RegistrationFailed.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
