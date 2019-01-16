<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title>首页</title>
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css"
	media="screen">

</head>
<body style="width: 100%; margin: 0;">

	<div class="container">
		<div class="row clearfix">

			<div class="col-md-12 column">
				<table
					style="margin-left: auto; margin-right: auto; margin-top: 10px;">
					<h3 class="text-center"
						style="border: 5px solid #a1a1a1; padding: 10px 40px; background: #dad7dd; width: 100%; border-radius: 25px;">
						企业员工活动列表</h3>
				</table>
				<!--<h2 style="width: 100%">-->
				<!--Tittle-->
				<!--</h2>-->
				<div class="form-group container" style="">
					<button id="newButton" type="button"
						class="btn btn-sm btn-primary col-sm-3" data-toggle="modal"
						data-target="#insertModal" style="width: 80px; margin-left: 5px;">新建
					</button>
					<div class="col-sm-3" style="float: right">
						<input class="form-control col-sm-4" type="text"
							placeholder="请输入查询活动的内容" id="LikeName" />
					</div>
					<button type="submit" style="float: right"
						class=" btn btn-default col-sm-1" id="LikeSearch">查询</button>
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
								确定删除活动编号为 <span class="selectId"
									style="color: red; font-weight: bold;"></span> 的职工的出差记录吗？
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
									<div class="row">
										<label for="alter" class="col-sm-4  control-label ">活动内容：</label>
										<div class="col-sm-8 col-sm-pull-2">
											<textarea class="form-control" id="alter" type="alter"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top: 2px; padding-right: 5px;">
										<label for="dtp_input1" class="col-md-2 control-label"
											style="margin-top: 26px;">开始日期:</label>
										<div class="input-group date form_date col-md-5" data-date=""
											data-date-format="yyyy mm dd" data-link-field="dtp_input1"
											data-link-format="yyyy-mm-dd" style="margin-top: 20px;">
											<input class="form-control" size="16" type="text" value=""
												readonly id="Btime"> <span class="input-group-addon"><span
												class="glyphicon glyphicon-remove"></span></span> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
										<input type="hidden" id="dtp_input1" value="" /><br />
									</div>
									<div class="row" style="margin-top: 2px; padding-right: 5px;">
										<label for="dtp_input2" class="col-md-2 control-label"
											style="margin-top: 26px;">结束日期:</label>
										<div class="input-group date form_date col-md-5" data-date=""
											data-date-format="yyyy mm dd" data-link-field="dtp_input2"
											data-link-format="yyyy-mm-dd" style="margin-top: 20px;">
											<input class="form-control" size="16" type="text" value=""
												readonly id="Etime"> <span class="input-group-addon"><span
												class="glyphicon glyphicon-remove"></span></span> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
										<input type="hidden" id="dtp_input2" value="" /><br />
									</div>
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


				<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel2" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel2"></h4>
							</div>
							<div class="modal-body" style="height: 300px;">
								<div class="form-group">
									<div class="row">
										<label for="alter2" class="col-sm-4  control-label ">活动内容：</label>
										<div class="col-sm-8 col-sm-pull-2">
											<textarea class="form-control" id="alter2" type="alter"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top: 26px; padding-right: 5px;">
										<label for="dtp_input3" class="col-md-2 control-label">开始日期:</label>
										<div class="input-group date form_date col-md-5" data-date=""
											data-date-format="yyyy mm dd" data-link-field="dtp_input2"
											data-link-format="yyyy-mm-dd">
											<input class="form-control" size="16" type="text" value=""
												readonly id="Btime2"> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-remove"></span></span> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
										<input type="hidden" id="dtp_input3" value="" />
									</div>
									<div class="row" style="margin-top: 26px; padding-right: 5px;">
										<label for="dtp_input4" class="col-md-2 control-label">结束日期:</label>
										<div class="input-group date form_date col-md-5" data-date=""
											data-date-format="yyyy mm dd" data-link-field="dtp_input4"
											data-link-format="yyyy-mm-dd">
											<input class="form-control" size="16" type="text" value=""
												readonly id="Etime2"> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-remove"></span></span> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
										<input type="hidden" id="dtp_input4" value="" />

									</div>
									<div class="row" style="margin-top: 26px; padding-right: 0px;">
										<label for="StaffId" class="col-sm-2 control-label"
											style="padding-right: 0;">员工编号：</label>
										<div class="input-group col-sm-5 ">
											<input class="form-control col-sm-4 " id="StaffId"
												type="StaffId" />
										</div>
									</div>
									<!--<div class="row" style="margin-top: 26px; padding-right: 0px;">-->
									<!--<label for="AgrId" class="col-sm-2 control-label" style="padding-right: 0;">合同编号：</label>-->
									<!--<div class="input-group col-sm-5 ">-->
									<!--<input class="form-control col-sm-4 " id="AgrId" type="AgrId" />-->
									<!--</div>-->
									<!--</div>-->
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button id="insertAgr" type="button" class="btn btn-primary"
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
							<th class="text-center">活动编号</th>
							<th class="text-center">员工姓名</th>
							<th class="text-center">开始时间</th>
							<th class="text-center">结束时间</th>
							<th class="text-center">活动内容</th>
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
	<td>
	<table style="margin-left:auto; margin-right:auto;">
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
	<script src="js/cookie.js"></script>
	<script src="common/js/jquery-3.1.1.min.js" charset="utf-8"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datetimepicker.js"></script>
	<script src="js/locales/bootstrap-datetimepicker.fr.js"></script>
	<script src="js/alter.js"></script>
	<script type="text/javascript">
		//var C = ${sessionScope.power};
		var C=2
	</script>
</body>
</html>
