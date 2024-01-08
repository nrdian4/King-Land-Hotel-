import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class regCustomer extends HttpServlet {

    private PreparedStatement pstmt;

    @Override
    public void init() throws ServletException {
        initializeJdbc();
    }

 public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String firstName = request.getParameter("txtFirstName");
    String lastName = request.getParameter("txtLastName");
    String phoneNumber = request.getParameter("txtPhoneNumber");
    String email = request.getParameter("txtEmail");
    String address = request.getParameter("txtAddress");
    String username = request.getParameter("txtUsername");
    String password = request.getParameter("txtPassword");

    try {
        if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty()) {
            out.println("First Name and Last Name are required");
            return;
        }

        storeCustomer(firstName, lastName, phoneNumber, email, address, username, password);
        out.println(firstName + " " + lastName + " is now registered as a customer");
    } catch (SQLException ex) {
        // Print the exception details to the console
        ex.printStackTrace();

        // Send a more informative error message to the client
        out.println("Error: " + ex.getMessage());
    } finally {
        // Close resources in a finally block
        try {
            if (pstmt != null) {
                pstmt.close();
            }
        } catch (SQLException ex) {
            // Print the exception details to the console
            ex.printStackTrace();
        }
        out.close();
    }
}


    private void initializeJdbc() {
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/KinglandHotel;create=true;user=app;password=app";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(connectionString);
            pstmt = conn.prepareStatement("insert into Customer (FIRSTNAME, LASTNAME, PNO, EMAIL, ADDRESS, USERNAME, PASSWORD) values (?, ?, ?, ?, ?, ?, ?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void storeCustomer(String firstName, String lastName, String phoneNumber, String email, String address, String username, String password) throws SQLException {
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, phoneNumber);
        pstmt.setString(4, email);
        pstmt.setString(5, address);
        pstmt.setString(6, username);
        pstmt.setString(7, password);
        pstmt.executeUpdate();
    }
}
