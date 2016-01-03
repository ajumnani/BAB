<%@page import="com.bab.dto.Buddy"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%	
    Buddy buddy=(Buddy)session.getAttribute("buddy");


	String jobId = request.getParameter("jobId");
	String jobOwnerEmailId = request.getParameter("jobOwnerEmailId");
 
 	String appliedBuddyEmailId = buddy.getEmailId();  
  	String appliedBuddyContactNo = request.getParameter("appliedBuddyContactNo");
    
  System.out.println("jobId..."+jobId); 
  System.out.println("appliedBudyEmailId..."+appliedBuddyEmailId); 
  
  
    Connection conn=null;
    PreparedStatement stmt=null;    
    try{
    	
    	if(buddy!=null){
    		
    		DBConnecction db=new DBConnecction();
        	conn=db.getJNDIConnection();
    		
        	
        	
        		
    		if(jobOwnerEmailId==appliedBuddyEmailId){
	    		System.out.println("You are Owner of this Job..."); 	
            	request.setAttribute("errorMessage", "You are Owner of this Job. You can not apply. Please apply Other Jobs");
            	request.setAttribute("errorColor", "red");
           	    RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
                rd.forward(request, response); 
	    	}
    		else{		
    		String sql ;
    		sql="insert into bab_applied_job_details(JOB_ID, APPLIED_BUDDY_EMAIL_ID,APPLIED_BUDDY_CONTACT_NO) values (?,?,?)"; 
        	stmt = conn.prepareStatement(sql);
			stmt=conn.prepareStatement(sql);
	    	stmt.setString(1, jobId);
	   	 	stmt.setString(2, appliedBuddyEmailId);
	    	stmt.setString(3, appliedBuddyContactNo);
	    
	    	int i=stmt.executeUpdate();
	    	if (i > 0) {
	        //session.setAttribute("userid", user);
				System.out.println("Job Applied Successfully..."); 	         
	         	request.setAttribute("errorMessage", "Your details sent to Job Owner");
	         	request.setAttribute("errorColor", "green");
		   	 	RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
		     	rd.forward(request, response);   
	    	}
    			
	    	
	    	else{
	    		System.out.println("Already applied..."); 	
            	request.setAttribute("errorMessage", "You have already applied for this job");
            	request.setAttribute("errorColor", "red");
           	    RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
                rd.forward(request, response);  
	    	}
    
    	}
    }
 }catch(SQLException se){
	   //Handle errors for JDBC
	   System.out.println("Already applied..."); 	
       request.setAttribute("errorMessage", "You have already applied for this job");
       request.setAttribute("errorColor", "red");
       RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
       rd.forward(request, response);  
	   se.printStackTrace();
	    
	}catch(Exception e){
	   //Handle errors for Class.forName
	   
	   System.out.println("Already applied..."); 	
       request.setAttribute("errorMessage", "You have already applied for this job");
       request.setAttribute("errorColor", "red");
       RequestDispatcher rd = request.getRequestDispatcher("/viewAvailableJobs.jsp");
       rd.forward(request, response);  
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