<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Forgot Password | Bring Any Buddy (BAB) JOB PORTAL</title>
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
<script type="text/javascript">
</script>


</head>




<body>

<%@ include file="header.jsp" %>

	
	
	<div class="container">
    <div class="single">  
	   <div class="form-container">
	   <h2>Retrieve Your Password </h2>
       <form method="post" onsubmit="return Validate()" action="Reset.jsp">
         
       
        				<%
		 					   if(null!=request.getAttribute("errorMessage"))
							    {
		 				%>
		 				<div>
		 					<center><h4><font color=<%=request.getAttribute("errorColor")%> ><%=request.getAttribute("errorMessage") %></font></h4></center>
		 				 </div>	      
						<%
							    }
						%>
	<br>
             
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" > Email Id :</label>
                <div class="col-md-9">
                    <input type="text"  id="emailId" placeholder="Your Registered Email" class="form-control input-sm" name="emailId" required/>
                </div>
            </div>
         </div>
         
         		 
        <div class="row">
            <div class="form-actions floatRight">
               <input type="submit" value="Retrieve Password" class="btn btn-primary btn-sm">
              
            </div>
        </div>
        				
                    
    </form>
    </div>
 </div>
</div>



</body>
</html>	