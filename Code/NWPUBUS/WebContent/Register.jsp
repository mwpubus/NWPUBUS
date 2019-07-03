<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>注册页面</title>
   <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
   <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-10 column">
					<img src="photos/aheadFix.png" class="img-responsive" alt="Cinque Terre" width="1000" height="200"/>
				</div>
				<div class="col-md-2 column">
					 <button type="button" class="btn btn-default">中文/English</button>
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
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="usertype" class="col-sm-3 control-label">用户类型</label>
							<div class="col-sm-9">
								<div class="btn-group">
						 			<button class="btn btn-default">选择用户类型</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
									<ul class="dropdown-menu">
										<li>
										 	<a href="#">教师/学生</a>
										</li>
										<li>
											 <a href="#">调度员</a>
										</li>
										<li>
											 <a href="#">管理员</a>
										</li>
										<li>
											 <a href="#">司机</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputEmail3" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-9">
								<input class="form-control" id="inputEmail3" type="email" />
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-9">
								<input class="form-control" id="inputPassword3" type="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword4" class="col-sm-3 control-label">确认密码</label>
							<div class="col-sm-9">
								<input class="form-control" id="inputPassword4" type="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword5" class="col-sm-3 control-label"></label>
							<div class="col-sm-9">
								 <button type="submit" class="btn btn-default" >
								 	<a href="Login.jsp">注册</a>
								 </button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
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
</body>
</html>