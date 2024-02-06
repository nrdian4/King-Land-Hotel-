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

public class AddBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connection = null;
        List<String> errorMsgs = new ArrayList<>();
        
        try{
            String bookingID = request.getParameter("bookingID");
            String checkInDate = request.getParameter("checkInDate");
            String checkOutDate = request.getParameter("checkOutDate");
            String custID = request.getParameter("custID");            
            String roomID = request.getParameter("roomID");
            String adminID = request.getParameter("adminID");
            double bookingPrice = Double.parseDouble(request.getParameter("bookingPrice"));

            
            if (bookingID == null || bookingID.isEmpty()) {
                errorMsgs.add("Booking ID is required");
            }
            
            if (checkInDate == null || checkInDate.isEmpty()) {
                errorMsgs.add("Check-in Date is required");
            }

            if (checkOutDate == null || checkOutDate.isEmpty()) {
                errorMsgs.add("Check-out Date is required");
            }

            if (custID == null || custID.isEmpty()) {
                errorMsgs.add("Customer ID is required");
            }

            if (roomID == null || roomID.isEmpty()) {
                errorMsgs.add("Room ID is required");
            }

            if (adminID == null || adminID.isEmpty()) {
                errorMsgs.add("Admin ID is required");
            }
            
            /*if (bookingPrice == null || bookingPrice.isEmpty()) {
                errorMsgs.add("Booking Price is required");
            }*/

            if (!errorMsgs.isEmpty()) {
                request.setAttribute("errorMsgs", errorMsgs);
                request.getRequestDispatcher("/errorAddBooking.jsp").forward(request, response);
                return; 
            }
            
            BookDashBoardBean booking = new BookDashBoardBean();
            booking.setBookingID(bookingID);
            booking.setCheckInDate(checkInDate);
            booking.setCheckOutDate(checkOutDate);
            booking.setCustID(custID);
            booking.setRoomID(roomID);
            booking.setAdminID(adminID);
            booking.setBookingPrice(bookingPrice);
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/KingLandHotel", "app", "app");

            connection.setAutoCommit(false);

            String action = request.getParameter("action");
            if ("Add".equals(action)) {
                
                String insertQuery = "INSERT INTO BOOKING (BOOKINGID, CHECKINDATE, CHECKOUTDATE, CUSTID, ROOMID, ADMINID, BOOKINGPRICE) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    preparedStatement.setString(1, booking.getBookingID());
                    preparedStatement.setString(2, booking.getCheckInDate());
                    preparedStatement.setString(3, booking.getCheckOutDate());
                    preparedStatement.setString(4, booking.getCustID());
                    preparedStatement.setString(5, booking.getRoomID());
                    preparedStatement.setString(6, booking.getAdminID());
                    preparedStatement.setDouble(7, booking.getBookingPrice());

                    preparedStatement.executeUpdate();

                    connection.commit();
                    request.getRequestDispatcher("/SuccessBooking.jsp").forward(request, response);
                }
            }
        }catch (ClassNotFoundException | SQLException e) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            errorMsgs.add("An error occurred. Please try again later.");
            request.setAttribute("errorMsgs", errorMsgs);
            request.getRequestDispatcher("/errorAddBooking.jsp").forward(request, response);

        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException ex) {
                // Log or handle the exception if needed
                ex.printStackTrace();
            }
        }
    }
}

      