package controller;

import bean.RoomBean;
import bean.bookCustBean;
import bean.CustIDBean;
import util.DBConnection;

import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class bookCustServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String ADMIN_ID = "A001";
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            String checkInDate = request.getParameter("checkInDate");
            String checkOutDate = request.getParameter("checkOutDate");
            String customerFirstName = request.getParameter("customerFirstName");
            String roomType = request.getParameter("roomType");
            long numberOfDays = calculateNumberOfDays(checkInDate, checkOutDate);

            // Create a BookingBean and set its properties
            bookCustBean bookingBean = new bookCustBean();
            bookingBean.setCheckInDate(checkInDate);
            bookingBean.setCheckOutDate(checkOutDate);
            bookingBean.setCustomerFirstName(customerFirstName);
            bookingBean.setRoomType(roomType);

            RoomBean roomDetails = getRoomDetailsByType(roomType);
            CustIDBean custID = getCustIDByFName(customerFirstName);
            double bookingPrice = calculateBookingPrice(numberOfDays, roomDetails.getRoomPrice());

            insertBookingData(bookingBean.getBookingID(), checkInDate, checkOutDate, custID.getCustID(), roomDetails.getRoomId(), ADMIN_ID, bookingPrice);

            response.setContentType("text/html");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("    <meta charset=\"UTF-8\">");
            out.println("    <title>Booking Receipt</title>");
            out.println("    <link href=\"https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap\" rel=\"stylesheet\">");
            out.println("    <style>");
            out.println("        body {");
            out.println("            text-align: center;");
            out.println("            padding: 40px 0;");
            out.println("            background: #EBF0F5;");
            out.println("        }");
            out.println("        h1 {");
            out.println("            color: #88B04B;");
            out.println("            font-family: \"Nunito Sans\", \"Helvetica Neue\", sans-serif;");
            out.println("            font-weight: 900;");
            out.println("            font-size: 40px;");
            out.println("            margin-bottom: 10px;");
            out.println("        }");
            out.println("        p {");
            out.println("            color: #404F5E;");
            out.println("            font-family: \"Nunito Sans\", \"Helvetica Neue\", sans-serif;");
            out.println("            font-size: 20px;");
            out.println("            margin: 0;");
            out.println("        }");
            out.println("        i {");
            out.println("            color: #9ABC66;");
            out.println("            font-size: 100px;");
            out.println("            line-height: 200px;");
            out.println("            margin-left: -15px;");
            out.println("        }");
          out.println("        .card {");
out.println("            background: white;");
out.println("            padding: 60px;");
out.println("            border-radius: 4px;");
out.println("            box-shadow: 0 2px 3px #C8D0D8;");
out.println("            display: inline-block;");
out.println("            margin: 0 auto;");
out.println("            width: 70%;");  // Adjust the width as needed

            out.println("        }");
            out.println("        .back-button {");
            out.println("            display: inline-block;");
            out.println("            background-color: #88B04B;");
            out.println("            color: white;");
            out.println("            padding: 10px 20px;");
            out.println("            text-align: center;");
            out.println("            text-decoration: none;");
            out.println("            font-size: 16px;");
            out.println("            cursor: pointer;");
            out.println("            border-radius: 4px;");
            out.println("            margin-top: 20px;");
            out.println("        }");
            out.println("        h2 {");
            out.println("            color: #333;");
            out.println("        }");
            out.println("        table {");
            out.println("            border-collapse: collapse;");
            out.println("            width: 80%;");
            out.println("            margin: 20px auto;");
            out.println("        }");
            out.println("        th, td {");
            out.println("            font-size: 25px;");
            out.println("            border: 1px solid #dddddd;");
            out.println("            text-align: left;");
            out.println("            padding: 12px;");
            out.println("        }");
            out.println("        .bigger-text {");
            out.println("            font-size: 30px;");
            out.println("        }");
            out.println("    </style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"card\">");
            out.println("    <div style=\"border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;\">");
            out.println("        <i class=\"checkmark\">✓</i>");
            out.println("    </div>");
            out.println("    <h1>Success</h1>");
            out.println("    <p>Booking successfully .</p><br>");
            out.println("    <h2>Booking Receipt</h2>");
            out.println("    <table>");
            out.println("        <tr><th>Field</th><th>Details</th></tr>");
            out.println("        <tr><td class=\"bigger-text\">Booking ID</td><td class=\"bigger-text\">" + bookingBean.getBookingID() + "</td></tr>");
            out.println("        <tr><td>Check-In Date</td><td>" + bookingBean.getCheckInDate() + "</td></tr>");
            out.println("        <tr><td>Check-Out Date</td><td>" + bookingBean.getCheckOutDate() + "</td></tr>");
            out.println("        <tr><td>Room Type</td><td>" + bookingBean.getRoomType() + "</td></tr>");
            out.println("        <tr><td>Number of Days</td><td>" + numberOfDays + "</td></tr>");
            out.println("        <tr><td>Booking Price</td><td>" + bookingPrice + "</td></tr>");
            out.println("    </table>");
out.println("        <button class=\"back-button\" onclick=\"printReceipt()\">Print Receipt</button>");
            out.println("    <a href=\"homeCust.jsp\" class=\"back-button\">Main Page</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
out.println("    <script>");
out.println("        function printReceipt() {");
out.println("            window.print();");
out.println("        }");
out.println("    </script>");
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();

            // Redirect to an error page with a meaningful message
            response.sendRedirect("BookingFailedCust.jsp?message=An error occurred while processing your request.");
        }
    }

    private long calculateNumberOfDays(String checkInDate, String checkOutDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(checkInDate, formatter);
        LocalDate endDate = LocalDate.parse(checkOutDate, formatter);
        return ChronoUnit.DAYS.between(startDate, endDate);
    }

    private double calculateBookingPrice(long numberOfDays, double roomPrice) {
        return numberOfDays * roomPrice;
    }

    private RoomBean getRoomDetailsByType(String roomType) {
        RoomBean roomDetails = new RoomBean();

        try (Connection con = DBConnection.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT roomID, roomPrice FROM ROOM WHERE roomType = ?")) {
            ps.setString(1, roomType);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    roomDetails.setRoomId(rs.getString("roomID"));
                    roomDetails.setRoomPrice(rs.getDouble("roomPrice"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return roomDetails;
    }

    private CustIDBean getCustIDByFName(String customerFirstName) {
        CustIDBean custID = new CustIDBean();

        try (Connection con = DBConnection.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT custID FROM CUSTOMER WHERE custFname = ?")) {
            ps.setString(1, customerFirstName);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    custID.setCustID(rs.getString("custID"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return custID;
    }

   private void insertBookingData(String bookingID, String checkInDate, String checkOutDate,
                               String custID, String roomID, String adminID, double bookingPrice) {
        if ( custID == null ) {
        // Handle the case where any of the required data is null
        throw new IllegalArgumentException("Booking data cannot contain null values.");
    }
    try (Connection con = DBConnection.createConnection();
         PreparedStatement pstmt = con.prepareStatement(
                 "INSERT INTO BOOKING (bookingID, checkInDate, checkOutDate, custID, roomID, adminID, bookingPrice) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)")) {

        pstmt.setString(1, bookingID);
        pstmt.setString(2, checkInDate);
        pstmt.setString(3, checkOutDate);
        pstmt.setString(4, custID);
        pstmt.setString(5, roomID);
        pstmt.setString(6, adminID);
        pstmt.setDouble(7, bookingPrice);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            // Booking successfully inserted
            // You can add any additional logic or messages here
        } else {
            // Insertion failed
            throw new SQLException("Failed to insert booking data into the database.");
        }

    } catch (SQLException e) {
        e.printStackTrace();
        throw new RuntimeException(e); // Rethrow the exception as a runtime exception
    }
}
}
