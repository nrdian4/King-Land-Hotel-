package dao;

import bean.LoginAdminBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

public class LoginAdminDao {
    
    public String authenticateUser(LoginAdminBean loginAdminBean) {
        String username = loginAdminBean.getAdminUsername(); 
        String password = loginAdminBean.getAdminPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        
        try
        {
            con = DBConnection.createConnection(); 
            statement = con.createStatement(); 
            resultSet = statement.executeQuery("select adminUsername,adminPassword from admin");
            
            while(resultSet.next())
            {
                userNameDB = resultSet.getString("adminUsername"); 
                passwordDB = resultSet.getString("adminPassword");
                
                if(username.equals(userNameDB) && password.equals(passwordDB))
                    return "SUCCESS";
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
