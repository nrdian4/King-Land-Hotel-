package bean;
import java.io.Serializable;

public class LoginAdminBean implements Serializable {
    private String adminUsername;
    private String adminPassword;

    // Default constructor
    public LoginAdminBean() {
    }

    // Getter and setter methods for the adminUsername
    public String getAdminUsername() {
        return adminUsername;
    }

    public LoginAdminBean(String adminUsername, String adminPassword) {
        this.adminUsername = adminUsername;
        this.adminPassword = adminPassword;
    }

    public void setAdminUsername(String adminUsername) {
        this.adminUsername = adminUsername;
    }

    // Getter and setter methods for the adminPassword
    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }
}
