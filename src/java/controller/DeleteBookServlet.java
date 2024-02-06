package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String bookingID = request.getParameter("bookingID");
            Connection connection = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/KingLandHotel", "app", "app");

            String deleteQuery = "DELETE FROM BOOKING WHERE BOOKINGID=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setString(1, bookingID);
                preparedStatement.executeUpdate();
            }

            response.sendRedirect("BookPage.jsp"); // Redirect back to the bookPage.jsp after deletion

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions, show error messages, etc.
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}