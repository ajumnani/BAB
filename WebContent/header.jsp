<%@page import="com.bab.dto.Buddy"%>
<nav class="navbar navbar-default" role="navigation">
	<div class="container">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt=""/></a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">
	        <ul class="nav navbar-nav">
		        
		       
		    
		        
		        <%
		        	Buddy buddy=new Buddy();
		            buddy=(Buddy)session.getAttribute("buddy");
    				if ((buddy == null)) {
				%>
				
				
				
		        <li><a href="viewAvailableJobs.jsp"> All Jobs </a></li>
				<li><a href="viewMyJobs.jsp">My Applied/Posted Jobs</a></li>
						
		        <li><a href="postNewJob.jsp">Post New Job</a></li>
				
		      	<li><a href="login.jsp">Login</a></li>
				<li><a href="register.jsp">Register</a></li>
				
		        
					
				
				
					<%
    				}else
    				{
    					if(buddy.getEmailId()!=""){
				%>
					
					
				<li><a href="viewAvailableJobs.jsp"> All Jobs </a></li>
		        <li><a href="postNewJob.jsp">Post New Job</a></li>
		        <li><a href="viewMyJobs.jsp">My Applied/Posted Jobs</a></li>
				<li><a href="myNotification.jsp">My Notification</a></li>
		   		<li><a href="myProfile.jsp">My Profile</a></li>
			
		        <!--   <li><%=buddy.getEmailId() %></li>   -->
				
		        <li><a href="logout.jsp">Logout</a></li>
				
				
				<%}else{%>
				
				<li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Jobs<b class="caret"></b></a>
		            <ul class="dropdown-menu">
			            <li><a href="viewAvailableJobs.jsp">View All Available Jobs </a></li>
						<li><a href="viewMyJobs.jsp">View My Applied/Posted Jobs </a></li>
						
						
		            </ul>
		        </li>		
		        <li><a href="postNewJob.jsp">Post New Job</a></li>
				<li><a href="myNotification.jsp">My Notification</a></li>
		      	<li><a href="login.jsp">Login</a></li>
				<li><a href="register.jsp">Register</a></li>
				<li><a href="myProfile.jsp">My Profile</a></li>
		        	
				<% }
    					
    				
    				
    				}
				%>
		       
	        </ul>
	    </div>
	    <div class="clearfix"> </div>
	  </div>
	    <!--/.navbar-collapse-->
	</nav>


