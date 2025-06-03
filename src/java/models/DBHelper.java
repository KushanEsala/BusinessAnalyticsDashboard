/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author MSii
 */
public class DBHelper {
    public static Connection connectTODatabase(String url, String username, String password) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = null;
        connection = DriverManager.getConnection(url,username,password);
        
        
        return connection;
        
    } 
}
