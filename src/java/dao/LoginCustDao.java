package dao;

import bean.LoginCustBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

public class LoginCustDao {
    
    public String authenticateUser(LoginCustBean loginCustBean) {
        String username = loginCustBean.getCustUsername(); 
        String password = loginCustBean.getCustPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        
        try
        {
            con = DBConnection.createConnection(); 
            statement = con.createStatement(); 
            resultSet = statement.executeQuery("select custUsername,custPassword from customer");
            
            while(resultSet.next())
            {
                userNameDB = resultSet.getString("custUsername"); 
                passwordDB = resultSet.getString("custPassword");
                
                if(username.equals(userNameDB) && password.equals(passwordDB))
                    return "SUCCESS";
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
