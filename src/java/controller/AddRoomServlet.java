package controller;

import bean.RoomDashboardBean;
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

public class AddRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection connection = null;
        List<String> errorMsgs = new ArrayList<>();

        try {
            String roomID = request.getParameter("roomID");
            String roomType = request.getParameter("roomType");
            String roomStatus = request.getParameter("roomStatus");
            double roomPrice = Double.parseDouble(request.getParameter("roomPrice"));
            String roomPax = request.getParameter("roomPax");

            // Validation
            if (roomID == null || roomID.isEmpty()) {
                errorMsgs.add("Room ID is required");
            }

            if (roomType == null || roomType.isEmpty()) {
                errorMsgs.add("Room Type is required");
            }

            if (roomStatus == null || roomStatus.isEmpty()) {
                errorMsgs.add("Room Status is required");
            }

            if (roomPrice <= 0.00) {
                errorMsgs.add("Room Price must be greater than 0");
            }

            if (roomPax == null || roomPax.isEmpty()) {
                errorMsgs.add("Room Pax is required");
            }

            if (!errorMsgs.isEmpty()) {
                request.setAttribute("errorMsgs", errorMsgs);
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            // Creating RoomDashboardBean
            RoomDashboardBean room = new RoomDashboardBean();
            room.setRoomID(roomID);
            room.setRoomType(roomType);
            room.setRoomStatus(roomStatus);
            room.setRoomPrice(roomPrice);
            room.setRoomPax(roomPax);

            // Database Connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/KingLandHotel", "app", "app");

            // Inserting Data
            String insertQuery = "INSERT INTO ROOM (ROOMID, ROOMTYPE, ROOMSTATUS, ROOMPRICE,ROOMPAX) VALUES (?,?,?,?,?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, room.getRoomID());
                preparedStatement.setString(2, room.getRoomType());
                preparedStatement.setString(3, room.getRoomStatus());
                preparedStatement.setDouble(4, room.getRoomPrice());
                preparedStatement.setString(5, room.getRoomPax());

                preparedStatement.executeUpdate();

                request.getRequestDispatcher("/successRoom.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
            e.printStackTrace();
            errorMsgs.add("An error occurred. Please try again later.");
            request.setAttribute("errorMsgs", errorMsgs);
            request.getRequestDispatcher("/errorAddRoom.jsp").forward(request, response);

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
