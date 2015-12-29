<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        
    String emailId = request.getParameter("emailId");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String contactNo = request.getParameter("contactNo");
	String currentCompany=request.getParameter("currentCompany");
	
    Connection conn=null;
    PreparedStatement stmt=null;    
    try{
    	DBConnecction db=new DBConnecction();
        conn=db.getJNDIConnection();
        
        
        
        String existsSql = "select * from BAB_PROFILE  where EMAIL_ID =?";
    	stmt = conn.prepareStatement(existsSql);
	
    	stmt.setString(1, emailId);
		System.out.println("email "+emailId);
		
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {

   	   	 session.invalidate();        
   	   	 request.setAttribute("errorMessage", "Email Id Already Exists.");
   	  	 request.setAttribute("errorColor", "red");
   	   	 RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
   	     rd.forward(request, response);
        	
        } else {
        	String sql="insert into BAB_PROFILE (EMAIL_ID,PASSWORD,NAME,CONTACT_NO,CURRENT_COMPANY_NAME) values (?,?,?,?,?)";    
		    
    	    stmt=conn.prepareStatement(sql);
    	    stmt.setString(1, emailId);
    	    stmt.setString(2, password);
    	    stmt.setString(3, name);
    	    stmt.setString(4, contactNo);
    	    stmt.setString(5, currentCompany);
    	    
    	    
    	    //ResultSet rs;
    	    int i = stmt.executeUpdate();
    	    if (i > 0) {
    	        //session.setAttribute("userid", user);
    	         
    	         request.setAttribute("errorMessage", "Your Registartion Completed. Please Click here to <a href='login.jsp'>Login</a>");
    	         request.setAttribute("errorColor", "green");
    		   	 RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
    		     rd.forward(request, response);   
    	    } 
    	    else {   

    	   	   	 session.invalidate();        
    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
    	   	     rd.forward(request, response);    	    	
    	    }   
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