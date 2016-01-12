<%@page import="com.bab.dto.Buddy"%>
<%@page import="com.bab.dbconfig.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%




	String currentpwd=request.getParameter("currentpwd");
	String Newpass=request.getParameter("newpwd");
	String conpass=request.getParameter("confirmnewpwd");
    
	
    Connection conn=null;
    PreparedStatement stmt=null; 
    ResultSet rs=null;
    try{
   	   DBConnecction db=new DBConnecction();
       conn=db.getJNDIConnection();
       Buddy buddy=(Buddy)session.getAttribute("buddy");
       System.out.println("1");
    if(buddy!=null){
        String sql="select * from BAB_PROFILE where password=? and EMAIL_ID=?";
        System.out.println("2");
        stmt=conn.prepareStatement(sql);
   	    stmt.setString(1, currentpwd);
   	    stmt.setString(2,buddy.getEmailId());
   	    rs=stmt.executeQuery();
   	String pass="";    
   	while(rs.next()){
   		System.out.println("3");
   	pass=rs.getString("password");
   	}
   	if(currentpwd.equals(pass)){
   		System.out.println("4");
   	String sql2="UPDATE BAB_PROFILE SET PASSWORD = ? WHERE EMAIL_ID = ?";
   	stmt=conn.prepareStatement(sql2);
   	stmt.setString(1, conpass);
	stmt.setString(2,buddy.getEmailId());
	 
   	int i=stmt.executeUpdate();
   	System.out.println("5");
   	if (i > 0) {
        //session.setAttribute("userid", user);
         
   		session.invalidate();        
   	 	request.setAttribute("errorMessage", "Password Changed Successfully");
   	 	RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        rd.forward(request, response);   
    } 
    else {   
  	   	      
   	   	 request.setAttribute("errorMessage", "Some Technical Problem occured,please retry");
   	   	 RequestDispatcher rd = request.getRequestDispatcher("/ChangePwd.jsp");
   	     rd.forward(request, response);    	    	
    }   
	
   	}
   	
  	
   	  	else{
   	  		request.setAttribute("errorMessage", "Invalid Current Password");
   	   	   	 RequestDispatcher rd = request.getRequestDispatcher("/ChangePwd.jsp");
   	   	     rd.forward(request, response); 
       	}
       	
   	
	}
    
    
    
    }
    catch(SQLException se){
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
