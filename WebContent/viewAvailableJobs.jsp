<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="com.bab.dto.JobPost"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.bab.dbconfig.DBConnecction"%>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Available Jobs | Bring Any Buddy (BAB)</title>
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
        <div class="col-sm-10 follow_left">
			<h3>Latest Available Jobs</h3>
        				
		       
		
		   
		   
		    <%
		   
		   List<JobPost> allJobs=new ArrayList<JobPost>();
		   List<JobPost> myAppliedJobs=new ArrayList<JobPost>();
		   List<JobPost> myPostedJobs=new ArrayList<JobPost>();
		   
		   DBConnecction db=new DBConnecction();
		   Connection conn=null;
		   PreparedStatement stmt=null;
		   ResultSet rs=null;
		   try{    //: Execute a query
		        System.out.println("Creating statement...");
		   		conn=db.getJNDIConnection();
		        //All Jobs Starts here
		    	String sqlAllJobs = "select * from job_posts order by job_post_date desc";
		    	stmt = conn.prepareStatement(sqlAllJobs);
		    	System.out.println("Creating statement... 2");
		    	rs = stmt.executeQuery();
		        while (rs.next()) {
		        	JobPost jobPost=new JobPost();
		        	jobPost.setCompanyName(rs.getString("job_company"));
		        	jobPost.setExpLevel(rs.getString("job_exp_level"));
		        	jobPost.setJobDescription(rs.getString("job_description"));
		        	jobPost.setJobID(rs.getString("job_id"));
		        	jobPost.setJobPosterEmail(rs.getString("job_poster_email"));
		        	jobPost.setJobPosterName(rs.getString("job_poster_name"));
		        	jobPost.setJobTitle(rs.getString("job_tittle"));
		        	jobPost.setJobPostDate(rs.getString("job_post_date"));
					jobPost.setSkills(rs.getString("job_skills"));
		        	allJobs.add(jobPost);
					
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
			
		   
		   <% for(int i=0;i<allJobs.size();i++){
			JobPost jobPost=new JobPost();
			jobPost=allJobs.get(i);
			
			%>
		   <div class="jobs_follow jobs-single-item">
				<div class="thumb_right">
				<div class="date"><%=jobPost.getJobPostDate() %></div>
				<h6 class="title"><a href="#"><%=jobPost.getJobTitle() %></a></h6>
				
				<ul class="top-btns">
					<li>
						<a href="#" class="btn_1 fa fa-star-o icon_2"></a>
					</li>
				</ul>
				<br>
				<p>Job Description : <%=jobPost.getJobDescription() %>
				 </p> <br>
				<p> Company : <%=jobPost.getCompanyName() %> </p> <br>
				<p> Experince require :<%=jobPost.getExpLevel() %> </p><br>
				<p>Skills :<%=jobPost.getSkills() %> </p>
				
				
                <hr>
                <a href="#" class="btn btn-default pull-left" data-toggle="modal" data-target="#applyModal">Apply for this Job</a>
	         
				</div>
				</div>
						<%} %>		 
			 
	
	<script>
	$('#applyModal').on('show.bs.modal', function (e) {
		  var $invoker = $(e.relatedTarget);
		  alert($invoker);
		});
	</script>
				<!-- Modal -->
				<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
				  	<div class="modal-dialog">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					        	<h4 class="modal-title" id="myModalLabel">Apply for this job</h4>
					      	</div>
					      	<%if(buddy==null){ %>
	                        <div class="modal-body">
					          Before you apply you have to login as a Buddy			
					          <p><a href="login.jsp">Log in</a></p>
					      	</div>
					      	<%}else{
					      		
					      		%>
					      	
							
							<!-- If else -->
							
							<div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					        	<h4 class="modal-title" id="myModalLabel">Below details will be sent to Owner opfo this Job. They will contact you.</h4>
					      	</div>
	                        <div class="modal-body">
							<form method="Post" action="applyJob.jsp">
					          Name : <input type="text" path="name" id="name" class="form-control input-sm" value="<%=buddy.getBuddyFirstName() %>" disabled name="name"/>			
							  Email ID : <input type="text" path="email" id="email" class="form-control input-sm" value="<%=buddy.getEmailId() %>" disabled name="email"/>			
							  
							  Contact No : <input type="text" path="contact" id="contact" class="form-control input-sm" value="<%=buddy.getContactNumber()%>" name="contact"/>
							  <%
							  String jobId=request.getParameter("job_id");
							  %>	
							  JOB ID : <input type="text" path="jobid" id="jobid" class="form-control input-sm" value="<%=jobId%>" name="contact"/>
							  <br>
							  <input type="submit" value="Apply Job" class="btn btn-primary btn-sm">							  
							 </form>
					      	</div>
							
							 <%} %>
							
				    	</div>
				  	</div>
				
<!-- 	            <ul class="social-icons pull-right">
					<li><span>Share : </span></li>
					<li><a href="#" class="fa fa-facebook" target="_blank"></a></li>
					<li><a href="#" class="fa fa-twitter" target="_blank"></a></li>
					<li><a href="#" class="fa fa-google-plus" target="_blank"></a></li>
				</ul> -->
				<div class="clearfix"> </div>
		    </div>
		   <div class="clearfix"> </div>
		   </div>
		   
		   
		   

		   
		   
		   		   
		   
		   
		   
		    
	    </div>
		
		<div class="clearfix"> </div>
	</div>
</div>





</body>
</html>	