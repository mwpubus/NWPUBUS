<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import="utils.*"%>
     <%@page import="java.sql.ResultSet"%>
 <%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.Statement"%>
 <%@page import="java.sql.PreparedStatement"%>
 <%@page import="java.util.Date" %>
  <%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/lanren.css" rel="stylesheet">
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
    <title>公告详细信息</title>
</head>
<style>
.buttonXK{
	border-radius: 8px;
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.buttonXK1 {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}

.buttonXK1:hover {
    background-color: #4CAF50;
    color: white;
}
.buttonXK2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}

.buttonXK2:hover {
    background-color: #008CBA;
    color: white;
}
.textarea
{
	border-background: white;
	border: none;
}
.text1
{
	border-background: white;
	border: none;
}
</style>
<body>
<% 
				DBHelper db =DBHelper.getInstance();
				Connection c = db.getConnection();
				String sql = "select title,content,time from notice ";
				
				PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		
				ResultSet  rs = ps.executeQuery();
				if(rs.next())
				%>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-3 column">
				</div>
				<div class="col-md-6 column">
			<p><h3>
						标题：<input  type="text" id="ltime" readonly="true" value="<%=rs.getString(1) %>" class="text1"></input>
					</h3>
					<h3>时间：<input  type="text" id="ltime" readonly="true" value="<%=rs.getString(3) %>" class="text1"></input></p></h3>
					<textarea  class="textarea lead" rows="8" cols="100" name="uCode"><%=rs.getString(2) %></textarea>
					</p>
					
					<div class="row clearfix">
						<div class="col-md-3 column">
						</div>
						<div class="col-md-3 column">
						</div>
						<div class="col-md-6 column">
						 <a href="javascript:history.back(-1)" class="buttonXK buttonXK2">返回上一页</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 column">
				</div>
			</div>
		</div>
	</div>
</div>					

</body>
</html>