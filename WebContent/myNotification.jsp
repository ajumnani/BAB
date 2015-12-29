<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="com.bab.dto.MyNotifications"%>
<%@page import="com.bab.dto.JobPost"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.bab.dbconfig.DBConnecction"%>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Notification | Bring Any Buddy (BAB) JOB PORTAL</title>
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
	   
	 <div class="col-md-8 single_right">
	      <div class="but_list">
	       <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">My Notification - Check who all has applied your Job</a></li>
			  
			</ul>
		<div id="myTabContent" class="tab-content">
		  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
		   
		   
		   		  <%
		   
		   List<MyNotifications> myNotifications=new ArrayList<MyNotifications>();
		   
		   DBConnecction db=new DBConnecction();
		   Connection conn=null;
		   PreparedStatement stmt=null;
		   ResultSet rs=null;
		   try{    //: Execute a query
		        System.out.println("Creating statement before conne...");
		   		conn=db.getJNDIConnection();
		   		System.out.println("Creating statement after conne...");
		   		
		   		
		   		if(buddy!=null){
		   		//My Applied Jobs STarts here
		        String sqlMyAppliedJobs = "select * from job_posts a,applied_jobs b where a.job_id=b.job_id and b.job_poster_email=? order by a.job_post_date desc";
		    	stmt = conn.prepareStatement(sqlMyAppliedJobs);
		    	stmt.setString(1, buddy.getEmailId());
				
				rs = stmt.executeQuery();
				System.out.println("Success 1");
				while (rs.next()) {
		        	System.out.println("Success 2");
		        	MyNotifications myNotiObj=new MyNotifications();
		        	myNotiObj.setJobTitle(rs.getString("job_tittle"));
		        	myNotiObj.setJobAppliedDate(rs.getString("job_applied_date"));
		        	myNotiObj.setJobApplierName(rs.getString("job_applier_name"));
		        	myNotiObj.setJobApplierContact(rs.getString("job_applier_contact"));
		        	myNotiObj.setJobApplierEmail(rs.getString("applier_buddy_email"));
		        	myNotiObj.setJobLocation(rs.getString("job_location"));
		        	myNotifications.add(myNotiObj);
		        }
		        }
		   		
		   		rs=null;	   		
		   		
		        
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
		   
		   
		   <% if(buddy!=null){
		   
			   for(int i=0;i<myNotifications.size();i++){
					MyNotifications myNotify=new MyNotifications();
					myNotify=myNotifications.get(i);
					
		   %>
		   
		   <div class="tab_grid">
			    
			    <div class="col-sm-9">
			       <div class="location_box1">
			    	 <h6><a href=""><%=myNotify.getJobTitle() %> </a><span class="m_1">Applied On <%=myNotify.getJobAppliedDate() %></span></h6>
					 <p><span class="m_2">Applied Budy Name : </span><%=myNotify.getJobApplierName() %></p>
			    	 <p><span class="m_2">Apply Buddy Email ID : </span><%=myNotify.getJobApplierEmail() %></p>
					 <p><span class="m_2">Apply Buddy Contact No : </span><%=myNotify.getJobApplierContact()%></p>
			    	 
				   </div>
			    </div>
			    <div class="clearfix"> </div>
			 </div>
			 
			 <%}
			 }else{ %>
			
			<a href="login.jsp">Please login to view this</a>
			
			<%} %>
			 
			</div>	
		</div>	
	</div>
	
	</div>
	</div>
	</div>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>	