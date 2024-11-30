/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.*;

/**
 *
 * @author alunocmc
 */
public class ConectaDB {
    public static Connection conectar() throws ClassNotFoundException{
        Connection conexao = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/avalia","root","");
            return conexao;
        }catch(SQLException ex){ 
            System.out.println("Error: " + ex);
        }                  
        return conexao;        
    }
}
