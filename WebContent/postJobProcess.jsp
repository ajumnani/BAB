<%@page import="com.bab.dto.Buddy"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	Buddy buddy=new Buddy();
	buddy=(Buddy)session.getAttribute("buddy");



    String jobTitle = request.getParameter("jobTitle");
    String jobDescription = request.getParameter("jobDescription");
    String jobCompany = request.getParameter("jobCompany");
    String jobLocation = request.getParameter("jobLocation");
    String jobExp = request.getParameter("jobExp");
    String jobSkills = request.getParameter("jobSkills");
	String jobOwnerEmailId=buddy.getEmailId();    
   
    
    Connection conn=null;
    PreparedStatement stmt=null;

	DBConnecction db=new DBConnecction();
    conn=db.getJNDIConnection();
    try{
        
            String sql="insert into BAB_JOB_DETAILS(job_title,job_description,job_company,job_location,job_exp,job_skills,job_owner_email_id,create_date,update_date,flag) values (?,?,?,?,?,?,?,sysdate(),sysdate(),'A')";    
		    stmt=conn.prepareStatement(sql);
		    stmt.setString(1, jobTitle);
    	   	stmt.setString(2, jobDescription);
    	    stmt.setString(3, jobCompany);
    	    stmt.setString(4, jobLocation);
    	    stmt.setString(5, jobExp);
    	    stmt.setString(6, jobSkills);
    	    stmt.setString(7, jobOwnerEmailId);
    	    
    	    
    	    
    	    //ResultSet rs;
    	    int i = stmt.executeUpdate();
    	    if (i > 0) {
    	        //session.setAttribute("userid", user);
    	         
    	         request.setAttribute("errorMessage", "Your New Job added successfully..");
    	         request.setAttribute("errorColor", "green");
    		   	 RequestDispatcher rd = request.getRequestDispatcher("/viewMyJobs.jsp");
    		     rd.forward(request, response);   
    	    } 
    	    else {   

    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
    	   	 	 request.setAttribute("errorColor", "red");
    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/postNewJob.jsp");
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
	    	  stmt.close();
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