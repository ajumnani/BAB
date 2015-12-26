<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    
    Connection conn=null;
    PreparedStatement stmt=null;    
    try{
    	DBConnecction db=new DBConnecction();
        conn=db.getJNDIConnection();
        
        
        
       
        	String sql="insert into buddy(first_name, email, pass, contact,company_name) values (?,?,?,?,?)";    
		    
    	    stmt=conn.prepareStatement(sql);
    	    stmt.setString(1, name);
    	    stmt.setString(2, email);
    	    stmt.setString(3, contact);
    	    
    	    
    	    
    	    //ResultSet rs;
    	    int i = stmt.executeUpdate();
    	    if (i > 0) {
    	        //session.setAttribute("userid", user);
    	         
    	         request.setAttribute("errorMessage", "Registration Successfull, Please enter your credentials to Login");
    		   	 RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
    		     rd.forward(request, response);   
    	    } 
    	    else {   

    	   	   	 session.invalidate();        
    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
    	   	     rd.forward(request, response);    	    	
    	    }   
        
    	
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