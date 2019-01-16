var EdiNew;

$(function() {
	$("#LikeSearch").click(lod);
});

$(document).ready(lod);

function lod() {
	$('.form_date').datetimepicker({
		language : 'fr',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});

	var name;
	var selectId = null;
	var $table = $('#myTable');
	var LikeName = $("#LikeName").val();
	var $line = $('#line');
	var $linechild = $line.children('li').eq(0).children('a');
	// console.log($linechild);
	// alert($index);
	$table.empty();
	$line.empty();
	$.ajax({
		url : "alter/findAlter",
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
			var agr = data["list"];
			var pages = data["pageSize"];
			if (C != 2) {
				$("#newButton").hide();
				$("#option").hide();
			}
			for (var i = 0; i < agr.length; i++) {
				var $template = $($('#rowTemplate').html()).clone();
				$template.children('td').eq(0).text(agr[i].alterId);
				$template.children('td').eq(1).text(agr[i].staff.name);
				$template.children('td').eq(2).text(agr[i].alter_btime);
				$template.children('td').eq(3).text(agr[i].alter_etime);
				$template.children('td').eq(4).text(agr[i].alter_content);
				// $template.children('td').eq(5).text(staffs[i].position);
				// $template.children('td').eq(6).text(staffs[i].state);
				var $btnGroup = $template.children('td').eq(5).find('button');
				if (C != 2) {
					$btnGroup.hide();
				}
				$btnGroup.eq(0).attr('name', agr[i].alterId);
				$btnGroup.eq(1).attr('name', agr[i].alterId);
				$table.append($template);
			}
			for (var $index = 1; $index <= pages; $index++) {
				// console.log(pages.page);
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
				$(this).click(function upadte() {
					var $table = $('#myTable');
					var $line = $('#line');
					var number = this.text;
					var name = $("#LikeName").val();
					$table.empty();
					$.ajax({
						url : "alter/findAlter",
						type : "POST",
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						dataType : "json",
						data : {
							pageNum : number,
							name : name
						},
						error : function(fal) {
							alert("出现了错误"+ fal.status);
							console.log(fal);
						},
						success : function(data) {
							$table.empty();
							var agr = data["list"];
							var pages = data["pageSize"];
							if (C != 2) {
								$("#newButton").hide();
								$("#option").hide();
							}
							for (var i = 0; i < agr.length; i++) {
								var $template = $($('#rowTemplate').html()).clone();
								$template.children('td').eq(0).text(agr[i].alterId);
								$template.children('td').eq(1).text(agr[i].staff.name);
								$template.children('td').eq(2).text(agr[i].alter_btime);
								$template.children('td').eq(3).text(agr[i].alter_etime);
								$template.children('td').eq(4).text(agr[i].alter_content);
								var $btnGroup = $template.children('td').eq(5).find('button');
								if (C != 2) {
									$btnGroup.hide();
								}
								$btnGroup.eq(0).attr('name',agr[i].alterId);
								$btnGroup.eq(1).attr('name',agr[i].alterId);
								$table.append($template);
							}
							$('.myDelete').click(function() {
								selectId = parseInt($(this).attr('name'));
								$('.selectId').html(selectId);
								console.log(selectId);
							});
							$('.myEdit').click(function() {
								$('#myModalLabel').html("编辑出行信息");
								selectId = parseInt($(this).attr('name'));
								setCookie('selectId',selectId,1);
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
				$('#myModalLabel').html("编辑出行信息");
				selectId = parseInt($(this).attr('name'));
				setCookie('selectId', selectId, 1);

			});
			$("#newButton").click(function() {
				$('#myModalLabel2').html("新建出行信息");

			});
			$("#delete-ok").click(function() {
				if (selectId == null) {
					return false;
				}
				$.ajax({
					url : "alter/delete",
					type : "POST",
					async : false,
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					dataType : "json",
					data : {
						selectId : selectId
					},
					error : function() {
						alert("删除出现了问题")
					},
					success : function(data) {
						if (data.status == 200) {
							//alert(selectId);
							location.reload();
						}
					}
				});
			});

			$("#editStaff").click(function() {
				var alter = $("#alter").val();
				var Btime = $("#Btime").val();
				var Etime = $("#Etime").val();
				var d1 = new Date(Btime.replace(/\-/g,"\/"));
				var d2 = new Date(Etime.replace(/\-/g,"\/"));
				if (alter == "") {
					alert("内容不得为空！");
					return false;
				}
				if (Btime == "" || Etime == "") {
					alert("时间不得为空！");
					return false;
				}
				if (Btime != "" && Etime != ""&& d1 > d2) {
					alert("开始时间不能大于结束时间！");
					return false;
				}
				$.ajax({
					url : "alter/update",
					type : "POST",
					async : false,
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					dataType : "json",
					data : {
						alter : alter,
						Btime : Btime,
						Etime : Etime,
						selectId : selectId,
					},
					error : function(error) {
						alert("更新编辑出现了问题："+ error.status);
					},
					success : function(data) {
						alert("成功");
						if (data.status == 200) {
							location.reload();
						}
					}
				});
			});
			$("#insertAgr").click(function() {
				var alter2 = $("#alter2").val();
				var Btime2 = $("#Btime2").val();
				var Etime2 = $("#Etime2").val();
				var StaffId = $("#StaffId").val();
				var d1 = new Date(Btime2.replace(/\-/g,"\/"));
				var d2 = new Date(Etime2.replace(/\-/g,"\/"));
				if (alter2 == "") {
					alert("内容不能为空！");
					return false;
				}
				if (Btime2 == "" || Etime2 == "") {
					alert("请选择时间！");
					return false;
				}
				if (Btime != "" && Etime != ""&& d1 > d2) {
					alert("开始时间不能大于结束时间！");
					return false;
				}
				if (StaffId == "") {
					alert("员工ID不能为空！");
					return false;
				}
				$.ajax({
					url : "alter/insert",
					type : "POST",
					async : false,
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					dataType : "json",
					data : {
						alter2 : alter2,
						Btime2 : Btime2,
						Etime2 : Etime2,
						StaffId : StaffId
					},
					error : function(error) {
						alert("新增活动出现了问题："+ error.status+ "请确定该员工存在");
					},
					success : function(data) {
						alert("成功");
						if (data.status == 200) {
							location.reload();
						} else if (data.status == 300) {
							alert("请确认选择添加的员工ID是否存在");
						}
					}
				});
			});
		}
	});
}