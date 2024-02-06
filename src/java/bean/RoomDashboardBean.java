/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mohd azrin
 */
public class RoomDashboardBean implements java.io.Serializable{
    public String roomID;
    public String roomType;
    public String roomStatus;
    public double roomPrice;
    public String roomPax;

    public RoomDashboardBean() {
    }

    public RoomDashboardBean(String roomID, String roomType, String roomStatus, double roomPrice, String roomPax) {
        this.roomID = roomID;
        this.roomType = roomType;
        this.roomStatus = roomStatus;
        this.roomPrice = roomPrice;
        this.roomPax = roomPax;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public void setRoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public void setRoomPax(String roomPax) {
        this.roomPax = roomPax;
    }

    public String getRoomID() {
        return roomID;
    }

    public String getRoomType() {
        return roomType;
    }

    public String getRoomStatus() {
        return roomStatus;
    }

    public double getRoomPrice() {
        return roomPrice;
    }

    public String getRoomPax() {
        return roomPax;
    }
}
