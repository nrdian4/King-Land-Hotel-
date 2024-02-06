/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.RoomDashboardBean;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author mohd azrin
 */
public class UpdateRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connection = null;
        List<String> errorMsgs = new ArrayList<>();
        
        try{
            String roomID = request.getParameter("roomID");
            String roomStatus = request.getParameter("roomStatus");
            double roomPrice = Double.parseDouble(request.getParameter("roomPrice"));
            String roomPax = request.getParameter("roomPax");
            
            if (roomStatus == null || roomStatus.isEmpty()) {
                errorMsgs.add("Room Status is required");
            }
            
            if (roomPrice == 0.00) {
                errorMsgs.add("Room Price is required");
            }

            if (roomPax == null || roomPax.isEmpty()) {
                errorMsgs.add("Room Pax is required");
            }
            
            if (!errorMsgs.isEmpty()) {
                request.setAttribute("errorMsgs", errorMsgs);
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return; 
            }
            
            RoomDashboardBean room = new RoomDashboardBean();
            room.setRoomID(roomID);
            room.setRoomStatus(roomStatus);
            room.setRoomPrice(roomPrice);
            room.setRoomPax(roomPax);
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/KingLandHotel", "app", "app");

            connection.setAutoCommit(false);

            String action = request.getParameter("action");
            if ("Update".equals(action)) {
                
                String updateQuery = "UPDATE ROOM SET ROOMSTATUS=?, ROOMPRICE=?, ROOMPAX=? WHERE ROOMID=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                    preparedStatement.setString(1, room.getRoomStatus());
                    preparedStatement.setDouble(2, room.getRoomPrice());
                    preparedStatement.setString(3, room.getRoomPax());
                    preparedStatement.setString(4, room.getRoomID());


                    preparedStatement.executeUpdate();

                    connection.commit();
                    request.getRequestDispatcher("/success.jsp").forward(request, response);
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