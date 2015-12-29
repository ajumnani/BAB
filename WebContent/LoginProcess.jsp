<%@page import="com.bab.dbconfig.*,com.bab.dto.Buddy"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String email = request.getParameter("emailid");    
    String pwd = request.getParameter("password");
    
    Connection conn=null;
    DBConnecction db=new DBConnecction();
    conn=db.getJNDIConnection();
    PreparedStatement stmt=null;
    Buddy buddy=new Buddy();
      
    try{    //: Execute a query
        System.out.println("Creating statement...");
        
    	String sql = "SELECT * FROM  BAB_PROFILE where EMAIL_ID=? and PASSWORD=?";
    	stmt = conn.prepareStatement(sql);
	
    	stmt.setString(1, email);
		stmt.setString(2, pwd);
		System.out.println("email "+email);
		System.out.println("pass "+pwd);
		
		
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
        	System.out.println("Success");
        	
        	buddy.setEmailId(rs.getString("EMAIL_ID"));
        	buddy.setBuddyName(rs.getString("NAME"));
        	buddy.setContactNo(rs.getString("CONTACT_NO"));
        	buddy.setCurrentCompanyName(rs.getString("CURRENT_COMPANY_NAME"));
        	
            session.setAttribute("buddy", buddy);
            response.sendRedirect("register.jsp");
        } else {
        	 session.invalidate();        
        	 request.setAttribute("errorMessage", "Invalid Username or Password");
        	 RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
             rd.forward(request, response);   
        }
        rs.close();
     }catch(SQLException se){
        //Handle errors for JDBC
        se.printStackTrace();
     }catch(Exception e){
        //Handle errors for Class.forName
        e.printStackTrace();
     }finally{
        //finally block used to close resources
        try{
           if(stmt!=null)
              conn.close();
        }catch(SQLException se){
        }// do nothing
        try{
           if(conn!=null)
              conn.close();
        }catch(SQLException se){
           se.printStackTrace();
        }//end finally try
     }//end try
 
    
%>






