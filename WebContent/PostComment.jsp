
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%@page import="com.bab.dto.JobComments"%>
<%@page import="com.bab.dto.JobPost"%>
<%@page import="com.bab.dto.Buddy"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.bab.dbconfig.DBConnecction"%>
<%@page import="java.sql.*"%>


				<% 
				String jobId=request.getParameter("job_id_valid");
				
	     	 if(request.getParameter("commentPost")!=null){
	    	 System.out.println("1 Job Id "+jobId+" Msg"+ request.getParameter("CommentMessage"));
	    	
	    	  if("PostAComment".equalsIgnoreCase(request.getParameter("commentPost"))){
	    		  DBConnecction db = new DBConnecction();
					Connection conn = null;
					PreparedStatement stmt = null;
					ResultSet rs = null;
	
	    		  try{
				    	db=new DBConnecction();
				        conn=db.getJNDIConnection();
				         Buddy buddy=(Buddy)session.getAttribute("buddy");
				        	if(buddy!=null){
				          	String sql="INSERT INTO JOB_COMMENTS(job_id,comment_poster_email,comment_poster_name,comment_msg) VALUES(?,?,?,?)";
				          	stmt=conn.prepareStatement(sql);
				    	    stmt.setString(1, jobId);
				    	    stmt.setString(2, buddy.getEmailId());
				    	    stmt.setString(3, buddy.getBuddyName());
				    	    stmt.setString(4,request.getParameter("CommentMessage"));
				    	    //ResultSet rs;
				    	    int i = stmt.executeUpdate();
				    	    
						      	    
				    	    if (i > 0) {
				    	        //session.setAttribute("userid", user)
				    	   //        	 request.setAttribute("errorMessage", "Comment Posted Suceesfully");
	     	   		 		 request.setAttribute("job_id_from", jobId);
     	   	 	 			 request.setAttribute("page_from", "VAJ");		
     	   	     
				    		   	 RequestDispatcher rd = request.getRequestDispatcher("/viewSingleJob.jsp");
				    		     rd.forward(request, response);   
				    	    } 
				    	    else {   
				    	      	 request.setAttribute("errorMessage", "Something went wrong,please retry...");
				     	   		 request.setAttribute("job_id_from", jobId);
			     	   	 	 	 request.setAttribute("page_from", "VAJ");		
			     	   	     
				    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewSingleJob.jsp");
				    	   	     rd.forward(request, response);    	    	
				    	    }   
				        	
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
	    	  }
	    	  
	    	  
	    		  else {   

    	   	   	      
	     	   	   	 request.setAttribute("errorMessage", "Something went wrong,please retry");
	     	   		 request.setAttribute("job_id_from", jobId);
     	   	 	 	 request.setAttribute("page_from", "VAJ");		
     	   	     
	     	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/viewSingleJob.jsp");
	     	   	   	 rd.forward(request, response);    	    	
	     	    }   

	    	  
	      }
					%>
		  
			
						
		