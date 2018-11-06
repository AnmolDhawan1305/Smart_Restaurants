/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author HP 250 G5
 */
public class DBlayer{
  static String d="com.mysql.jdbc.Driver";
  static String cong="jdbc:mysql://localhost/restro";
  static String un="root";
  static String pwd="";
  static Connection c;
  static Statement s;
  static ResultSet rs;
  public static boolean executeq(String sql)
  {
     try{
       Class.forName(d);
       c=DriverManager.getConnection(cong,un,pwd);
       s=c.createStatement();
       s.execute(sql);
       c.close();
       return true;
       }catch(Exception ex){ System.out.println(ex.getMessage()); return false; }
       }
   public static ResultSet getResult(String sql)
   {
     try{
       Class.forName(d);
       c=DriverManager.getConnection(cong,un,pwd);
       s=c.createStatement();
       rs=s.executeQuery(sql);
       return rs;
       }catch(Exception ex){ return null; }
       }
      public static String getScalar(String sql)
      {
        try{
       Class.forName(d);
       c=DriverManager.getConnection(cong,un,pwd);
       s=c.createStatement();
       rs=s.executeQuery(sql);
       rs.next();
       String t=rs.getString(1);
       c.close();
       return t;
       }catch(Exception ex)
       {
         //JOptionPane.showMessageDialog(null,""+ex);
         return null;
         }
     }
   }
