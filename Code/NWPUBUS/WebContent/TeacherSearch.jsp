<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>教师查询界面</title>
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
.button1 {font-size: 8px;}
.button2 {font-size: 12px;}
.button3 {font-size: 16px;}
.button4 {font-size: 20px;}
.button5 {font-size: 24px;}
</style>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-5 column">
					<ul class="breadcrumb">
						<li>
							 <a href="#">预约</a>
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
		</div>
		
		<div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="row clearfix">
								<div class="col-md-4 column">
									<div class="btn-group">
									<a href="Teacher.jsp" class="buttonYJ" type="font-size: 12px;">长安--友谊</a>
									<a href="teacherY-C.jsp" class="buttonYJ">友谊--长安</a>
									</div>
								</div>
								<div class="col-md-4 column">
								<br>								
								<a>查询结果如下</a>
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
			  			 			$(function () { $('#myModal').modal2('hide')}));</script>					
			  							</td>
									</tr>
								</tbody>
										</c:forEach>
											</table>
									</div>
								</div>
							</div>
							<!-- 模态框 -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×            </button>
            										<h4 class="modal-title" id="myModalLabel">操作确认 </h4>
        			 						</div>
         									<div class="modal-body"> 请确认您要预约的校车信息：<br>发车时间：<br> 发车数量：<br>已预约人数：        </div>
         									<div class="modal-footer">
            									<button type="button" class="btn btn-default" data-dismiss="modal" >关闭 </button>
            									<button type="button" class="btn btn-primary" > 确认</button>
        				 					</div>
     									</div><!-- /.modal-content -->
   									</div>
   						
   						
			<!-- 这是一个提示信息 -->
				<div class="alert alert-success alert-dismissable">
				 	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				 		<strong>提示!<br></strong> 如果取消预约可能会导致无法坐到此次校车，需重新预约排队。 <a href="TeacherSearch.jsp" class="alert-link">返回</a>
				</div>
				<!-- /.modal-dialog --></div><!-- /.modal -->
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>