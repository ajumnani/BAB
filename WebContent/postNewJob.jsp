<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Post New Job | Bring Any Buddy (BAB) JOB PORTAL</title>
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
        <h2>Post New Job</h2>
        
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
        
        
        
        
        <%if(buddy!=null){ %>
        <form method="post" action="postJobProcess.jsp">
		
		
		<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="firstName">Job Title:</label>
                <div class="col-md-9">
                    <input type="text" placeholder="Enter your job title ..." path="Username" id="Username" class="form-control input-sm" name="jobTitle" required/>
                </div>
            </div>
         </div>
          <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="firstName">Job Description :</label>
                <div class="col-md-9">
                    <input type="textarea rows="4" placeholder="Enter your job description ..." cols="50" path="Username" id="Username" class="form-control input-sm"  name="jobDescription" required/>
                </div>
            </div>
         </div>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName">Company :</label>
                <div class="col-md-9">
                    <input type="text" placeholder="Enter company name ..." path="Password" id="Password" class="form-control input-sm"  name="jobCompany" required/>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName">Job Location :</label>
                <div class="col-md-9">
                    <input type="text" placeholder="Enter job location ..." path=password id="Password" class="form-control input-sm"  name="jobLocation" required/>
                </div>
            </div>
        </div>
        
		<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName">Experience require :</label>
                <div class="col-md-9">
                    <input type="text" placeholder="Enter experience required for this job ..." path="Password" id="Password" class="form-control input-sm"  name="jobExp" required/>
                </div>
            </div>
        </div>
		<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName">Skills :</label>
                <div class="col-md-9">
                    <input type="text" placeholder="Enter skills required for this job ..." path="ConfirmPassword" id="ConfirmPassword" class="form-control input-sm" name="jobSkills" required/>
                </div>
            </div>
        </div>
        
           
        
        <div class="row">
            <div class="form-actions floatRight">
                <input type="submit" value="Post this Job" class="btn btn-primary btn-sm">
            </div>
        </div>
    	</form>    
        <%}else{
        	%>
        <div class="row">
            <div class="form-actions floatRight">
                <a href="login.jsp">Please login to post a job</a>
            </div>
        </div>
        
        <%} %>
    
    
    
    
    
    
    
    </div>
 </div>
</div>

<%@ include file="footer.jsp" %>



</body>
</html>	