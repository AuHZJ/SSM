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
						内部培训列表</h3>
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
						<input class="form-control col-sm-4" type="text" id="LikeName"
							placeholder="请输入查询培训的名称" />
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
								确定要ID为 <span class="selectId"
									style="color: red; font-weight: bold;"></span> 的培训项目吗？
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
										<label for="typename" class="col-sm-4  control-label ">培训名称：</label>
										<div class="col-sm-8 col-sm-pull-2">
											<textarea class="form-control" id="typename" type="typename"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top: 26px; padding-right: 5px;">
										<label for="typeinfo" class="col-sm-4  control-label ">培训内容：</label>
										<div class="col-sm-8 col-sm-pull-2">
											<textarea class="form-control" id="typeinfo" type="typeinfo"></textarea>
										</div>
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
							<div class="modal-body" style="height: 270px;">
								<div class="form-group">
									<div class="row">
										<label for="typename2" class="col-sm-4  control-label ">培训名称：</label>
										<div class="col-sm-8 col-sm-pull-2">
											<textarea class="form-control" id="typename2"
												type="typename2"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top: 26px; padding-right: 5px;">
										<label for="typeinfo2" class="col-sm-4  control-label ">培训内容：</label>
										<div class="col-sm-8 col-sm-pull-2">
											<textarea class="form-control" id="typeinfo2"
												type="typeinfo2"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top: 26px; padding-right: 0px;">
										<label for="TypeCode" class="col-sm-2 control-label"
											style="padding-right: 0;">培训编号：</label>
										<div class="input-group col-sm-5 ">
											<input class="form-control col-sm-4 " id="TypeCode"
												type="TypeCode" />
										</div>
									</div>
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
							<th class="text-center">培训编号</th>
							<th class="text-center">培训名称</th>
							<th class="text-center">培训内容</th>
							<th id="option" class="text-center">操作</th>
						</tr>
					</thead>
					<tbody id="myTable"></tbody>
				</table>
				<!--<div style="margin-top:-15px">-->
				<!--<table style="margin-left:auto; margin-right:auto;">-->
				<!--<tr>-->
				<!--<td>-->
				<!--<ul class="pagination" id="myPage"></ul>-->
				<!--</td>-->
				<!--<td style="padding-left:25px;">每页：</td>-->
				<!--<td style="padding-right:15px;">-->
				<!--<select class="form-control" id="perPage">-->
				<!--<option>10</option>-->
				<!--<option>20</option>-->
				<!--<option>50</option>-->
				<!--<option>100</option>-->
				<!--</select>-->
				<!--</td>-->
				<!--<td id="jump">-->
				<!--<div class="input-group" >-->
				<!--<input type="text" class="form-control text-center" id="page" value="1"-->
				<!--onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="width:60px;">-->
				<!--<span class="input-group-btn">-->
				<!--<button type="submit" class="btn btn-info"-->
				<!--id="jumpbtn">跳转</button>-->
				<!--</span>-->
				<!--</div>-->
				<!--</td>-->
				<!--</tr>-->
				<!--</table>-->
				<!--</div>-->
				<div class="text-center">
					<ul class="pagination" id="line">
						<!--<li>-->
						<!--<a href="javascript:void(0);" >上一页</a>-->
						<!--</li>-->
						<!--<li>-->
						<!--<a href="javascript:void(0);">1</a>-->
						<!--</li>-->
						<!--<li>-->
						<!--<a href="javascript:void(0);">2</a>-->
						<!--</li>-->
						<!--<li>-->
						<!--<a href="javascript:void(0);">3</a>-->
						<!--</li>-->
						<!--<li>-->
						<!--<a href="javascript:void(0);">4</a>-->
						<!--</li>-->
						<!--<li>-->
						<!--<a href="javascript:void(0);">5</a>-->
						<!--</li>-->
						<!--<li>-->
						<!--<a href="#">Next</a>-->
						<!--</li>-->
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
	<!--<script src="/js/bootstrap-datetimepicker.fr.js"></script>-->
	<script src="js/bootstrap-datetimepicker.js"></script>
	<script src="js/locales/bootstrap-datetimepicker.fr.js"></script>
	<script>
		var EdiNew;
		//var C=${sessionScope.power};
		var C=2
		
		
		$(document).ready(lod);
		$(function(){
			$("#LikeSearch").click(lod);
		});
		
		function lod() {

			var name;
			var selectId = null;
			var LikeName = $("#LikeName").val();
			var $table = $('#myTable');

			var $line = $('#line');
			var $linechild = $line.children('li').eq(0).children('a');
			//console.log($linechild);
			//alert($index);
			$table.empty();
			$line.empty();
			$.ajax({
						url : "Type/page",
						type : "POST",
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						dataType : "json",
						data : {
							pageNum : 1,
							name : LikeName
						},
						error : function(fal) {
							alert("出现了错误" + fal.status);
							console.log(fal);
						},
						success : function(data) {
							var list = data["list"];
							var pages = data["pageSize"];
							if (C != 2) {
								$("#newButton").hide();
								$("#option").hide();
							}
							for (var i = 0; i < list.length; i++) {
								console.log(list[i].type_code);
								console.log(list[i].type_name);
								var $template = $($('#rowTemplate').html()).clone();
								$template.children('td').eq(0).text(list[i].type_code);
								$template.children('td').eq(1).text(list[i].type_name);
								$template.children('td').eq(2).text(list[i].type_info);
								var $btnGroup = $template.children('td').eq(3).find('button');
								if (C != 2) {
									$btnGroup.hide();
								}
								$btnGroup.eq(0).attr('name', list[i].type_code);
								$btnGroup.eq(1).attr('name', list[i].type_code);
								$table.append($template);
							}
							for (var $index = 1; $index <= pages; $index++) {
								//console.log(pages.page);
								var li = '<li> <a>' + $index + '</a></li>';
								$line.append(li);
							}
							console.log($("#line a"));
							console.log($("#line a").length);
							var num = 0;
							$("#line a").each(function() {
									this.id = num;
									num++;
									console.log(this.text);
									$(this).click(
									function upadte() {
																	//                              alert(1);
																	var $table = $('#myTable');
																	var $line = $('#line');
																	$table.empty();
																	$.ajax({
																				url : "Type/page",
																				type : "POST",
																				contentType : "application/x-www-form-urlencoded;charset=utf-8",
																				dataType : "json",
																				data : {
																					pageNum : $(this).text(),
																					name : LikeName
																				},
																				error : function(
																						fal) {
																					alert("出现了错误"
																							+ fal.status);
																					console
																							.log(fal);
																				},
																				success : function(
																						data) {
																					$table
																							.empty();
																					//console.log(data);
																					var list = data["list"];
																					var pages = data["pageSize"];
																					console
																							.log(pages);

																					//console.log(staffs.length);
																					for (var i = 0; i < list.length; i++) {
																						//console.log(staffs[i].id);
																						var $template = $(
																								$(
																										'#rowTemplate')
																										.html())
																								.clone();
																						$template
																								.children(
																										'td')
																								.eq(
																										0)
																								.text(
																										list[i].type_code);
																						$template
																								.children(
																										'td')
																								.eq(
																										1)
																								.text(
																										list[i].type_name);
																						$template
																								.children(
																										'td')
																								.eq(
																										2)
																								.text(
																										list[i].type_info);
																						var $btnGroup = $template
																								.children(
																										'td')
																								.eq(
																										3)
																								.find(
																										'button');
																						if (C == 1) {
																							$(
																									"#newButton")
																									.hide();
																							$(
																									"#option")
																									.hide();
																							$btnGroup
																									.hide();
																						}
																						$btnGroup
																								.eq(
																										0)
																								.attr(
																										'name',
																										list[i].type_code);
																						$btnGroup
																								.eq(
																										1)
																								.attr(
																										'name',
																										list[i].type_code);
																						$table
																								.append($template);
																					}
																					$(
																							'.myDelete')
																							.click(
																									function() {
																										selectId = parseInt($(
																												this)
																												.attr(
																														'name'));
																										$(
																												'.selectId')
																												.html(
																														selectId);
																										console
																												.log(selectId);
																									});
																					$(
																							'.myEdit')
																							.click(
																									function() {
																										$(
																												'#myModalLabel')
																												.html(
																														"编辑培训信息");
																										selectId = parseInt($(
																												this)
																												.attr(
																														'name'));
																										setCookie(
																												'selectId',
																												selectId,
																												1);
																										//window.location.href="/page/edit.html";
																									});
																				}
																			});
																});
											});
							$('.myDelete').click(function() {
								selectId = parseInt($(this).attr('name'));
								$('.selectId').html(selectId);
								console.log(selectId);
							});
							$('.myEdit').click(function() {
								$('#myModalLabel').html("编辑培训信息");
								selectId = parseInt($(this).attr('name'));
								setCookie('selectId', selectId, 1);

								//window.location.href="/page/edit.html";
							});
							$("#newButton").click(function() {
								$('#myModalLabel2').html("新建培训内容");

							});
							$("#delete-ok")
									.click(
											function() {
												if (selectId == null) {
													return false;
												}
												$
														.ajax({
															url : "Type/delete",
															type : "POST",
															async : false,
															contentType : "application/x-www-form-urlencoded;charset=utf-8",
															dataType : "json",
															data : {
																TypeId : selectId
															},
															error : function() {
																alert("删除出现了问题")
															},
															success : function(
																	data) {
																if (data.status == 200) {
																	//                                alert(selectId);
																	location
																			.reload();
																}
															}
														});
											});

							$("#editStaff")
									.click(
											function() {
												var typename = $("#typename")
														.val();
												var typeinfo = $("#typeinfo")
														.val();
												if (typename == "") {
													alert("请输入培训名称");
													return false;
												}
												if (typeinfo == "") {
													alert("请输入培训内容");
													return false;
												}
												$
														.ajax({
															url : "Type/update",
															type : "POST",
															async : false,
															contentType : "application/x-www-form-urlencoded;charset=utf-8",
															dataType : "json",
															data : {
																typename : typename,
																typeinfo : typeinfo,
																selectId : selectId
															},
															error : function(
																	error) {
																alert("更新编辑出现了问题："
																		+ error.status);
															},
															success : function(
																	data) {
																alert("成功");
																if (data.status == 200) {
																	location
																			.reload();
																}
															}
														});
											});
							$("#insertAgr")
									.click(
											function() {
												var typename2 = $("#typename2")
														.val();
												var typeinfo2 = $("#typeinfo2")
														.val();
												var typecode = $("#TypeCode")
														.val();
												if (typename2 == "") {
													alert("请输入培训名称");
													return false;
												}
												if (typeinfo2 == "") {
													alert("请输入培训内容");
													return false;
												}
												//alert("xxx");
												$
														.ajax({
															url : "Type/insert",
															type : "POST",
															async : false,
															contentType : "application/x-www-form-urlencoded;charset=utf-8",
															dataType : "json",
															data : {
																typename : typename2,
																typeinfo : typeinfo2,
																typecode : typecode
															},
															error : function(
																	error) {
																alert("新增合同出现了问题："
																		+ error.status
																		+ "请确定该员工存在并且没有签署合同");
															},
															success : function(
																	data) {
																//                                    alert("成功");
																if (data.status == 200) {
																	location
																			.reload();
																} else if (data.status == 300) {
																	alert("新增培训出现了问题："
																			+ error.status
																			+ "请确定不存在输入ID的培训项目");
																}
															}
														});
											});
						}
					});

		}
	</script>
</body>
</html>
