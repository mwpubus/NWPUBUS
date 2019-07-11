<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Date"%>
<%@ page import="utils.*"%>
<%@ page import="entity.*"%>
<%@ page import="dao.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>司机界面</title>
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
.buttonYJ {
	border-radius: 25px;
    background-color: blue;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px 2px;
    cursor: pointer;
}

.text1
{
	border-background: white;
	border: none;
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
        
p{
	font-family: georgia, serif;
	color: #140B0B;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	letter-spacing: 0pt;
	word-spacing: 0pt;
}
</style>
</head>
<body>
<!-- 这是一个导航栏 -->

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-5 column">
					<ul class="breadcrumb">
					<li>
							 <a href="Driver.jsp">调度信息</a>
						</li>
					
						<li>
							 <a href="UserFeedback2.jsp">用户反馈</a>
						</li>
					</ul>					
				</div>
				<div class="col-md-3 column">
				<P>欢迎&nbsp&nbsp<a><%=request.getSession().getAttribute("id")%></a>&nbsp&nbsp&nbsp&nbsp<a href="Login.jsp">退出登陆<a></P>
				</div>
				<div class="col-md-4 column">
					<iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tu&skin=pitaya" frameborder="0" width="300" height="25" allowtransparency="true"></iframe>			
				<a>
	
				<div id="txt" ><script>window.onload = startTime();</script></div>
	
				</a>
				</div>
			</div>
		</div>
		
			<!-- 这是一个日期选项卡 -->
			<div class="tabbable" id="tabs-207109">
				<ul class="nav nav-tabs">
					<li>
						 <a href="#panel-1" data-toggle="tab" >
						  <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + date.getDate() + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt(date.getDay()));
			                   </script>
			             </span>
			             </a>
					</li>
					<li>
						 <a href="#panel-2" data-toggle="tab">
						  <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 1) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+1)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-3" data-toggle="tab">
						  <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 2) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+2)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-4" data-toggle="tab">
						 <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 3) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+3)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-5" data-toggle="tab">
						  <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 4) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+4)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-6" data-toggle="tab">
						  <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 5) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+5)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-7" data-toggle="tab">
						  <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 6) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+6)));
			                   </script>
			             </span>
						 </a>
					</li>
				</ul>
							<% 
				DBHelper db =DBHelper.getInstance();
				Connection c = db.getConnection();
				Date date = new Date();
				String name = ((User)request.getSession().getAttribute("user")).getName();
				String uid = (String)request.getSession().getAttribute("id");
				
				String sql = "select license,time,start,delay from tbus where (day=?) and (u_id=?)";
				
				
			
				
			
				
				String xingqi ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay());
				PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, xingqi);
				ps.setString(2,uid);
				ResultSet rs = ps.executeQuery();
			
				%>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
							<!-- 这是一个列表 -->
								<div class="container">
									<div class="row clearfix">
										<div class="col-md-12 column">
											<table class="table table-hover table-striped">
												<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车起点
														</th>
														<th>
														当前状态
														</th>
														<th>
														请假
														</th>
													</tr>
												</thead>
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														state
														</td>
														<td>
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal" disabled="disabled" data-target="#myModa2">leave</button><!-- 模态框（Modal） -->
							  							</td>
													</tr>
													<%
							
         					 while (rs.next()) {

       													 %>
        											 <tr>
          												 <td><%=rs.getString(1)%></td>
          												 <td><%=rs.getString(2)%></td>
            											 <td><%=rs.getString(3)%></td>
            											 
            											 <td><%=rs.getString(4)%></td>
            										
            											  </tr>
         													<%
           														  }
         													%>
									</tbody>
								</table>
									</div>
								</div>
							</div>				
					
						</div>
													<% 
			
													String sql2 = "select license,time,start,delay from tobus where (day=?) and (u_id=?)";
				
				String xingqi2 ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay()+1);
				PreparedStatement ps2 = c.prepareStatement(sql2,Statement.RETURN_GENERATED_KEYS);
				ps2.setString(1, xingqi2);
				ps2.setString(2,uid);
				ResultSet rs2 = ps2.executeQuery();
				%>	
				<%String s3 = " 星期" + "日一二三四五六日一二三四五六".charAt((new Date()).getDay()+1) +
						((new Date()).getMonth() + 1) + "月" + ((new Date()).getDate()+1) + "日" ;%>	
					<div class="tab-pane" id="panel-2">
							<!-- 这是一个列表 -->
								<div class="container">
									<div class="row clearfix">
										<div class="col-md-12 column">
											<table class="table table-hover table-striped">
												<thead>
													<tr>
													<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车起点
														</th>
														<th>
														当前状态
														</th>
														<th>
														请假
														</th>
													</tr>
												</thead>
													<tbody>
													<tr class="success">
													<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														state
														</td>
														<td>
														<button type="button" class="btn btn-default btn-xs" 
														data-toggle="modal"  data-target="#myModa2"
														>leave</button><!-- 模态框（Modal） -->
							  							</td>
														<td>
						<!-- 这是一个模态框 ，用来确认操作 -->							
						
   						<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认 </h4>
        			 						</div>
        			 							<form class="form-horizontal" method="POST"
											action="AskLeaveServlet">
         									<div class="modal-body"> 
         									
         									<p>请假时间：<input type="" class="text1" id="ltime" name="ltime" value=<%=s3 %>
														placeholder="" class="text1" readonly="true"></input>
														</p>       		
         									 <p>请假原因：<input type="" class="text1" id="reason" name="reason" 
														placeholder="" class="text1" ></input>
														</p>  		      
         									 </div>
         									<div class="modal-footer">
            									<button type="button" class="btn btn-default" data-dismiss="modal" >关闭 </button>
            									<button type="submit" class="btn btn-primary"  > 确认</button>
        				 					</div>
        				 					</form>
     									</div><!-- /.modal-content -->
   									</div>
   									</div>
   						<script>   						
  			 			$(function () { $('#myModal2').modal2('hide')});</script>					
  							</td>
						</tr>
															<% while (rs2.next()) { %>
        											 <tr>
          												 <td><%=rs2.getString(1)%></td>
          												 <td><%=rs2.getString(2)%></td>
            											 <td><%=rs2.getString(3)%></td>
            											 <td><%=rs2.getString(4)%></td>
            											 </tr>
											              <%}%>
				</tbody>
								</table>
									</div>
								</div>
							</div>				
						</div>
					
<% 
String sql3 = "select license,time,start,delay from dwork where (day=?) and (u_id=?)";
			
				
				String xingqi3 ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay()+2);
				PreparedStatement ps3 = c.prepareStatement(sql3,Statement.RETURN_GENERATED_KEYS);
				ps3.setString(1, xingqi3);
				ps3.setString(2,uid);
				ResultSet rs3 = ps3.executeQuery();
				%>	
				
						
					<div class="tab-pane" id="panel-3">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车起点
														</th>
														<th>
														当前状态
														</th>
														<th>
														请假
														</th>
													</tr>
												</thead>
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														state
														</td>
														<td>
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal" disabled="disabled" data-target="#myModa2">leave</button><!-- 模态框（Modal） -->
							  							</td>
													</tr>
														<% while (rs3.next()) { %>
        											 <tr>
          												 <td><%=rs3.getString(1)%></td>
          												 <td><%=rs3.getString(2)%></td>
            											 <td><%=rs3.getString(3)%></td>
            											 <td><%=rs3.getString(4)%></td>
            											 </tr>
											              <%}%>
												</tbody>
											</table>
									</div>
								</div>
							</div>
					</div>
					
					<% 
			
			
				
				String xingqi4 ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay()+3);
				PreparedStatement ps4 = c.prepareStatement(sql3,Statement.RETURN_GENERATED_KEYS);
				ps4.setString(1, xingqi4);
				ps4.setString(2,uid);
				ResultSet rs4 = ps4.executeQuery();
				%>	
					
					<div class="tab-pane" id="panel-4">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车起点
														</th>
														<th>
														当前状态
														</th>
														<th>
														请假
														</th>
													</tr>
												</thead>
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														state
														</td>
														<td>
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal" disabled="disabled" data-target="#myModa2">leave</button><!-- 模态框（Modal） -->
							  							</td>
													</tr>
														<% while (rs4.next()) { %>
        											 <tr>
          												 <td><%=rs4.getString(1)%></td>
          												 <td><%=rs4.getString(2)%></td>
            											 <td><%=rs4.getString(3)%></td>
            											 <td><%=rs4.getString(4)%></td>
            											 </tr>
											              <%}%>
												</tbody>
											</table>
									</div>
								</div>
							</div>
					</div>
					
					<div class="tab-pane" id="panel-5">
						
						
					<% 
			
			
				
				String xingqi5 ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay()+4);
				PreparedStatement ps5 = c.prepareStatement(sql3,Statement.RETURN_GENERATED_KEYS);
				ps5.setString(1, xingqi5);
				ps5.setString(2,uid);
				ResultSet rs5 = ps5.executeQuery();
				%>	
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车起点
														</th>
														<th>
														当前状态
														</th>
														<th>
														请假
														</th>
													</tr>
												</thead>
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														state
														</td>
														<td>
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal" disabled="disabled" data-target="#myModa2">leave</button><!-- 模态框（Modal） -->
							  							</td>
													</tr>
																<% while (rs5.next()) { %>
        											 <tr>
          												 <td><%=rs5.getString(1)%></td>
          												 <td><%=rs5.getString(2)%></td>
            											 <td><%=rs5.getString(3)%></td>
            											 <td><%=rs5.getString(4)%></td>
            											 </tr>
											              <%}%>
												</tbody>
											</table>
									</div>
								</div>
							</div>
					</div>
					
					<div class="tab-pane" id="panel-6">
						
					<% 
			
			
				
				String xingqi6 ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay()+5);
				PreparedStatement ps6 = c.prepareStatement(sql3,Statement.RETURN_GENERATED_KEYS);
				ps6.setString(1, xingqi6);
				ps6.setString(2,uid);
				ResultSet rs6 = ps6.executeQuery();
				%>	
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车起点
														</th>
														<th>
														当前状态
														</th>
														<th>
														请假
														</th>
													</tr>
												</thead>
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														state
														</td>
														<td>
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal" disabled="disabled" data-target="#myModa2">leave</button><!-- 模态框（Modal） -->
							  							</td>
													</tr>
																<% while (rs6.next()) { %>
        											 <tr>
          												 <td><%=rs6.getString(1)%></td>
          												 <td><%=rs6.getString(2)%></td>
            											 <td><%=rs6.getString(3)%></td>
            											 <td><%=rs6.getString(4)%></td>
            											 </tr>
											              <%}%>
												</tbody>
											</table>
									</div>
								</div>
							</div>
					</div>
					
					<div class="tab-pane" id="panel-7">
						
						
					<% 
			
			
				
				String xingqi7 ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay()+6);
				PreparedStatement ps7 = c.prepareStatement(sql3,Statement.RETURN_GENERATED_KEYS);
				ps7.setString(1, xingqi7);
				ps7.setString(2,uid);
				ResultSet rs7 = ps7.executeQuery();
				%>	
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														发车起点
														</th>
														<th>
														当前状态
														</th>
														<th>
														请假
														</th>
													</tr>
												</thead>
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														start
														</td>
														<td>
														state
														</td>
														<td>
														<button type="button" class="btn btn-default btn-xs" data-toggle="modal" disabled="disabled" data-target="#myModa2">leave</button><!-- 模态框（Modal） -->
							  							</td>
												</tr>
															<% while (rs7.next()) { %>
        											 <tr>
          												 <td><%=rs7.getString(1)%></td>
          												 <td><%=rs7.getString(2)%></td>
            											 <td><%=rs7.getString(3)%></td>
            											 <td><%=rs7.getString(4)%></td>
            											 </tr>
											              <%}%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
					</div>
					
				</div>
				</div>
				</div>
				</div>						
</body>
</html>