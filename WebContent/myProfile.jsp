<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="com.bab.dbconfig.*,com.bab.dto.Buddy"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Profile | Bring Any Buddy (BAB) JOB PORTAL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Seeking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<!----font-Awesome----->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!----font-Awesome----->
</head>
<body>
<%@ include file="header.jsp" %>
	
	<div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>My Profile</h2>
       					
        				<%
		 					   if(null!=request.getAttribute("errorMessage"))
							    {
		 				%>			
		 				 <center><div class="row" style="background-color: #33FF00; padding-bottom:2%; width:70%">
       					 <center><p style="color: white; padding-top: 2%"><%=request.getAttribute("errorMessage") %></p></center>
						</div><center>
							      
						<%
							    }
						%>
					
		<%if(buddy==null){ %>
		<div class="row">
            <div class="form-group col-md-12">
                <div class="col-md-9">
                    <a href="login.jsp">Please Login to view your profile</a>
                </div>
            </div>
         </div>
		<%}else{
			
			
		    
		    Connection conn=null;
		    DBConnecction db=new DBConnecction();
		    conn=db.getJNDIConnection();
		    PreparedStatement stmt=null;
		    Buddy profile=new Buddy();
		      
		    try{    //: Execute a query
		        System.out.println("Creating statement...");
		        
		    	String sql = "select * from buddy where email=?";
		    	stmt = conn.prepareStatement(sql);
		    	
		    	stmt.setString(1, buddy.getEmailId());
			
		    	
				
		        ResultSet rs = stmt.executeQuery();
		        if (rs.next()) {
		        	System.out.println("Success");
		        	buddy.setBuddyFirstName(rs.getString("first_name"));
		        	buddy.setCompanyName(rs.getString("company_name"));
		        	buddy.setContactNumber(rs.getString("contact"));
		            session.setAttribute("buddy", buddy);
		            
		        }
		        rs.close();
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
		 <form method="post" action="updateProfile.jsp">
		
		<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="firstName">Email ID :</label>
                <div class="col-md-9">
                    <input type="text" path="Username" id="Username" class="form-control input-sm" value="<%=buddy.getEmailId() %>" name="email" readonly="readonly"/>
                </div>
            </div>
         </div>
          <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="firstName">Name :</label>
                <div class="col-md-9">
                    <input type="text" path="Username" id="Username" class="form-control input-sm" value="<%=buddy.getBuddyFirstName()%>" name="name"/>
                </div>
            </div>
         </div>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName">Current Company :</label>
                <div class="col-md-9">
                    <input type="text" path="Password" id="Password" class="form-control input-sm" value="<%=buddy.getCompanyName()%>" name="company"/>
                </div>
            </div>
        </div>
		<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName">Contact Number :</label>
                <div class="col-md-9">
                    <input type="text" path="ConfirmPassword" id="ConfirmPassword" class="form-control input-sm" value="<%=buddy.getContactNumber()%>" name="contact"/>
                </div>
            </div>
        </div>
        
        
        
        
        <div class="row">
            <div class="form-actions floatRight">
                <center><input type="submit" value="Update My Profile" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#applyModal"></center>
                </div>
        </div>
        
    </form>
    <%} %>
    </div>
 </div>
</div>



	<%@ include file="footer.jsp" %>




</body>
</html>	