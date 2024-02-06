package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.BookDashBoardBean;

public class UpdateBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connection = null;
        List<String> errorMsgs = new ArrayList<>();
        
        try{
            String bookingID = request.getParameter("bookingID");
            String checkInDate = request.getParameter("checkInDate");
            String checkOutDate = request.getParameter("checkOutDate");
            double bookingPrice = Double.parseDouble(request.getParameter("bookingPrice"));
            
            if (checkInDate == null || checkInDate.isEmpty()) {
                errorMsgs.add("Check-in Date is required");
            }

            if (checkOutDate == null || checkOutDate.isEmpty()) {
                errorMsgs.add("Check-out Date is required");
            }

            if (!errorMsgs.isEmpty()) {
                request.setAttribute("errorMsgs", errorMsgs);
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return; 
            }
            
            BookDashBoardBean booking = new BookDashBoardBean();
            booking.setBookingID(bookingID);
            booking.setCheckInDate(checkInDate);
            booking.setCheckOutDate(checkOutDate);
            booking.setBookingPrice(bookingPrice);
   
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/KingLandHotel", "app", "app");

            connection.setAutoCommit(false);

            String action = request.getParameter("action");
            if ("Update".equals(action)) {
                
                String updateQuery = "UPDATE BOOKING SET CHECKINDATE=?, CHECKOUTDATE=?, BOOKINGPRICE=? WHERE BOOKINGID=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                    preparedStatement.setString(1, booking.getCheckInDate());
                    preparedStatement.setString(2, booking.getCheckOutDate());
                    preparedStatement.setDouble(3, booking.getBookingPrice());
                    preparedStatement.setString(4, booking.getBookingID());

                    preparedStatement.executeUpdate();

                    connection.commit();
                    request.getRequestDispatcher("/SuccessBooking.jsp").forward(request, response);
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            errorMsgs.add("An error occurred. Please try again later.");
            request.setAttribute("errorMsgs", errorMsgs);
            request.getRequestDispatcher("/error.jsp").forward(request, response);

        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}