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
					if (null != request.getAttribute("errorMessage")) {
				%>
				<br>
				<br>
				<div class="row">
					<div class="form-actions floatRight">
						<font color="<%=request.getAttribute("errorColor") %>"><%=request.getAttribute("errorMessage")%></a></font>
					</div>
				</div>
				<br>

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
		        String sqlMyAppliedJobs = "select JOB_ID,JOB_TITLE,JOB_DESCRIPTION,JOB_COMPANY,JOB_LOCATION,JOB_EXP,JOB_SKILLS,JOB_OWNER_EMAIL_ID,CREATE_DATE,UPDATE_DATE,TO_CHAR(CREATE_DATE,'DD') POST_DAY,TO_CHAR(CREATE_DATE,'Mon') POST_MONTH_YEAR from bab_job_details a where job_id in (select job_id from bab_applied_job_details where applied_buddy_email_id = ? ) AND FLAG = 'A' order by update_Date desc";
		    	stmt = conn.prepareStatement(sqlMyAppliedJobs);
		    	stmt.setString(1, buddy.getEmailId());
				
				rs = stmt.executeQuery();
				System.out.println("Success 1");
				while (rs.next()) {
		        	System.out.println("Success 2");
		        	JobPost jobPost=new JobPost();
		        	
		        	jobPost.setJobId(rs.getString("job_id"));
		        	jobPost.setJobTitle(rs.getString("job_title"));
		        	jobPost.setJobDescription(rs.getString("job_description"));
		        	jobPost.setJobCompany(rs.getString("job_company"));
		        	jobPost.setJobLocation(rs.getString("job_location"));
		        	jobPost.setJobExp(rs.getString("job_exp"));
		        	jobPost.setJobSkills(rs.getString("job_skills"));
					jobPost.setJobOwnerEmailId(rs.getString("job_owner_email_id"));
					jobPost.setCreateDate(rs.getString("create_date"));
					jobPost.setUpdateDate(rs.getString("update_date"));
					jobPost.setPostDay(rs.getString("POST_DAY"));
					jobPost.setPostMonthYear(rs.getString("POST_MONTH_YEAR"));
				
					myAppliedJobs.add(jobPost);
		        }
		        }
		   		
		   		
		   		if(buddy!=null){
		   		//My Posted Jobs Starts here
		        String sqlMyPostedJobs = "select JOB_ID,JOB_TITLE,JOB_DESCRIPTION,JOB_COMPANY,JOB_LOCATION,JOB_EXP,JOB_SKILLS,JOB_OWNER_EMAIL_ID,CREATE_DATE,UPDATE_DATE,TO_CHAR(CREATE_DATE,'DD') POST_DAY,TO_CHAR(CREATE_DATE,'Mon') POST_MONTH_YEAR from bab_job_details a where job_owner_email_id = ? and flag = 'A' order by update_Date desc";
				
		    	stmt = conn.prepareStatement(sqlMyPostedJobs);
				stmt.setString(1, buddy.getEmailId());
				System.out.println("Success 3");
		    	rs = stmt.executeQuery();
		        while (rs.next()) {System.out.println("Success 4");
	        	JobPost jobPost=new JobPost();
	        
	        	jobPost.setJobId(rs.getString("job_id"));
	        	jobPost.setJobTitle(rs.getString("job_title"));
	        	jobPost.setJobDescription(rs.getString("job_description"));
	        	jobPost.setJobCompany(rs.getString("job_company"));
	        	jobPost.setJobLocation(rs.getString("job_location"));
	        	jobPost.setJobExp(rs.getString("job_exp"));
	        	jobPost.setJobSkills(rs.getString("job_skills"));
				jobPost.setJobOwnerEmailId(rs.getString("job_owner_email_id"));
				jobPost.setCreateDate(rs.getString("create_date"));
				jobPost.setUpdateDate(rs.getString("update_date"));
				jobPost.setPostDay(rs.getString("POST_DAY"));
				jobPost.setPostMonthYear(rs.getString("POST_MONTH_YEAR"));
			 
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
						<div class="date"><%=jobPost.getPostDay()  %><span><%=jobPost.getPostMonthYear() %></span></div>
						<div class="date_desc"><h6 class="title"><a href="jobs_single.html"><%=jobPost.getJobTitle() %></a></h6>
						<span class="meta"><%=jobPost.getJobLocation()%></span>
						  
						</div>
						<div class="clearfix"> </div>
                        
						<p class="description">
						Job Description : <%=jobPost.getJobDescription() %> <br>
						Company : <%=jobPost.getJobCompany() %><br>
						Experience require : <%=jobPost.getJobExp()  %> <br>
						Skills : <%=jobPost.getJobSkills() %> <br>
												  
							
                    </div>
					<div class="clearfix"> </div>
					
				</div>
			 </div>
			  <%}
			}
		    else{
				 %>
				<div class="row">
            		<div class="form-actions floatRight">
            			<br><br>
               		 	<a href="login.jsp">Please login to view this</a>
            		</div>
        		</div>
				
								 
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
						<div class="date"><%=jobPost.getPostDay()  %><span><%=jobPost.getPostMonthYear() %></span></div>
						<div class="date_desc"><h6 class="title"><a href="jobs_single.html"><%=jobPost.getJobTitle() %></a></h6>
						<span class="meta"><%=jobPost.getJobLocation()%></span>
						  
						</div>
						<div class="clearfix"> </div>
                        
						<p class="description">
						Job Description : <%=jobPost.getJobDescription() %> <br>
						Company : <%=jobPost.getJobCompany() %><br>
						Experience require : <%=jobPost.getJobExp() %> <br>
						Skills : <%=jobPost.getJobSkills() %> <br>
						
                    </div>
					<div class="clearfix"> </div>
					<input type="hidden" name="jobId" value="<%=jobPost.getJobId() %>" >	
					<input type="hidden" name="jobOwnerEmailId" value="<%=jobPost.getJobOwnerEmailId() %>" >	
					
					 <input type="submit" value="I Got My Buddy for this Job. Deactivate this Job" class="btn btn-primary btn-sm"> 	
					</form>
				</div>
			 </div>
			  <%}
		    }
		    else{
				 %>
				 <div class="form-actions floatRight">
            			<br><br>
               		 	<a href="login.jsp">Please login to view this</a>
            		</div>
							 
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