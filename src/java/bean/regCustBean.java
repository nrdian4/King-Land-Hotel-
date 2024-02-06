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
public class regCustBean
{
    private String custID;
    private String custFName;
    private String custLName;
    private String custPhoneNumber;
    private String custEmail;
    private String custAddress;
    private String custUsername;
    private String custPassword;

    public regCustBean() {
    }

    public regCustBean(String custID, String custFName, String custLName, String custPhoneNumber, String custEmail, String custAddress, String custUsername, String custPassword) {
        this.custID = custID;
        this.custFName = custFName;
        this.custLName = custLName;
        this.custPhoneNumber = custPhoneNumber;
        this.custEmail = custEmail;
        this.custAddress = custAddress;
        this.custUsername = custUsername;
        this.custPassword = custPassword;
    }

    public String getCustID() {
        return custID;
    }

    public String getCustFName() {
        return custFName;
    }

    public String getCustLName() {
        return custLName;
    }

    public String getCustPhoneNumber() {
        return custPhoneNumber;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public String getCustAddress() {
        return custAddress;
    }

    public String getCustUsername() {
        return custUsername;
    }

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustID(String custID) {
        this.custID = custID;
    }

    public void setCustFName(String custFName) {
        this.custFName = custFName;
    }

    public void setCustLName(String custLName) {
        this.custLName = custLName;
    }

    public void setCustPhoneNumber(String custPhoneNumber) {
        this.custPhoneNumber = custPhoneNumber;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress;
    }

    public void setCustUsername(String custUsername) {
        this.custUsername = custUsername;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }
    
    
    
}
