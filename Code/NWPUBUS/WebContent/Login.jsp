<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="utils.*"%>
     <%@page import="java.sql.ResultSet"%>
 <%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.Statement"%>
 <%@page import="java.sql.PreparedStatement"%>
 <%@page import="java.util.Date" %>
  <%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
   <title>用户页面</title>
   <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
   <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   
<style>

.marquee {
            width: 450px;
            margin: 0 auto;
            overflow: hidden;
            white-space: nowrap;
            box-sizing: border-box;
            animation: marquee 50s linear infinite;
        }
.marquee:hover {
            animation-play-state: paused
        }

        /* Make it move */
        @keyframes marquee {
            0%   { text-indent: 27.5em }
            100% { text-indent: -105em }
        }

        /* Make it pretty */
.microsoft {
            padding-left: 1.5em;
            position: relative;
            font: 16px 'Segoe UI', Tahoma, Helvetica, Sans-Serif;
        }

        /* ::before was :before before ::before was ::before - kthx */
.microsoft:before, .microsoft::before {
            z-index: 2;
            content: '';
            position: absolute;
            top: -1em; left: -1em;
            width: .5em; height: .5em;
            box-shadow: 1.0em 1.25em 0 #F65314,
                        1.6em 1.25em 0 #7CBB00,
                        1.0em 1.85em 0 #00A1F1,
                        1.6em 1.85em 0 #FFBB00;
        }

.microsoft:after, .microsoft::after {
            z-index: 1;
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 2em; height: 2em;
            background-image: linear-gradient(90deg, white 70%, rgba(255,255,255,0));
        } 
        
</style>

</head>
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
				<div class="col-md-10 column">
					<img src="photos/aheadFix.png" class="img-responsive" alt="Cinque Terre" width="1000" height="200"/>
				</div>
				<div class="col-md-2 column">
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-8 column">
					<div class="carousel slide" id="carousel-694237">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0" data-target="#carousel-694237">
							</li>
							<li data-slide-to="1" data-target="#carousel-694237">
							</li>
							<li data-slide-to="2" data-target="#carousel-694237">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="photos/1.jpeg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="photos/2.jpeg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="photos/3.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-694237" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-694237" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
				<div class="col-md-4 column">
				<%
					String userid = "";
						String passwd = "";
						String s;
						
							Cookie[] cookies = request.getCookies();
							if(cookies != null) {
							for (Cookie cookie : cookies) {
								s = cookie.getName(); //通过getName方法获得cookie的名称
								if (s.equals("userid")) {
									if (cookie.getValue() != null) {
										userid = cookie.getValue(); //通过getValue方法获得cookie的值
									}
								} else if (s.equals("password")) {
									if (cookie.getValue() != null) {
										passwd = cookie.getValue();
									}
								}
							}
						}
					
				%>
					<form class="form-horizontal" role="form" action="LoginServlet" method="post">
						<div class="form-group">
							 <label for="inputID" class="col-md-3 control-label">学号/工号</label>
							<div class="col-md-9">
								<input class="form-control" name="inputuID" type="text" value="<%=userid %>"
								onblur="checkUserName(this.value)"
								 />
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-md-3 control-label">密码</label>
							<div class="col-md-9">
								<input class="form-control" name="inputPassword" type="password" value="<%=passwd %>"
								onblur="checkPassword(this.value)"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9">
								<div id="msg" style="color:red;"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9 column">
								<div class="checkbox">
									<div class="col-md-5 column">
										<label><input type="checkbox" name="checkboxname" value="selected" checked="checked"/>记住我</label>
									 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
									<div class="col-md-2 column"></div>
									<div class="col-md-5 column">
										<a href="ChangePasswd2.jsp" >忘记密码？</a>
									</div>
								</div>
							</div>
						
						<div class="form-group">
							<div class="col-md-3 column"></div>
							<div class="col-md-4 column">
							 	<button type="submit" class="btn btn-block btn-primary" onclick="">登录</button>
							</div>
							<div class="col-md-1 column"></div>
							<div class="col-md-4 column">
							 	<button onclick="window.location.href='Register.jsp'" type="button" class="btn btn-block btn-primary">注册 </button>													
							</div>
						</div>
							<!-- 这是一个文字滚动公告，通知一些维护信息以及车辆信息  -->
						<br>
				<p class="marquee">
				
				<a href="Announcement.jsp"><%=rs.getString(2) %></a>,.
				 </p>
				<br>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
		
		<div class="col-md-11 column">
		<br><br><br>
			<p>
				<strong>西北工业大学, Inc.</strong>
				<br>友谊西路<br>
  				<abbr title="Phone">电话:</abbr> (123) 456-7890</address><address>
  				<a href="mailto:#">NorthWesternPolytechnicnicalUniversity@npu.edu.com</a></address>
			</p>
			<p class="text-muted">Copyright © 2018 Northwestern Polytechnical University All Rights Reserved</p>
		</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function checkUserName(obj){
    var username = obj;
	var checkUserNameResult = document.getElementById("msg");  
    if(username.trim().length==0){
          checkUserNameResult.innerHTML = "用户名不能为空";  
          obj.focus();
    }else{
    	 checkUserNameResult.innerHTML = "";  
    }
}
function checkPassword(obj) {
    var password = obj;
    var checkPasswordResult = document.getElementById("msg");
    if (password.trim().length == 0) {
        checkPasswordResult.innerHTML = "密码不能为空";
        obj.focus();
    } else {
        checkPasswordResult.innerHTML = "";
    }
}
</script>
</body>
</html>