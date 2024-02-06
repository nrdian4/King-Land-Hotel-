/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author HP SmartUser
 */
public class LoginAdminBean 
{
    private String adminUsername;
    private String adminPassword;

    public LoginAdminBean() {
    }
    
    public LoginAdminBean(String adminUsername, String adminPassword) {
        this.adminUsername = adminUsername;
        this.adminPassword = adminPassword;
    }

    public String getAdminUsername() {
        return adminUsername;
    }

    public String getAdminPassword() {
        return adminPassword;
    }
    
    
}
