<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>学生预约（友谊--长安）界面</title>
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/lanren.css" rel="stylesheet">
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
							 <a href="StudentY-C.jsp">预约</a>
						</li>
						<li>
							 <a href="TeacherCancel.jsp">已预约</a>
						</li>
						<li>
							 <a href="#">用户反馈</a>
						</li>
					</ul>
				</div>
				<div class="col-md-3 column">
				<P>欢迎&nbsp&nbsp<a>LYF</a>&nbsp&nbsp&nbsp&nbsp<a>退出登陆<a></P>
				
				</div>
				<div class="col-md-4 column">
					<iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tu&skin=pitaya" frameborder="0" width="300" height="25" allowtransparency="true"></iframe>
				<body onload="startTime()">
	
				<div id="txt"></div>
	
				</body>
				</div>
			</div>
			
			
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="row clearfix">
								<div class="col-md-4 column">
									<div class="btn-group">
									<a href="Student.jsp" class="buttonYJ">长安--友谊</a>
									<a href="StudentY-C.jsp" class="buttonYJ">友谊--长安</a>
									</div>
								</div>
								<div class="col-md-4 column">
								<br>								
								<a>当前路线：友谊校区--长安校区</a>
								</div>
								<div class="col-md-4 column">
								<!-- 这是一个查询块 -->
										<form class="navbar-form navbar-left" role="search">
											<div class="form-group">
												<input class="form-control" type="text" />
											</div> <button type="submit" class="btn btn-default" value="输入？?或？？查询">查询</button>
										</form>
								</div>
							</div>
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
				</ul>
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
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												<c:forEach items="" var="npubus" varStatus="nb">
													<tbody>
													<tr class="success">
														<td>
														data
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
													<td>
													<p>今日无法预约</p>			
			  										</td>
									</tr>
								</tbody>
										</c:forEach>
									</table>
									</div>
								</div>
							</div>
						</div>
								
					<div class="tab-pane" id="panel-2">
							<!-- 这是一个列表 -->
								<div class="container">
									<div class="row clearfix">
										<div class="col-md-12 column">
											<table class="table table-hover table-striped">
												<thead>
													<tr>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												<c:forEach items="" var="npubus" varStatus="nb">
													<tbody>
													<tr class="success">
														<td>
														data
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
														<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal">预约</button><!-- 模态框（Modal） -->
   								
   						<script>
  			 			$(function () { $('#myModal').modal2('hide')})});</script>					
  							</td>
						</tr>
									</tbody>
									</c:forEach>
								</table>
									</div>
								</div>
							</div>				
						</div>
						
					<div class="tab-pane" id="panel-3">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
												<tr>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												<c:forEach items="" var="npubus" varStatus="nb">
													<tbody>
													<tr class="success">
														<td>
														data
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
													<td>
													<p>今日无法预约</p>			
			  										</td>
									</tr>
								</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
				
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×            </button>
            										<h4 class="modal-title" id="myModalLabel">操作确认 </h4>
        			 						</div>
         									<div class="modal-body"> 请确认您要预约的校车信息：<br>发车时间：<br>已预约人数：        </div>
         									<div class="modal-footer">
            									<button type="button" class="btn btn-default" data-dismiss="modal" >关闭 </button>
            									<button type="button" class="btn btn-primary" > 确认</button>
        				 					</div>
     									</div><!-- /.modal-content -->
   									</div>
   						
					<!-- 这是一个提示信息 -->
				<div class="alert alert-success alert-dismissable">
				 	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				 		<strong>提示!<br></strong> 预约需要排队，请您耐心等待，感谢配合。<br>有问题请在用户反馈界面与我们交流，我们将会及时回复，谢谢合作。<br> <a href="StudentY-C.jsp" class="alert-link">返回</a>
				</div>
				<!-- /.modal-dialog --></div><!-- /.modal -->
</div>
</div>
</div>
</div>
</body>
</html>