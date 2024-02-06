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
    public class LoginCustBean 
{
    private String custUsername;
    private String custPassword;

    public LoginCustBean () {
    }
    
    public LoginCustBean (String custUsername, String custPassword) {
        this.custUsername = custUsername;
        this.custPassword = custPassword;
    }

    public String getCustUsername() {
        return custUsername;
    }

    public String getCustPassword() {
        return custPassword;
    }
    
    
}
