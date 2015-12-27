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
<title>View My Jobs | Bring Any Buddy (BAB)</title>
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
	   <div class="col-md-9 single_right">
	      <div class="but_list">
	       <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a href="#myapplied" id="myapplied-tab" role="tab" data-toggle="tab" aria-controls="myapplied" aria-expanded="true">My Applied Jobs</a></li>
			  <li role="presentation"><a href="#myposted" role="tab" id="myposted-tab" data-toggle="tab" aria-controls="myposted">My Posted Jobs</a></li>
		   </ul>
		   
		<div id="myTabContent" class="tab-content">
		  
		  <%
		 					   if(null!=request.getAttribute("errorMessage"))
							    {
		 				%>			
		 				 <center>
		 				 <div class="row" style="background-color: #33FF00; padding-bottom:2%; width:70%">
       					 <center><p style="color: white; padding-top: 2%"><%=request.getAttribute("errorMessage") %></p></center>
						</div>
						</center>
							      
						<%
							    }
						%>
		       
		  <%
		   
		   List<JobPost> myAppliedJobs=new ArrayList<JobPost>();
		   List<JobPost> myPostedJobs=new ArrayList<JobPost>();
		   
		   DBConnecction db=new DBConnecction();
		   Connection conn=null;
		   PreparedStatement stmt=null;
		   ResultSet rs=null;
		   try{    //: Execute a query
		        System.out.println("Creating statement...");
		   		conn=db.getJNDIConnection();
		        
		   		
		   		if(buddy!=null){
		   		//My Applied Jobs STarts here
		        String sqlMyAppliedJobs = "select * from job_posts a,applied_jobs b where a.job_id=b.job_id and b.applier_buddy_email=? order by a.job_post_date desc";
		    	stmt = conn.prepareStatement(sqlMyAppliedJobs);
		    	stmt.setString(1, buddy.getEmailId());
				
				rs = stmt.executeQuery();
				System.out.println("Success 1");
				while (rs.next()) {
		        	System.out.println("Success 2");
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
					myAppliedJobs.add(jobPost);
		        }
		        }
		   		
		   		
		   		if(buddy!=null){
		   		//My Posted Jobs Starts here
		        String sqlMyPostedJobs = "select * from job_posts where job_poster_email=? and flag='Y' order by job_post_date desc";
				
		    	stmt = conn.prepareStatement(sqlMyPostedJobs);
				stmt.setString(1, buddy.getEmailId());
				System.out.println("Success 3");
		    	rs = stmt.executeQuery();
		        while (rs.next()) {System.out.println("Success 4");
	        	JobPost jobPost=new JobPost();
	        	jobPost.setCompanyName(rs.getString("job_company"));
	        	jobPost.setExpLevel(rs.getString("job_exp_level"));
	        	jobPost.setJobDescription(rs.getString("job_description"));
	        	jobPost.setJobID(rs.getString("job_id"));
	        	jobPost.setJobPosterEmail(rs.getString("job_poster_email"));
	        	jobPost.setJobPosterName(rs.getString("job_poster_name"));
	        	jobPost.setJobTitle(rs.getString("job_tittle"));
	        	jobPost.setSkills(rs.getString("job_skills"));
	        	jobPost.setJobPostDate(rs.getString("job_post_date"));
	 
				myPostedJobs.add(jobPost);
		        }
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
		
		  
		  
		  
		  <div role="tabpanel" class="tab-pane fade in active" id="myapplied" aria-labelledby="myapplied-tab">
		    
			<%if(buddy!=null){ %>	    
		    <% for(int i=0;i<myAppliedJobs.size();i++){
			JobPost jobPost=new JobPost();
			jobPost=myAppliedJobs.get(i);
			
			%>
			 
			 <div class="tab_grid">
			    <div class="jobs-item with-thumb">
				    
				    <div class="jobs_right">
						<div class="date"><%=jobPost.getJobPostDate() %></div>
						<div class="date_desc"><h6 class="title"><a href="jobs_single.html"><%=jobPost.getJobTitle() %></a></h6>
						  
						</div>
						<div class="clearfix"> </div>
                        
						<p class="description">
						Job Description : <%=jobPost.getJobDescription() %>
						Company : <%=jobPost.getCompanyName()%><br>
						Experience require : <%=jobPost.getExpLevel()%> <br>
						Skills : <%=jobPost.getSkills() %> <br>
												  
							
                    </div>
					<div class="clearfix"> </div>
					
				</div>
			 </div>
			  <%}
			}
		    else{
				 %>
				<a href="login.jsp">Please login to view this</a>				 
			 <% }%>
			
			
		  </div>
		  
		  
		  <div role="tabpanel" class="tab-pane fade" id="myposted" aria-labelledby="profile-tab">
		    <%if(buddy!=null){ %>	    
		    <% for(int i=0;i<myPostedJobs.size();i++){
			JobPost jobPost=new JobPost();
			jobPost=myPostedJobs.get(i);
			
			%>	 
			 <div class="tab_grid">
			    <div class="jobs-item with-thumb">
				    <form method="post" action="deleteJob.jsp">
				    <div class="jobs_right">
						<div class="date"><%=jobPost.getJobPostDate() %></div>
						<div class="date_desc"><h6 class="title"><a href="jobs_single.html"><%=jobPost.getJobTitle() %></a></h6>
						  
						</div>
						<div class="clearfix"> </div>
                        
						<p class="description">
						Job Description : <%=jobPost.getJobDescription() %>
						Company : <%=jobPost.getCompanyName()%><br>
						Experience require : <%=jobPost.getExpLevel()%> <br>
						Skills : <%=jobPost.getSkills() %> <br>
						
                    </div>
					<div class="clearfix"> </div>
					<input type="hidden" name="jobId" value="<%=jobPost.getJobID() %>" >	
					<input type="hidden" name="jobPosterEmail" value="<%=jobPost.getJobPosterEmail() %>" >	
					
					<input type="submit" value="Delete Job" class="btn btn-primary btn-sm">	
					</form>
				</div>
			 </div>
			  <%}
		    }
		    else{
				 %>
				<a href="login.jsp">Please login to view this</a>				 
			 <% }%>
			
			 
		  </div>
	  </div>
     </div>
    </div>
    
   </div>
   <div class="col-md-3">
	   	  
	   	  
	   	  
	   </div>
  <div class="clearfix"> </div>
 </div>
</div>


<%@ include file="footer.jsp" %>

</body>
</html>	