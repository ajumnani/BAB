<%@page import="com.bab.dto.Buddy"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        
    String jobId = request.getParameter("jobId");

	System.out.println("JobId"+jobId);
	
    Connection conn=null;
    PreparedStatement stmt=null;    
    try{
    	DBConnecction db=new DBConnecction();
        conn=db.getJNDIConnection();
        Buddy buddy=(Buddy)session.getAttribute("buddy");
        	if(buddy!=null){
          	
    	   	String sql="UPDATE BAB_JOB_DETAILS SET flag = 'D' , update_Date = sysdate WHERE  job_id= ? ";
          	stmt=conn.prepareStatement(sql);
    	    stmt.setString(1, jobId );
    	    
    	    int i=stmt.executeUpdate();
    	     	    
    	    if (i > 0) {
    	        //session.setAttribute("userid", user);
    	         
    	         request.setAttribute("errorMessage", "Your Job Deleted...");
    	         request.setAttribute("errorColor", "green");
    	         
    		   	 RequestDispatcher rd = request.getRequestDispatcher("/viewMyJobs.jsp");
    		     rd.forward(request, response);   
    	    } 
    	    else {   

    	   	   	      
    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
    	   	 	 request.setAttribute("errorColor", "red");
 	         
    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewMyJobs.jsp");
    	   	     rd.forward(request, response);    	    	
    	    }   
        	
    	    
        	}
        	else{
        		
    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewMyJobs.jsp");
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