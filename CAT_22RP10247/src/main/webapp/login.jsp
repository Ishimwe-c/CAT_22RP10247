<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST"><center>
<h4><center>Employee Management System</center></h4>
<input type="email" name="email" placeholder="Email"></input><br>
<input type="text" name="password" placeholder="Password"></input><br>
<buttton name="submit">LOGIN</buttton>
<p>Don't have account?<a href="signup.jsp"></a></p>


</center>
</form>
<% if(request.getParameter("submit") != null){
	String email= request.getParameter("email");
	String password= request.getParameter("password");
	String url="jdbc:mysql://localhost:3306/emp_22rp10247";
	String user="root";
	String pass="";
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn =DriverManager.getConnection(url,user,pass);
		String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, password); 
        rs = pstmt.executeQuery();
        if (rs.next()){
        	HttpSession session=request.getSession();
        	session.setAttribute(userEmail,email);
        	out.println("login successful");
        	out.println(welcome,"+ email +");
        	response.sendRedirect("dashboard.jsp");
        }
        else{
        	out.println("wrong email or password");
        }
        
	
	
	


%>

</body>
</html>