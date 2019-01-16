<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% String basePath = request.getScheme()+"://"+request.getServerName()+":"+
					 request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<head>
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

</head>
<base href="<%=basePath%>">
<body style="width: 100%; margin: 0;">
	<script src="js/cookie.js"></script>
	<script src="common/js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/staff.js"></script>
	<script type="text/javascript">
		//var C=${sessionScope.power};
		var C=2
	</script>
	<div class="container">
		<div class="row clearfix">

			<div class="col-md-12 column">
				<table
					style="margin-left: auto; margin-right: auto; margin-top: 10px;">
					<h3 class="text-center" style="border:5px solid #a1a1a1; padding: 10px 40px; background: #dad7dd; width: 100%; border-radius: 25px;">企业员工信息基本列表</h3>
				</table>

				<div class="form-group container" style="">
					<button id="newButton" type="button"
						class="btn btn-sm btn-primary col-sm-3" data-toggle="modal"
						data-target="#editModal" style="width: 80px; margin-left: 5px;">新建
					</button>
					<div class="col-sm-3" style="float: right">
						<input class="form-control col-sm-4" type="text" id="LikeName"
							placeholder="请输入查询员工的姓名" />
						<!-- <input type="button" value="测试测试" onclick="test()"> -->
					</div>
					<button id="LikeSearch" type="submit" style="float: right"
						class=" btn btn-default col-sm-1" onclick="javascript:;">查询</button>
				</div>

				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
					data-backdrop="static" aria-labelledby="deleteModalLabel"
					aria-hidden="true" style="margin-top: 100px">
					<div class="modal-dialog" style="width: 350px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title model-text1" id="deleteModalLabel">
									<B>删除</B>
								</h4>
							</div>
							<div class="modal-body">
								确定要开除ID为 <span class="selectId"
									style="color: red; font-weight: bold;"></span> 的职工并删除一切记录吗？
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" id="delete-ok">确定</button>
								<button type="button" class="btn btn-info" data-dismiss="modal"
									id="delete-cancel">取消</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body" style="height: 200px;">
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">姓名：</label>
									<div class="col-sm-4">
										<input class="form-control" id="name" type="name" />
									</div>
									<label class="col-sm-2  control-label">性别：</label>
									<div class="col-sm-4">
										<select id="sex" name="sex"
											class="selectpicker show-tick form-control">
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
									</div>
									<label class="col-sm-2 control-label">学历：</label>
									<div class="col-sm-4">
										<select id="degree" name="degree"
											class="selectpicker show-tick form-control">
											<option value="博士">博士</option>
											<option value="研究生">研究生</option>
											<option value="本科">本科</option>
											<option value="专科">专科</option>
										</select>
									</div>
									<label class="col-sm-2  control-label">部门：</label>
									<div class="col-sm-4">
										<select id="department" name="department"
											class="selectpicker show-tick form-control"
											onchange="ajaxfun2()">
											<option value="请选择">请选择</option>
										</select>
									</div>
									<label class="col-sm-2  control-label">职位：</label>
									<div class="col-sm-4">
										<select id="position" name="position"
											class="selectpicker show-tick form-control">
											<option value="请选择">请选择</option>
										</select>
									</div>
									<label class="col-sm-2  control-label">状态：</label>
									<div class="col-sm-4">
										<select id="state" name="state"
											class="selectpicker show-tick form-control">
											<option value="在职">在职</option>
											<option value="离职">离职</option>
										</select>
									</div>
									<label for="username"
										class="col-sm-2  control-label">账号：</label>
									<div class="col-sm-4">
										<input class="form-control" id="username" type="username" />
									</div>
									<label for="password"
										class="col-sm-2 control-label">密码：</label>
									<div class="col-sm-4">
										<input class="form-control" id="password" type="password" />
									</div>
									<!--  <label>
									  <input type="checkbox" id="check" > 是否赋予管理员权限
								  </label> -->
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button id="editStaff" type="button" class="btn btn-primary"
									data-dismiss="modal">提交更改</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th class="text-center">编号</th>
							<th class="text-center">姓名</th>
							<th class="text-center">性别</th>
							<th class="text-center">学历</th>
							<th class="text-center">部门</th>
							<th class="text-center">职位</th>
							<th class="text-center">状态</th>
							<th id="option" class="text-center">操作</th>
						</tr>
					</thead>
					<tbody id="myTable"></tbody>
				</table>
				<div class="text-center">
					<ul class="pagination" id="line">
					</ul>
				</div>
			</div>
		</div>

	</div>
	<script id="rowTemplate" type="application/html">
	<tr>
	<td class="text-center"></td>
	<td class="text-center"></td>
	<td class="text-center"></td>
	<td class="text-center"></td>
	<td class="text-center"></td>
	<td class="text-center"></td>
	<td class="text-center"></td>
	<td>
	<table style="margin-left:auto; margin-right:auto;" >
	<tr>
		<td><button type="button" class="myEdit btn btn-success btn-sm"
		data-toggle="modal" data-target="#editModal">编辑</button></td>
		<td><button type="button" class="myDelete btn btn-danger btn-sm" style="margin-left:5px;"
			data-toggle="modal" data-target="#deleteModal">删除</button></td>
	</tr>
	</table>
	</td>
</tr>
  </script>
</body>
</html>
