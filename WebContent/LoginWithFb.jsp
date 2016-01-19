


<%@page import="com.bab.dbconfig.*,com.bab.dto.Buddy"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	
	String email = (String)request.getAttribute("email");  
    String name = (String)request.getAttribute("name");
    Buddy buddy=new Buddy();
    buddy.setBuddyName(name);
    buddy.setEmailId(email);
    Connection conn=null;
    DBConnecction db=new DBConnecction();
    
    PreparedStatement stmt=null;  
    try{    //: Execute a query
    	conn=db.getJNDIConnection();
    	if (buddy.getEmailId()!=null) {
    		
    		if(!"".equalsIgnoreCase(buddy.getEmailId())){
    			
    			System.out.println("Creating statement...");
    	       	String sql = "SELECT * FROM  BAB_PROFILE where upper(EMAIL_ID) = upper(?)";
    	    	stmt = conn.prepareStatement(sql);
    		   	stmt.setString(1, buddy.getEmailId());
    			
    	        ResultSet rs = stmt.executeQuery();
    	        if (rs.next()) {
    	        	System.out.println("Success");

    	        	sql="update BAB_PROFILE set EMAIL_ID=?,NAME=? where EMAIL_ID=?";    
    			    
    	    	    stmt=conn.prepareStatement(sql);
    	    	    stmt.setString(1, buddy.getEmailId());
    	    	    stmt.setString(2, buddy.getBuddyName());
    	    	    stmt.setString(3, buddy.getEmailId());
    	    	    
    	    	   
    	    	    //ResultSet rs;
    	    	    int i = stmt.executeUpdate();
    	    	    if (i > 0) {
    	    	        //session.setAttribute("userid", user);
    	    	         request.setAttribute("errorMessage", "FB Login Successfull");
    	    	    	 session.setAttribute("buddy", buddy);
    	    	         response.sendRedirect("viewAvailableJobs.jsp");
    	    	    } 
    	    	    else {   

    	    	   	   	 session.invalidate();        
    	    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
    	    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
    	    	   	     rd.forward(request, response);    	    	
    	    	    } 	    
    	    	    
    	        	
    	           
    	        } else {
    	        	
    	        	
    	        	sql="insert into BAB_PROFILE (EMAIL_ID,NAME) values (?,?)";    
    			    
    	    	    stmt=conn.prepareStatement(sql);
    	    	    stmt.setString(1, buddy.getEmailId());
    	    	    stmt.setString(2, buddy.getBuddyName());
    	    	   
    	    	    //ResultSet rs;
    	    	    int i = stmt.executeUpdate();
    	    	    if (i > 0) {
    	    	        //session.setAttribute("userid", user);
    	    	         request.setAttribute("errorMessage", "FB Login Successfull");
    	    	    	 session.setAttribute("buddy", buddy);
    	    	         response.sendRedirect("viewAvailableJobs.jsp");
    	    	    } 
    	    	    else {   

    	    	   	   	 session.invalidate();        
    	    	   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
    	    	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
    	    	   	     rd.forward(request, response);    	    	
    	    	    } 	    
    	    	    
    	        	
    	        }
    	        rs.close();
    			
    			
                
    		}
    		else{
    			session.invalidate();        
           	 	request.setAttribute("errorMessage", "We didnt received your email from facebook");
           	 	RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
    		}
        	System.out.println("Success");
        	
        	
        } else {
        	 session.invalidate();        
        	 request.setAttribute("errorMessage", "We didnt received your email from facebook");
        	 RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
             rd.forward(request, response);   
        }
        
     }catch(Exception e){
        //Handle errors for Class.forName
        e.printStackTrace();
     }finally{
        //finally block used to close resources
      
     }//end try
 
    
%>






