package bean;
import java.io.Serializable;

public class bookCustBean implements Serializable {
    private String bookingID;
    private String checkInDate;
    private String checkOutDate;
    private String customerFirstName;
    private String roomType;

    // Default constructor
    public bookCustBean() {
        // Generate a random booking ID during object creation
        generateBookingID();
    }

    // Getters and setters for the properties

    public String getBookingID() {
        return bookingID;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getCustomerFirstName() {
        return customerFirstName;
    }

    public void setCustomerFirstName(String customerFirstName) {
        this.customerFirstName = customerFirstName;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    // Method to generate a random booking ID
    private void generateBookingID() {
        // Generating a 3-digit random number for booking ID
        int randomID = (int) (Math.random() * 900) + 100;
        this.bookingID = "B" + randomID;
    }
}

