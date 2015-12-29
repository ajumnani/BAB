<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Register | Bring Any Buddy (BAB) JOB PORTAL</title>
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
    function Validate() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>


</head>




<body>

<%@ include file="header.jsp" %>

	
	
	<div class="container">
    <div class="single">  
	   <div class="form-container">
	   <h2>Registration Form</h2>
       <form method="post" onsubmit="onclick="return Validate()" action="registerProcess.jsp">
         
       
        				<%
		 					   if(null!=request.getAttribute("errorMessage"))
							    {
		 				%>
		 				<div>
		 					<center><h4><font color="<%=request.getAttribute("errorColor") %>"><%=request.getAttribute("errorMessage") %></font></h4></center>
		 				 </div>	      
						<%
							    }
						%>
	
             
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" > Email Id :</label>
                <div class="col-md-9">
                    <input type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" id="emailId" class="form-control input-sm" name="emailId" required/>
                </div>
            </div>
         </div>
         
          <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable">Password :</label>
                <div class="col-md-9">
                    <input type="password"  id="password" class="form-control input-sm" name="password" required/>
                </div>
            </div>
         </div>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" >Confirm Password :</label>
                <div class="col-md-9">
                    <input type="password" id="confirmPassword" class="form-control input-sm" name="confirmPassword" required/>
                </div>
            </div>
        </div>
		
		
		 <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" >Name :</label>
                <div class="col-md-9">
                    <input type="text" id="name" class="form-control input-sm" name="name" required/>
                </div>
            </div>
        </div>
		
		 <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" >Contact No (Optional) :</label>
                <div class="col-md-9">
                    <input type="text" pattern="[0-9]{10}" id="contactNo" class="form-control input-sm" name="contactNo" />
                </div>
            </div>
        </div>
		
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" >Current Company (Optional) :</label>
                <div class="col-md-9">
                    <input type="text" id="currentCompany" class="form-control input-sm" name="currentCompany" />
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="form-actions floatRight">
               <input type="submit" value="Register" class="btn btn-primary btn-sm">
              
            </div>
        </div>
        				
                    
    </form>
    </div>
 </div>
</div>



</body>
</html>	