<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><center>SIGN UP</center></h3>
<form method="POST"><center>
<input type="text" name="fname" placeholder="Enter first name"></input><br>
<input type="text" name="lname" placeholder="Enter last name"></input><br>
<input type="text" name="email" placeholder="Enter email"></input><br>
<input type="text" name="password" placeholder="Enter password"></input><br>
<button name="submit">SIGNUP</button>

</center></form>
<% 
if(request.getParameter("submit") != null){
	

    String fname= request.getParameter("fname");
	String lname= request.getParameter("lname");
	String email= request.getParameter("email");
	String password= request.getParameter("password");
	String url="jdbc:mysql://localhost:3306/emp_22rp10247";
	String user="root";
	String pass="";
	
	
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn =DriverManager.getConnection(url,user,pass);
		String sql = "INSERT INTO users (fname,lname,email,password) VALUES (?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, fname);
        pstmt.setString(2, lname); 
        pstmt.setString(3, email);
        pstmt.setString(4, password);
        pstmt.executeUpdate();
        
        	out.println("regstration successfully");
        	response.sendRedirect("login.jsp");
	}
	catch(Exception e){
		out.println("regstration failes");
	}
	finally{
		try{
			if(psmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		}
		catch(Exception e){
			out.println("error");
		}
	}
	
%>


</body>
</html>