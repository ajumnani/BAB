<%@page import="com.bab.dto.Buddy"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    Buddy buddy=(Buddy)session.getAttribute("buddy");
	
    String applierName = request.getParameter("name");
    String applierEmail = request.getParameter("email");
    String posterEmail = request.getParameter("posterEmail");
    String applierContact = request.getParameter("contact");
    String jobId = request.getParameter("jobId");
    
    
    Connection conn=null;
    PreparedStatement stmt=null;    
    try{
    	if(buddy!=null){
    	DBConnecction db=new DBConnecction();
        conn=db.getJNDIConnection();
        applierEmail=buddy.getEmailId();
        applierName=buddy.getBuddyFirstName();
        
        if(!applierEmail.equalsIgnoreCase(posterEmail)){
       
        	String sql = "select * from applied_jobs where applier_buddy_email=? and job_id=?";
        	stmt = conn.prepareStatement(sql);
    	  	stmt.setString(1, applierEmail);
    		stmt.setString(2, jobId);
    		    		
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            	
            	
            	request.setAttribute("errorMessage", "You have already applied for this job");
           	    RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
                rd.forward(request, response);  
            } else {
            	 sql="insert into applied_jobs(applier_buddy_email, job_id, job_poster_email, job_applier_contact,job_applier_name) values (?,?,?,?,?)";    
    		    
        	    stmt=conn.prepareStatement(sql);
        	    stmt.setString(1, applierEmail);
        	    stmt.setString(2, jobId);
        	    stmt.setString(3, posterEmail);
        	    stmt.setString(4, applierContact);
        	    stmt.setString(5, applierName);
        	    
        	       	    
        	    
        	    //ResultSet rs;
        	    int i = stmt.executeUpdate();
        	    if (i > 0) {
        	        //session.setAttribute("userid", user);
        	         
        	         request.setAttribute("errorMessage", "Job Applied Successfully");
        		   	 RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
        		     rd.forward(request, response);   
        	    } 
        	    else {   

        	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
        	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
        	   	     rd.forward(request, response);    	    	
        	    }   
            }
        
        	
        	
        	
        	
        	    	    
        }else{
        	request.setAttribute("errorMessage", "You tried to apply job posted by yourself");
	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
	   	     rd.forward(request, response); 
        }
    
    	}else{
    		 request.setAttribute("errorMessage", "Please login to apply jobs");
	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
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