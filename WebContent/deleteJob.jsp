<%@page import="com.bab.dto.Buddy"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        
    String jobId = request.getParameter("jobId");
    String jobPosterEmail = request.getParameter("jobPosterEmail");
    Connection conn=null;
    PreparedStatement stmt=null;    
    try{
    	DBConnecction db=new DBConnecction();
        conn=db.getJNDIConnection();
        Buddy buddy=(Buddy)session.getAttribute("buddy");
        	if(buddy!=null){
          	
    	    
		   
    	    if(jobPosterEmail.equalsIgnoreCase(buddy.getEmailId())){
			String sql="UPDATE job_posts SET flag = ? WHERE job_poster_email = ? and job_id=?";
          	stmt=conn.prepareStatement(sql);
    	    stmt.setString(1, "N");
    	    stmt.setString(2,buddy.getEmailId() );
    	    stmt.setString(3,jobId );
    	    
    	    int i=stmt.executeUpdate();
    	     	    
    	    if (i > 0) {
    	        //session.setAttribute("userid", user);
    	         
    	         request.setAttribute("errorMessage", "Job deleted Successfull");
    		   	 RequestDispatcher rd = request.getRequestDispatcher("/viewMyJobs.jsp");
    		     rd.forward(request, response);   
    	    } 
    	    else {   

    	   	   	      
    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewMyJobs.jsp");
    	   	     rd.forward(request, response);    	    	
    	    }   
        	}else{
        	 request.setAttribute("errorMessage", "You tried to delete job which was not posted by you");
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