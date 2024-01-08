
package dao;


import bean.LoginAdminBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBconnection;


public class LoginDaoAdmin 
{
    public String authenticateUser (LoginAdminBean loginBean)
    {
        String username = loginBean.getAdminUsername(); 
        String password = loginBean.getAdminPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        
        try
        {
            con = DBconnection.createConnection(); 
            statement = con.createStatement(); 
            resultSet = statement.executeQuery("select username,password from admin");
            
            while(resultSet.next())
            {
                userNameDB = resultSet.getString("username"); 
                passwordDB = resultSet.getString("password");
                
                if(username.equals(userNameDB) && password.equals(passwordDB))
                    return "SUCCESS";
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
