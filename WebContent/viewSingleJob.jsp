
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%@page import="com.bab.dto.JobComments"%>
<%@page import="com.bab.dto.JobPost"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.bab.dbconfig.DBConnecction"%>
<%@page import="java.sql.*"%>

<!DOCTYPE HTML>
<html>
<head>
<title>View Single Job | Bring Any Budy (BAB) Job Portal</title>
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



<%@ include file="header.jsp"%>

<div class="container">
      <div class="single">
		
		
		<%
					if (null != request.getAttribute("errorMessage")) {
				%>
				<div class="row">
					<div class="form-actions floatRight">
						<font color="<%=request.getAttribute("errorColor") %>"><%=request.getAttribute("errorMessage")%></a></font>
					</div>
				</div>
				<br>

				<%
					}
				%>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
		
	 <div class="col-md-8 single_right">
	      <div class="jobs_follow jobs-single-item">
					
					<%
					String jobId="";
					String pageFrom=null;
					List<JobPost> allJobs = new ArrayList<JobPost>();
					
					DBConnecction db = new DBConnecction();
					Connection conn = null;
					PreparedStatement stmt = null;
					ResultSet rs = null;
					try { //: Execute a query
						System.out.println("Creating statement...");
						conn = db.getJNDIConnection();
						//All Jobs Starts here
						
							
							String sql="select JOB_ID,JOB_TITLE,JOB_DESCRIPTION,JOB_COMPANY,JOB_LOCATION,JOB_EXP,JOB_SKILLS,JOB_OWNER_EMAIL_ID,CREATE_DATE,UPDATE_DATE,DATE_FORMAT(CREATE_DATE,'DD') POST_DAY,DATE_FORMAT(CREATE_DATE,'Mon') POST_MONTH_YEAR "+ 
									"from BAB_JOB_DETAILS where  "+
									 "job_id=? ";
						
							stmt=conn.prepareStatement(sql);
							
							if(request.getParameter("page")!=null){
								System.out.println("Null check success...");
								
								if("VAJ".equalsIgnoreCase(request.getParameter("page"))){
									
									pageFrom="VAJ";
									if("VAJ".equalsIgnoreCase(request.getParameter("page"))){
									jobId=request.getParameter("job_id");
									session.setAttribute("JOBID", jobId);
									}
									
									
									
									System.out.println("page check success..."+jobId);
									stmt.setString(1, jobId);
								}
								else{
									System.out.println("page check failure...");
									jobId=(String)session.getAttribute("JOBID");
									stmt.setString(1, jobId);
								}
								
							}else if(request.getAttribute("page_from")!=null){
								System.out.println("Null check success...");
								
								if("VAJ".equalsIgnoreCase((String)request.getAttribute("page_from"))){
									
									pageFrom="VAJ";
									if("VAJ".equalsIgnoreCase((String)request.getAttribute("page_from"))){
									jobId=(String)request.getAttribute("job_id_from");
									session.setAttribute("JOBID", jobId);
									}
									
									
									
									System.out.println("page check success..."+jobId);
									stmt.setString(1, jobId);
								}
								else{
									System.out.println("page check failure...");
									jobId=(String)session.getAttribute("JOBID");
									stmt.setString(1, jobId);
								}
								

							}
							
							
							else{
								System.out.println("null check failure...");
								jobId=(String)session.getAttribute("JOBID");
								stmt.setString(1, jobId);
							}
							
							rs=stmt.executeQuery();
							
							while (rs.next()) {
								JobPost jobPost = new JobPost();

								jobPost.setJobId(rs.getString("JOB_ID"));
								jobPost.setJobTitle(rs.getString("JOB_TITLE"));
								jobPost.setJobDescription(rs.getString("JOB_DESCRIPTION"));
								jobPost.setJobCompany(rs.getString("JOB_COMPANY"));
								jobPost.setJobLocation(rs.getString("JOB_LOCATION"));
								jobPost.setJobExp(rs.getString("JOB_EXP"));
								jobPost.setJobSkills(rs.getString("JOB_SKILLS"));
								jobPost.setJobOwnerEmailId(rs.getString("JOB_OWNER_EMAIL_ID"));
								jobPost.setCreateDate(rs.getString("CREATE_DATE"));
								jobPost.setUpdateDate(rs.getString("UPDATE_DATE"));
								jobPost.setPostDay(rs.getString("POST_DAY"));
								jobPost.setPostMonthYear(rs.getString("POST_MONTH_YEAR"));
								

								allJobs.add(jobPost);

							}
						
							rs.close();
					} catch (SQLException se) {
						//Handle errors for JDBC
						se.printStackTrace();
					} catch (Exception e) {
						//Handle errors for Class.forName
						e.printStackTrace();
					} finally {
						//finally block used to close resources
						try {
							if (stmt != null)
								conn.close();
						} catch (SQLException se) {
						}// do nothing
						try {
							if (conn != null)
								conn.close();
						} catch (SQLException se) {
							se.printStackTrace();
						}//end finally try
					}//e
				 %>
					
					
					<%
					for (int i = 0; i < allJobs.size(); i++) {
						JobPost jobPost = new JobPost();
						jobPost = allJobs.get(i);
				%>
				
					<div class="thumb_right">
						<br>
						<div class="date"><%=jobPost.getPostDay() %>
							<span><%=jobPost.getPostMonthYear()  %></span>
						</div>
						<h6 class="title"><%=jobPost.getJobTitle()%></h6>
						<span class="meta"><%=jobPost.getJobLocation()%></span> <br>
						<p>
							Job Description :
							<%=jobPost.getJobDescription()%></p>
						<p>
							Company :
							<%=jobPost.getJobCompany()%>
						</p>
						<p>
							Exprience require :
							<%=jobPost.getJobExp()%>
						</p>
						<p>
							Skills :
							<%=jobPost.getJobSkills()%></p>


						<hr>
						

						<%
							}
						%>
						<br>
						</div>
						
						
						
						
						
						
						
						
						
						
						
						
						<%
						
						
						List<JobComments> commentList = new ArrayList<JobComments>();
						
						 db = new DBConnecction();
						 conn = null;
						 stmt = null;
						 rs = null;
						try { //: Execute a query
							System.out.println("Creating statement... without login "+jobId);
							conn = db.getJNDIConnection();
							//All Jobs Starts here
							
								
								String sql="select * from JOB_COMMENTS where job_id=?";
								System.out.println("JOB_ID inside comments "+jobId);
								stmt=conn.prepareStatement(sql);
								stmt.setString(1, jobId);
								System.out.println("Before execute... without login "+jobId);
																	
								rs=stmt.executeQuery();
								System.out.println("After execute... without login "+jobId);
								while (rs.next()) {
									System.out.println("Result set execute... without login "+jobId);
									JobComments jobComment = new JobComments();
									jobComment.setJobId(rs.getString("job_id"));
									jobComment.setJobPosterEmail(rs.getString("comment_poster_email"));
									jobComment.setJobPosterName(rs.getString("comment_poster_name"));
									jobComment.setJobPosterMessage(rs.getString("comment_msg"));
									
									commentList.add(jobComment);

								}
							
								rs.close();
						} catch (SQLException se) {
							//Handle errors for JDBC
							se.printStackTrace();
						} catch (Exception e) {
							//Handle errors for Class.forName
							e.printStackTrace();
						} finally {
							//finally block used to close resources
							try {
								if (stmt != null)
									conn.close();
							} catch (SQLException se) {
							}// do nothing
							try {
								if (conn != null)
									conn.close();
							} catch (SQLException se) {
								se.printStackTrace();
							}//end finally try
						}//e

						
						
						
						
						
						%>
						
						
						
						
						
						
						
						
						
						
						
						
						

						<h6 class="title">Comments</h6>
						<%for(int j=0;j<commentList.size();j++){
						JobComments jobComments=new JobComments();
						jobComments=commentList.get(j);
						%>
						
						<div class="media media_1">
			  			<div class="media-left"><a href="#"> </a></div>
						  <div class="media-body">
						    <h4 class="media-heading"><a class="author" href="#"><%=jobComments.getJobPosterName() %> ,<%=jobComments.getJobPosterEmail()%></a><div class="clearfix"> </div></h4>
						    <%=jobComments.getJobPosterMessage() %>						  </div>
						  
						</div>
						<% }%>
						
						<%if(buddy!=null){ %>
						<form method="post" action="PostComment.jsp">
						<div class="text">
			               <textarea value="Message" name="CommentMessage" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
			            </div>
			            <input name="page_valid" type="hidden" id="page_valid" value="<%=pageFrom%>">
				        <input name="job_id_valid" type="hidden" id="job_id_valid" value="<%=jobId%>">
				        <input name="commentPost" type="hidden" id="commentPost" value="PostAComment">
				        
			            <div class="form-submit1">
				           <input name="submit" type="submit" id="submit" value="Post Comment"><br>
				        </div>
				        
						<div class="clearfix"></div>
			          </form>
					  <%}else{ %>
				        
				        <a href="login.jsp">Please login to comment on this Job Post</a>
				        <div class="clearfix"></div>
				        <% }%>
				        
			
					</div>


	      			
		  </div>
		  
	   </div>
	   <div class="clearfix"> </div>
	</div> 


</body>
</html>	