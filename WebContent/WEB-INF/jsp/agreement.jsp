<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String basePath = request.getScheme()+"://"+
						request.getServerName()+":"+
						request.getServerPort()+
						request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath %>">
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" media="screen">
	<style type="text/css">
			.txt1 {
				height: 22px;
				border: 1px solid #cdcdcd;
				width: 180px;
			}
			
			.btn1 {
				background-color: #FFF;
				border: 1px solid #CDCDCD;
				height: 24px;
				width: 70px;
			}
			img{
				width:30px;
				height:30px;
			}
			.file1 {
				position: absolute;
				top: 0;
				right: 80px;
				height: 24px;
				filter: alpha(opacity : 0);
				opacity: 0;
				width: 100px
			}
			
			
	</style>
</head>
<body style="width: 100%; margin: 0;">
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
        //alert(C);
        $(document).ready(lod);
        
        
        $(function(){
        	$("#LikeSearch").click(lod);
        })
        
        function lod() {
        	
            $('.form_date').datetimepicker({
                language: 'fr',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });


            var name;
            var selectId = null;
            var LikeName=$("#LikeName").val();
            var $table = $("#myTable");

            var $line = $("#line");
            var $linechild = $line.children('li').eq(0).children('a');
            
            if(C==2){
            	url = "agr/page";
            }else{
            	url = "agr/myPage";
            }
            
            
            
            
            $table.empty();
            $line.empty();
            $.ajax({
                url: url,
                type: "POST",
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType: "json",
                data: {
                	pageNum: 1,
                    name:LikeName
                },
                error: function (fal) {
                    alert("出现了错误" + fal.status);
                },
                success: function (data) {
                    var agr = data["list"];
                    var pages = data["pageSize"];
                    if (C!=2){
                        $("#newButton").hide();
                        $("#option").hide();
                    }
                    for (var i = 0; i < agr.length; i++) {
                        var $template = $($('#rowTemplate').html()).clone();
                        $template.children('td').eq(0).text(agr[i].agreement_id);
                        $template.children('td').eq(1).text(agr[i].staff.name);
                        $template.children('td').eq(2).text(agr[i].agreement_btime);
                        $template.children('td').eq(3).append("<a href='file/"+agr[i].agreementContent +"' target='_blank'><img src='images/word.png'></img></a>");
                        var $btnGroup = $template.children('td').eq(4).find('button');
                        if (C!=2){
                            $btnGroup.hide();
                        }
                        $btnGroup.eq(0).attr('name', agr[i].agreement_id);
                        $btnGroup.eq(1).attr('name', agr[i].agreement_id);
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
                    $("#line a").each(function () {
                        this.id = num;
                        num++;
                        console.log(this.text);
                        var number = this.text;
                        $(this).click(function upadte() {
//                              alert(1);
                            var $table = $('#myTable');
                            var $line = $('#line');
                            $table.empty();
                            $.ajax({
                                url: url,
                                type: "POST",
                                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                                dataType: "json",
                                data: {
                                 	pageNum: number,
                                    name:LikeName
                                },
                                error: function (fal) {
                                    alert("出现了错误" + fal.status);
                                    console.log(fal);
                                },
                                success: function (data) {
                                    $table.empty();
                                    //console.log(data);
                                    var agr = data["list"];
                                    var pages = data["page"];
                                    if (C!=2){
                                        $("#newButton").hide();
                                        $("#option").hide();
                                    }
                                    //console.log(staffs.length);
                                    for (var i = 0; i < agr.length; i++) {
                                        //console.log(staffs[i].id);
                                        var $template = $($('#rowTemplate').html()).clone();
                                        $template.children('td').eq(0).text(agr[i].agreement_id);
                                        $template.children('td').eq(1).text(agr[i].staff.name);
                                        $template.children('td').eq(2).text(agr[i].agreement_btime);
                                        //$template.children('td').eq(3).text(agr[i].agreement_content);
                                        $template.children('td').eq(3).append("<a href='download/file1?fileName="+agr[i].agreementContent +"' target='_self'><img src='images/word.png'></img></a>");
                                        var $btnGroup = $template.children('td').eq(4).find('button');
                                        if (C!=2){
                                            $btnGroup.hide();
                                        }
                                        $btnGroup.eq(0).attr('name', agr[i].agreement_id);
                                        $btnGroup.eq(1).attr('name', agr[i].agreement_id);
                                        $table.append($template);
                                    }
                                      $('.myDelete').click(function () {
                                          selectId=parseInt($(this).attr('name'));
                                          $('.selectId').html(selectId);
                                          console.log(selectId);
                                      });
                                      $('.myEdit').click(function(){
                                          $('#myModalLabel').html("编辑合同信息");
                                          selectId=parseInt($(this).attr('name'));
                                          setCookie('selectId', selectId, 1);
                                          //window.location.href="/page/edit.html";
                                      });
                                }
                            });
                        });
                    });
                    $('.myDelete').click(function () {
                     selectId=parseInt($(this).attr('name'));
                     $('.selectId').html(selectId);
                     console.log(selectId);
                     });
                    $('.myEdit').click(function () {
                        $('#myModalLabel').html("编辑合同信息");
                        selectId = parseInt($(this).attr('name'));
                        setCookie('selectId', selectId, 1);

                        //window.location.href="/page/edit.html";
                    });
                    $("#newButton").click(function () {
                        $('#myModalLabel2').html("新建员工合同");

                    });
				$("#delete-ok").click(function () {
					if(selectId==null){
						return false;
					}
                    $.ajax({
                        url: "agr/delete",
                        type: "POST",
                        async: false,
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        dataType: "json",
                        data: {
                        	selectId : selectId
                        },
                        error:function () {
                            alert("删除出现了问题")
                        },
                        success:function (data) {
                            if (data.status==200){
//                                alert(selectId);
                                location.reload();
                            }
                        }
                    });
                });

			

                    $("#editStaff").click(function () {
                    	//alert("===");
                    	// 获取文件对象
                    	var time = $("#time").val();
                    	var file = document.getElementById("fileField1").files[0]; 
                    	 var form = new FormData();
						
                         form.append("time", time);                        // 可以增加表单数据

                         form.append("file", file); 
                         form.append("selectId",selectId);
                      // 接收上传文件的后台地址 
                         $.ajax({
                                 url: "agr/update",
                                 type: "POST",
                                 processData: false,
                                 contentType: false,
                                 async: true,
                                 data:form,
                                 error: function (error) {
                                     alert("更新编辑出现了问题：" + error.status);
                                 },
                                 success: function (data) {
                                     alert("成功");
                                     if (data.status == 200) {
                                         location.reload();
                                     }
                                 }
                             });
                    });
                    
                    
                    $("#insertAgr").click(function () {
                    	//alert("===");
                    	// 获取文件对象
                    	var time = $("#time2").val();
                    	var StaffId=$("#StaffId").val();
                    	
                    	 if (time==""){
                             alert("请输入时间");
                             return false;
                         }
                         if (StaffId==""){
                             alert("请输入员工id");
                             return false;
                         }
                    	
                    	var file = document.getElementById("fileField2").files[0]; 
                    	//alert(file);
                    	 var form = new FormData();
						
                         form.append("time", time);                        // 可以增加表单数据

                         form.append("file", file); 
                         form.append("StaffId",StaffId);
                      // 接收上传文件的后台地址 
                         $.ajax({
                                 url: "agr/insert",
                                 type: "POST",
                                 processData: false,
                                 contentType: false,
                                 async: true,
                                 data:form,
                                 error: function (error) {
                                     alert("新增合同出现了问题：" + error.status+"请确定该员工存在并且没有签署合同");
                                 },
                                 success: function (data) {
                                     if (data.status == 200) {
 									      alert("添加合同成功");
                                         location.reload();
                                     }
                                     else if (data.status == 300){
                                         alert("新增合同出现了问题："+"请确定该员工存在并且没有签署合同");
                                     }
                                 }
                             });
                    });
                    
                }
            });

        }
    </script>

<div class="container">
    <div class="row clearfix">

        <div class="col-md-12 column">
            <table style="margin-left:auto; margin-right:auto; margin-top:10px;">
                <h3 class="text-center" style="border:5px solid #a1a1a1;padding:10px 40px;background:#dad7dd;width:100%;border-radius:25px;">
                    企业合同信息基本列表
                </h3>
            </table>
            <!--<h2 style="width: 100%">-->
            <!--Tittle-->
            <!--</h2>-->
            <div class="form-group container" style="">
                <button id="newButton" type="button" class="btn btn-sm btn-primary col-sm-3"
                        data-toggle="modal"
                        data-target="#insertModal" style="width:80px; margin-left:5px;">新建
                </button>
                
                <div class="col-sm-3" style="float: right">
                    <input class="form-control col-sm-4" type="text" id="LikeName" placeholder="请输入查询员工的姓名"/>
                </div>
                <button type="submit" style="float: right" class=" btn btn-default col-sm-1" id="LikeSearch">查询</button>
            </div>

            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" data-backdrop="static"
            aria-labelledby="deleteModalLabel" aria-hidden="true" style="margin-top:100px">
            <div class="modal-dialog" style="width:350px;">
            <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title model-text1" id="deleteModalLabel"><B>删除</B></h4>
            </div>
            <div class="modal-body">
            确定删除编号为 <span class="selectId" style="color:red;font-weight:bold;"></span> 的员工合同吗？
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal"
            id="delete-ok">确定</button>
            <button type="button" class="btn btn-info" data-dismiss="modal"
            id="delete-cancel">取消</button>
            </div>
            </div>
            </div>
            </div>

            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" id="myModalLabel">

                            </h4>
                        </div>
                        <div class="modal-body" style="height: 200px;">
                            <div class="form-group">
                                <label for="agreement" class="col-sm-4  control-label ">合同内容：</label>
                                <div class="col-sm-8 col-sm-pull-2">
                               		<input type='text' name='textfield' id='textfield' class='txt1' /> 
									<input type='button' class='btn1' value='浏览...' /> 
									<input type="file" name="fileField" class="file1" id="fileField1" size="28"
									onchange="document.getElementById('textfield').value=this.value" />
									
                                </div>
                                <br> <br> <br>
                                    <label for="dtp_input2" class="col-md-2 control-label" style="margin-top: 26px;">生效日期</label>
                                    <div class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="yyyy mm dd" data-link-field="dtp_input2"
                                         data-link-format="yyyy-mm-dd" style="margin-top: 20px;">
                                        <input class="form-control" size="16" type="text" value="" readonly id="time">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                <input type="hidden" id="dtp_input2" value=""/><br/>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>
                            <button id="editStaff" type="button" class="btn btn-primary" data-dismiss="modal">
                                提交更改
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" id="myModalLabel2">

                            </h4>
                        </div>
                        <div class="modal-body" style="height: 270px;">
                            <div class="form-group">
                                <div class="row">
                                    <label for="agreement" class="col-sm-4  control-label ">合同内容：</label>
                                     <div class="col-sm-8 col-sm-pull-2">
                                  <!--   <textarea class="form-control" id="agreement" type="agreement"></textarea> -->
                               		<input type='text' name='textfield' id='textfield2' class='txt1' /> 
									<input type='button' class='btn1' value='浏览...' /> 
									<input type="file" name="fileField" class="file1" id="fileField2" size="28"
									onchange="document.getElementById('textfield2').value=this.value" />
									
                                	</div>
                                </div>
                                <div class="row" style="margin-top: 26px; padding-right: 5px;">
                                    <label for="dtp_input3" class="col-md-2 control-label">生效日期:</label>
                                    <div class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="yyyy mm dd" data-link-field="dtp_input2"
                                         data-link-format="yyyy-mm-dd">
                                        <input class="form-control" size="16" type="text" value="" readonly id="time2">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                    <input type="hidden" id="dtp_input3" value=""/>
                                </div>
                                <div class="row" style="margin-top: 26px; padding-right: 0px;">
                                    <label for="StaffId" class="col-sm-2 control-label" style="padding-right: 0;">员工编号：</label>
                                    <div class="input-group col-sm-5 ">
                                        <input class="form-control col-sm-4 " id="StaffId" type="StaffId" />
                                    </div>
                                </div>
                               <!--  <div class="row" style="margin-top: 26px; padding-right: 0px;">
                                    <label for="AgrId" class="col-sm-2 control-label" style="padding-right: 0;">合同编号：</label>
                                    <div class="input-group col-sm-5 ">
                                        <input class="form-control col-sm-4 " id="AgrId" type="AgrId" />
                                    </div>
                                </div> -->
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>
                            <button id="insertAgr" type="button" class="btn btn-primary" data-dismiss="modal">
                                提交更改
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->



            <table class="table table-hover table-condensed">
                <thead>
                <tr>
                    <th class="text-center">合同编号</th>
                    <th class="text-center">员工姓名</th>
                    <th class="text-center">生效时间</th>
                    <th class="text-center">合同内容</th>
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


</body>
</html>
