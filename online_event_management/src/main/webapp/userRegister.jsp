<%@page import="com.event.util.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.event.model.User"%>
<%@page import="com.event.service.user.UserServiceImpl"%>
<%@page import="com.event.service.user.IUserService"%>
<%@page import="java.util.ArrayList"%>
   
<%
	String userID = (String) session.getAttribute("userId");
 	String userName = (String) session.getAttribute("userName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Register</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	
<script src="js/userFormValidation.js"></script>

</head>
<body>
<h1>Register</h1>


<%
	
		UserServiceImpl userserviceimpl = new UserServiceImpl();
		ArrayList<String> userIds = userserviceimpl.getUserIds();
		
		String userId = CommonUtil.generateUserIDs(userIds);

%>






<%-- <% 
		String status = (String) session.getAttribute("status"); 
	
		if(status != null && status.equals("success")){
			
			request.getSession().removeAttribute("status");
		} else {
			response.sendRedirect("userLogin.jsp");
		}
	
%>

<input type="hidden" id="status" value="<%=status%>"> --%>

<%-- <form class="admin-add-form" action="<%= request.getContextPath() %>/UserRegisterServlet" method = "post">
	<label class="admin-form-lable" for="admin-user-name">Username</label>
	<input class="admin-form-input" type="text" name="username" placeholder="Enter username" required="required">
	
	<br>
	
	<label class="admin-form-lable" for="admin-user-fname">First name</label>
	<input class="admin-form-input" type="text" name="firstname" placeholder="Enter First name" required="required">
	
	<br>
	
	<label class="admin-form-lable" for="admin-user-lname">Last name</label>
	<input class="admin-form-input" type="text" name="lastname" placeholder="Enter Last name" required="required">
	
	<br><br>
	
	<label class="admin-form-lable" for="admin-user-gender" name="gender">Gender</label>
	<input type="radio" id="gebder1" name="gender" value="Male" required="required">
	<label for="gender1">Male</label>
	<input type="radio" id="gender2" name="gender" value="Female" required="required">
	<label for="age1">Female</label>
	
	<br><br>
	
	<label class="admin-form-lable" for="admin-user-address">Address</label>
	<textarea class="admin-user-address-area" rows="4" cols="20" name="address" placeholder="Enter Address" required="required"></textarea>
	
	<br>
	
	<label class="admin-form-lable" for="admin-user-mobile">Phone number</label>
	<input class="admin-form-input" type="text" name="mobileno" placeholder="Enter Mobile Number" required="required">
	
	<br>
	
	<label class="admin-form-lable" for="admin-user-email">Email</label>
	<input class="admin-form-input" type="email" name="email" placeholder="Enter Email" required="required">
	
	<br>
	
	<label class="admin-form-lable" for="admin-user-password">Password</label>
	<input class="admin-form-input" type="password" id="password" name="password" placeholder="Enter Password" required="required">
	
	<br>
	
	<input class="admin-form-submit-button" type="submit" name="submit" value="Register">


</form> --%>

<div class="container">
    <form action="<%= request.getContextPath() %>/UserRegisterServlet" method="post" oninput="enableSubmit()">
    	<div class="form-group">
            <label for="username">UserID</label>
            <input type="text" id="username" name="username" value="<%= userId %>" disabled="disabled">
        </div>
        
        <div class="form-group">
            <label for="username">User name</label>
            <input type="text" id="userName" name="username" placeholder="Enter username" required oninput="validateUserNames()">
            <span class="phoneError" id="usernameError" ></span>
        </div>

        <div class="form-group">
            <label for="firstname">First name</label>
            <input type="text" id="firstname" name="firstname" placeholder="Enter First name" required oninput="validateFirstNames()">
            <span class="phoneError" id="firstnameError" ></span>
        </div>

        <div class="form-group">
            <label for="lastname">Last name</label>
            <input type="text" id="lastname" name="lastname" placeholder="Enter Last name" required oninput="validateLastNames()">
            <span class="phoneError" id="lastnameError" ></span>
        </div>

        <div class="form-group">
            <label>Gender</label><br>
            <input type="radio" id="male" name="gender" value="Male" required>
            <label for="male">Male</label>
            <input type="radio" id="female" name="gender" value="Female" required>
            <label for="female">Female</label>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" placeholder="Enter Address" required oninput="validateAddress()">
            <span class="phoneError" id="addressError" ></span>
        </div>

        <div class="form-group">
            <label for="mobileno">Mobile number</label>
            <input type="text" id="mobileno" name="mobileno" placeholder="Enter Mobile Number" required oninput="validatePhone()">
            <span class="phoneError" id="phoneError" ></span>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter Email" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required oninput="validatePasswords()">
        </div>
        
        <div class="form-group">
          <label for="password">Confirm Password</label>
          <input type="password" class="form-control" id="rePassword" name="password" placeholder="Confirm Password" required oninput="validatePasswords()">
          <span class="phoneError" id="passwordError"></span>
      </div>

        <button type="submit" id="submit" class="btn btn btn-primary btn-block">Add User Details</button>
    </form>
</div>


</body>
</html>