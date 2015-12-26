<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="com.bab.facebook.FBConnection"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Login | Bring Any Buddy (BAB) JOB PORTAL</title>
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
	   <div class="col-md-4">
	   	  
	   	  
	   	  
	 </div>
	 <div class="col-md-8 single_right">
	 	   <div class="login-form-section">
                <div class="login-content">
                    <form method="post" action="LoginProcess.jsp">
                       
                       
						
                        <div class="section-title">
                            <h3>Log In to your Account</h3>
                        </div>
                        <div class="textbox-wrap">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="fa fa-user"></i></span>
                                <input type="text" required="required" class="form-control" placeholder="Email ID" name="email">
                            </div>
                        </div>
                        <div class="textbox-wrap">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="fa fa-key"></i></span>
                                <input type="password" required="required" class="form-control " placeholder="Password" name="pass">
                            </div>
                        </div>
                         <%
		 					   if(null!=request.getAttribute("errorMessage"))
							    {
		 				%>
		 						  <div" >
		 						  <%=request.getAttribute("errorMessage") %>
		 						  
							      </div>
						<%
							    }
						%>
                    <div class="login-btn">
					   <input type="submit" value="Log in">
					</div>
                     </form>
                     
                     <div class="forgot">
						  <div class="login-para">
				 			<p><a href="#"> Forgot Password? </a></p>
				 		 </div>
					     <div class="clearfix"> </div>
			        </div>
					<%
						FBConnection fbConnection = new FBConnection();
					%>
					<div class="login-bottom">
					 <p>With your social media account</p>
					 <div class="social-icons">
						<div class="button">
							<a class="tw" href="#"> <i class="fa fa-twitter tw2"> </i><span>Twitter</span>
							<div class="clearfix"> </div></a>
							<a class="fa" href="<%=fbConnection.getFBAuthUrl()%>"> <i class="fa fa-facebook tw2"> </i><span>Facebook</span>
							<div class="clearfix"> </div></a>
							<a class="go" href="#"><i class="fa fa-google-plus tw2"> </i><span>Google+</span>
							<div class="clearfix"> </div></a>
							<div class="clearfix"> </div>
						</div>
						<h4>Don't have an Account? <a href="register.jsp"> Register Now!</a></h4>
					 </div>
		           </div>
                </div>
         </div>
   </div>
  <div class="clearfix"> </div>
 </div>
</div>



</body>
</html>	





