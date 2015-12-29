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
<meta name="keywords"
	content="Seeking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet'
	type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link
	href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<!----font-Awesome----->
<link href="css/font-awesome.css" rel="stylesheet">
<!----font-Awesome----->

<script type="text/javascript">
	$(document).on("click", ".open-ApplyJobDialog", function() {
		var myJobId = $(this).data('id');

		var newJobId = myJobId.substring(0, myJobId.indexOf(",")); //jobId
		var myPosterEmail = myJobId.substring(myJobId.indexOf(",") + 1); //posterEmail

		$(".modal-body #jobId").val(newJobId);
		$(".modal-body #posterEmail").val(myPosterEmail);

	});
</script>

</head>
<body>


	<%@ include file="header.jsp"%>



	<div class="container">
		<div class="single">
			<div class="col-sm-10 follow_left">
				<h2>Latest Available Jobs</h2>


				<%
					if (null != request.getAttribute("errorMessage")) {
				%>
				<div class="row">
					<div class="form-actions floatRight">
						<font color="green">Your New Job Successfully added..</a></font>
					</div>
				</div>
				<br>

				<%
					}
				%>




				<%
					List<JobPost> allJobs = new ArrayList<JobPost>();
					List<JobPost> myAppliedJobs = new ArrayList<JobPost>();
					List<JobPost> myPostedJobs = new ArrayList<JobPost>();

					DBConnecction db = new DBConnecction();
					Connection conn = null;
					PreparedStatement stmt = null;
					ResultSet rs = null;
					try { //: Execute a query
						System.out.println("Creating statement...");
						conn = db.getJNDIConnection();
						//All Jobs Starts here
						String sqlAllJobs = "select * from bab_job_details order by update_Date desc";
						stmt = conn.prepareStatement(sqlAllJobs);
						System.out.println("Creating statement... 2");
						rs = stmt.executeQuery();
						while (rs.next()) {
							JobPost jobPost = new JobPost();

							jobPost.setJobId(rs.getString("JOB_ID"));
							jobPost.setJobTitle(rs.getString("JOB_TITLE"));
							jobPost.setJobDescription(rs.getString("JOB_DESCRIPTION"));
							jobPost.setJobCompany(rs.getString("JOB_COMPANY"));
							jobPost.setJobLocation(rs.getString("JOB_LOCATION"));
							jobPost.setJobExp(rs.getString("JOB_EXP"));
							jobPost.setJobSkills(rs.getString("JOB_SKILLS"));
							jobPost.setJobOwnerEmailId(rs
									.getString("JOB_OWNER_EMAIL_ID"));
							jobPost.setCreateDate(rs.getString("CREATE_DATE"));
							jobPost.setUpdateDate(rs.getString("UPDATE_DATE"));

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
					}//end try
				%>


				<%
					for (int i = 0; i < allJobs.size(); i++) {
						JobPost jobPost = new JobPost();
						jobPost = allJobs.get(i);
				%>
				<div class="jobs_follow jobs-single-item">
					<div class="thumb_right">
						<div class="date"><%=jobPost.getCreateDate()%>
							<span><%=jobPost.getCreateDate()%></span>
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
							Exprience require :<%=jobPost.getJobExp()%>
						</p>
						<p>
							Skills :<%=jobPost.getJobSkills()%></p>


						<hr>
						<a href="#" class="open-ApplyJobDialog btn btn-primary"
							data-toggle="modal"
							data-id="<%=jobPost.getJobId()%>,<%=jobPost.getJobOwnerEmailId()%>"
							data-target="#applyJobDialog">Apply for this Job</a>


						<%
							}
						%>

						</div>

						<!-- Modal If -->
						<div class="modal fade" id="applyJobDialog" tabindex="-1"
							role="dialog" aria-labelledby="applyModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<%
										if (buddy == null) {
									%>
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Apply for this
											job</h4>
									</div>

									<div class="modal-body">
										Before you apply you have to login as a Buddy
										<p>
											<a href="login.jsp">Log in</a>
										</p>
									</div>
									<%
										} else {
									%>


									<!-- If else -->

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Below details
											will be sent to Buddy who has posted this Job.</h4>
									</div>
									<div class="modal-body">
										<form method="Post" action="applyJob.jsp">
											Name : <input type="text" path="name" id="name"
												class="form-control input-sm"
												value="<%=buddy.getBuddyName()%>" disabled name="name" />
											Email ID : <input type="text" path="email" id="email"
												class="form-control input-sm"
												value="<%=buddy.getEmailId()%>" disabled name="email" />

											Contact No : <input type="text" path="contact" id="contact"
												class="form-control input-sm"
												value="<%=buddy.getContactNo()%>" name="contact" />
											<%
												String jobId = request.getParameter("job_id");
											%>
											<input type="hidden" name="jobId" id="jobId" value="" /> <input
												type="hidden" name="posterEmail" id="posterEmail" value="" />

											<br> <input type="submit" value="Apply Job"
												class="btn btn-primary btn-sm">
										</form>
									</div>

									<%
										}
									%>

								</div>
							</div>

						</div>

					</div>
				</div>


			</div>
</body>
</html>
