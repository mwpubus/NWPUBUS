<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import="utils.*"%>
 <%@page import="java.sql.ResultSet"%>
 <%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.Statement"%>
 <%@page import="java.sql.PreparedStatement"%>
 <%@page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>教师取消预约界面</title>
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
      
<!-- 显示当前时间 -->
<script>
function startTime(){
	var today=new Date();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();// 在小于10的数字钱前加一个‘0’
	m=checkTime(m);
	s=checkTime(s);
	document.getElementById('txt').innerHTML=h+":"+m+":"+s;
	t=setTimeout(function(){startTime()},500);
}
function checkTime(i){
	if (i<10){
		i="0" + i;
	}
	return i;
}
</script>
<style>
p{
	font-family: georgia, serif;
	color: #140B0B;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	letter-spacing: 0pt;
	word-spacing: 0pt;
}

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
				DBHelper db20 =DBHelper.getInstance();
				Connection c20 = db20.getConnection();
				String sql20 = "select title,content,time from notice ";
				
				PreparedStatement ps20 = c20.prepareStatement(sql20,Statement.RETURN_GENERATED_KEYS);
		
				ResultSet  rs20 = ps20.executeQuery();
				if(rs20.next())
				%>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-5 column">
					<ul class="breadcrumb">
						<li>
							 <a href="Teacher.jsp">预约</a>
						</li>
						<li>
							 <a href="TeacherCancel.jsp">已预约</a>
						</li>
						<li>
							 <a href="UserFeedback.jsp">用户反馈</a>
						</li>
					</ul>
					
					
				</div>
				<div class="col-md-3 column">
				<P>欢迎&nbsp&nbsp<a><%=request.getSession().getAttribute("id")%></a>&nbsp&nbsp&nbsp&nbsp<a href="Login.jsp">退出登陆<a></P>
				
				</div>
				<div class="col-md-4 column">
				<iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tu&skin=pitaya" frameborder="0" width="300" height="25" allowtransparency="true"></iframe>
				<body onload="startTime()">
				<div id="txt"></div>
				</body>
				</div>
				
			</div>
		</div>
				
				<!-- 这是一个文字滚动公告，通知一些维护信息以及车辆信息  -->
						<br>
				<p class="marquee">

				<a href="Announcement.jsp"><%=rs20.getString(2) %></a>,.
				 </p>
				<br>
		<% 
				DBHelper db =DBHelper.getInstance();
				Connection c = db.getConnection();
				String sql = "select license,day,otime,start,status from morder where u_id = ?";
				PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				String uid = (String)request.getSession().getAttribute("id");
				ps.setString(1, uid);
				
				ResultSet rs = ps.executeQuery();
				
				%>
		<!-- 这是一个列表 -->
		<div class="container" >
			<div class="row clearfix">
				<div class="col-md-12 column">
					<table class="table table-hover table-striped" id="panel-6">
						<thead>
								<tr>
								
								
								                        <th>
														校车序号
														</th>
														<th>
														发车日期
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车地点
														</th>
														<th>
														状态
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												
													<tbody id = "orderlist">
														<tr class="success">
													    <td>
														id
														</td>
														<td>
														date
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														Status
														</td>
														<td>
														Operate
														</td>
	
	
						</tr>
						<%String status = "";
							
         					 while (rs.next()) {
         					
       													 %>
        											 <tr >
          												 <td><%=rs.getString(1)%></td>
          												 <td><%=rs.getString(2)%></td>
            											 <td><%=rs.getString(3)%></td>
            											 <td><%=rs.getString(4)%></td>
            											 <td><%=rs.getString(5)%></td>
            											 
            											 <td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal">取消预约</button><!-- 模态框（Modal） -->   								
   						<script>
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
  							</td>
  							 </tr>
         													<%
           														  }
         													%>
													</tbody>

						
				
					
				</table>
					<!-- 模态框 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  									 <div class="modal-dialog">
		      									<div class="modal-content">
		         									<div class="modal-header">
		            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×            </button>
		            										<h4 class="modal-title" id="myModalLabel">操作确认 </h4>
		        			 						</div>
		         									
		         									<div >
										<form class="form-horizontal" method="POST"
											action="CancelServlet">
											<div class="modal-body">
												<p>
													发车日期：<input type="" id="lday" name="lday" placeholder=""
														class="text1" readonly="true"></input>
												</p>

												<p>
													校车序号：<input type="" class="text1" id="license"
														name="license" placeholder="" class="text1"
														readonly="true"></input>
												</p>
												<p>
													发车时间：<input type="" class="text1" id="ltime" name="ltime"
														placeholder="" class="text1" readonly="true"></input>
												</p>
											
												<p>
													出发地点：<input type="text"
														id="lplace" name="lplace" class="text1" readonly="true"
														value="长安校区--友谊校区"></input>
												</p>




											</div>

											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">
													关闭
													</button>
													<button type="submit" class="btn btn-primary" onclick="">
														确认
														</button>
											</div>
										</form>
									</div>
		     									</div><!-- /.modal-content -->
		   									</div>
		   						
			
			
			<!-- 这是一个提示信息 -->
				<div class="alert alert-success alert-dismissable">
				 	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				 		<strong>提示!<br></strong> 如果取消预约可能会导致无法坐到此次校车，需重新预约排队。 <a href="TeacherCancel.jsp" class="alert-link">返回</a>
				</div>
				<!-- /.modal-dialog --></div><!-- /.modal -->
			</div>
		</div>
	</div>
</div>
</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nouislider.js"></script>
	<script src="toastr/toastr.js"></script>
	<script type="text/javascript">
	

		$(function() {
			var license,ltime,lday,lplace;
			$("#orderlist").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
						           .text();
						ltime = $(this).parent().parent().find("td").eq(2)
							    .text();
						lday = $(this).parent().parent().find("td").eq(
								1).text();
						lplace = $(this).parent().parent().find("td").eq(
								3).text();
						console.log(license);
						console.log(ltime);
						console.log(lday);
						console.log(lplace);
						
					});

			$("#myModal").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lday").val(lday);
				$(this).find("#lplace").val(lplace);
			})
			
		})

	</script>
</body>
</html>