<%@page import="com.bab.reset.SendMailSSL"%>
<%@page import="sun.security.util.Password"%>
<%@page import="com.bab.reset.SendMailSSL"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        
    String emailId = request.getParameter("emailId");
	SendMailSSL sendmail=new SendMailSSL();
	Connection conn=null;
    PreparedStatement stmt=null;    
    try{
    	DBConnecction db=new DBConnecction();
        conn=db.getJNDIConnection();
        
        String existsSql = "select password from BAB_PROFILE  where EMAIL_ID =?";
    	stmt = conn.prepareStatement(existsSql);
	  	stmt.setString(1, emailId);
		System.out.println("email "+emailId);
		
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
         boolean sent=false;
       	 try{	
		  sent=sendmail.sendMail(emailId,rs.getString("password"));
         }
         catch(Exception e){
        	 System.out.print("Mail failure");
        	 e.printStackTrace();
         }
		 if(sent){
   	   	 session.invalidate();        
   	   	 request.setAttribute("errorMessage", "Password Reset Successfull, please check you email");
   	  	 request.setAttribute("errorColor", "green");
   	   	 RequestDispatcher rd = request.getRequestDispatcher("/forgotpwd.jsp");
   	     rd.forward(request, response);
		 }
		 else{
			 session.invalidate();        
	   	   	 request.setAttribute("errorMessage", "Something went wrong, please re-try");
	   	  	 request.setAttribute("errorColor", "red");
	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/forgotpwd.jsp");
	   	     rd.forward(request, response);
		 }
		 
        } else {
        	session.invalidate();        
      	   	 request.setAttribute("errorMessage", "Email Id provided does not exist with us, please register to login");
      	  	 request.setAttribute("errorColor", "red");
      	   	 RequestDispatcher rd = request.getRequestDispatcher("/forgotpwd.jsp");
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