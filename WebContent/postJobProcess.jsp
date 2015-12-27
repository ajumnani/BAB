<%@page import="com.bab.dto.Buddy"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
        
    String jtitle = request.getParameter("jtitle");
    String jdesc = request.getParameter("jdesc");
    String company = request.getParameter("company");
    String exp = request.getParameter("exp");
    String skills = request.getParameter("skills");
    String location = request.getParameter("location");
    
    Buddy buddy=new Buddy();
    buddy=(Buddy)session.getAttribute("buddy");
    String jobPosterName=buddy.getBuddyFirstName();
    String jobPosterEmail=buddy.getEmailId();
    Connection conn=null;
    PreparedStatement stmt=null;

	DBConnecction db=new DBConnecction();
    conn=db.getJNDIConnection();
    try{
        
            String sql="insert into job_posts(job_id,job_poster_name, job_poster_email, job_tittle, job_description,job_company,job_exp_level,job_skills,job_location) values (seq_jobid.NEXTVAL,?,?,?,?,?,?,?,?)";    
		    stmt=conn.prepareStatement(sql);
    	    stmt.setString(1, jobPosterName);
    	    stmt.setString(2, jobPosterEmail);
    	    stmt.setString(3, jtitle);
    	    stmt.setString(4, jdesc);
    	    stmt.setString(5, company);
    	    stmt.setString(6, exp);
    	    stmt.setString(7, skills);
    	    stmt.setString(8, location);
    	    
    	    
    	    
    	    //ResultSet rs;
    	    int i = stmt.executeUpdate();
    	    if (i > 0) {
    	        //session.setAttribute("userid", user);
    	         
    	         request.setAttribute("errorMessage", "Job Posted Successfully");
    		   	 RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
    		     rd.forward(request, response);   
    	    } 
    	    else {   

    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
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