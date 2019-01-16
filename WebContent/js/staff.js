function ajaxfun() { //获取有哪些部门
	var department = $("#department").val();
	$.ajax({
		url : "manage/cascade",
		type : "POST",
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		dataType : "json",
		data : {
			department : department
		},
		error : function(fal) {
			alert("出现了错误" + fal.status);
		},

		success : function(data) {
			//console.log(data)
			//从数据库中获取部门信息，显示在下拉列表中
			$('#department').empty();
			var pos = data["pos"];
			for (var i = 0; i < pos.length; i++) {
				var options = $('<option>');
				$(options).val(pos[i].dept_name);
				$(options).text(pos[i].dept_name);
				$('#department').append($(options));
			}
		},
	})
}

function ajaxfun2() { //获取有哪些职位
	var department = $("#department").val();
	$.ajax({
		url : "manage/position",
		type : "POST",
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		dataType : "json",
		data : {
			department : department
		},
		error : function(fal) {
			alert("出现了错误" + fal.status);
		},

		success : function(data) {
			//console.log(data)
			//从数据库中获取职位信息，显示在下拉列表中
			$('#position').empty();
			var pos = data["pos"];
			for (var i = 0; i < pos.length; i++) {
				var options = $('<option>');
				$(options).val(pos[i]);
				$(options).text(pos[i]);
				$('#position').append($(options));
			}
		},
	})
}

ajaxfun();


var EdiNew;
var flag=0;

//查询事件
$(function(){
	  $("#LikeSearch").click(lod);
});

//文档第一次加载时读取表格
$(document).ready(lod);

function lod() {
    //判断操作的是哪个员工
	  var selectId=null;
    //模糊查询关键字
    var name=$("#LikeName").val();
    
    //表格主体
    var $table=$("#myTable");
	  
    //表格下方页码下·	
    var $line=$("#line");
    var $linechild=$line.children('li').eq(0).children('a');
    
    //每次加载先将表格和页码栏清空，重写构造内容
    $line.empty();
    $table.empty();
    
    //向后台提交请求获取表单内容
    $.ajax({
        url:"staff/findAllStaff",
        type:"POST",
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        dataType: "json",
		  data:{
            //默认获取第一页
			pageNum:1,
            name:name
		  },
        error:function (fal) {
            alert("出现了错误"+fal.status);
        },
        success:function (data) {
        	//console.log(data);
            var staffs = data["staffList"];
            var pages = data["pageSize"];
            //从数据库中获取部门信息，显示在下拉列表中
            //console.log(staffs);
            if (C!=2){
                $("#newButton").hide();
                $("#option").hide();
            }
            
          	 for(var i=0;i<staffs.length;i++){
                var $template = $($('#rowTemplate').html()).clone();
                $template.children('td').eq(0).text(staffs[i].id);
                $template.children('td').eq(1).text(staffs[i].name);
                $template.children('td').eq(2).text(staffs[i].sex);
                $template.children('td').eq(3).text(staffs[i].degree);
                $template.children('td').eq(4).text(staffs[i].department.dept_name);
                $template.children('td').eq(5).text(staffs[i].position);
                $template.children('td').eq(6).text(staffs[i].state);
                
                var $btnGroup=$template.children('td').eq(7).find('button');
                if (C!=2){
                    $btnGroup.hide();
                }
                $btnGroup.eq(0).attr('name', staffs[i].id);
                $btnGroup.eq(1).attr('name', staffs[i].id);
                $table.append($template);
            }
            var number = pages;
          	  for(var $index=1;$index<=number;$index++){
                var li= '<li> <a>'+$index+'</a></li>';
                $line.append(li);
            }
            var num=0;
                $("#line a").each(function () {
                    this.id = num;
                    num++;
                     $(this).click(function upadte() {
							var number = this.text;
                        var $table = $('#myTable');
                        var $line = $('#line');
                        var name = $("#LikeName").val();
                        $table.empty();
                        $.ajax({
                            url: "staff/findAllStaff",
                            type: "POST",
                            contentType: "application/x-www-form-urlencoded;charset=utf-8",
                            dataType: "json",
                            data: {
                                pageNum:number,
                                name:name
                            },
                            error: function (fal) {
                                alert("出现了错误" + fal.status);
                                console.log(fal);
                            },
                            success: function (data) {
                                $table.empty();
                                var staffs = data["staffList"];
                                var pages = data["pageSize"];
                                if (C!=2){
                                    $("#newButton").hide();
                                    $("#option").hide();
                                }
                          
                                for (var i = 0; i < staffs.length; i++) {
                                    var $template = $($('#rowTemplate').html()).clone();
                                    $template.children('td').eq(0).text(staffs[i].id);
                                    $template.children('td').eq(1).text(staffs[i].name);
                                    $template.children('td').eq(2).text(staffs[i].sex);
                                    $template.children('td').eq(3).text(staffs[i].degree);
                                    $template.children('td').eq(4).text(staffs[i].department.dept_name);
                                    $template.children('td').eq(5).text(staffs[i].position);
                                    $template.children('td').eq(6).text(staffs[i].state);
                                    var $btnGroup=$template.children('td').eq(7).find('button');
                                    if (C!=2){
                                        $btnGroup.hide();
                                    }
                                    $btnGroup.eq(0).attr('name', staffs[i].id);
                                    $btnGroup.eq(1).attr('name', staffs[i].id);
                                    $table.append($template);
                                }
                                $('.myDelete').click(function () {
//                                    alert(selectId);
                                    selectId=parseInt($(this).attr('name'));
                                    $('.selectId').html(selectId);
                                    console.log(selectId);
                                });
                                $('.myEdit').click(function(){
                                    EdiNew=1;
                                    $('#myModalLabel').html("编辑员工信息");
                                    selectId=parseInt($(this).attr('name'));
                                    setCookie('selectId', selectId, 1);
                                });
                            }
                        });
                    });
                }); 
            $('.myDelete').click(function () {
//                alert(selectId);
                selectId=parseInt($(this).attr('name'));
                $('.selectId').html(selectId);
            });
            $('.myEdit').click(function(){
                  EdiNew=1;
                  var tds = $(this).parent().parent().parent().parent().parent().parent().children("td");
                  $("#name").attr("value", $(tds[1]).html());
				  $("#sex").val($(tds[2]).html());
				  $("#degree").val($(tds[3]).html());
				  $("#department").val($(tds[4]).html());
				  var options = $('<option>');
				  $(options).val($(tds[5]).html());
				  $(options).text($(tds[5]).html());
				  $('#position').append($(options));
				  $("#position").val($(tds[5]).html());
				  $("#state").val($(tds[6]).html());

                $('#myModalLabel').html("编辑员工信息");
                selectId=parseInt($(this).attr('name'));
                setCookie('selectId', selectId, 1);
					
            });
			$("#delete-ok").click(function () {
				if(selectId==null){
					return false;
				}
              $.ajax({
                  url: "staff/deleteStaff",
                  type: "POST",
                  async: false,
                  contentType: "application/x-www-form-urlencoded;charset=utf-8",
                  dataType: "json",
                  data: {
                      StaffId:selectId
                  },
                  error:function () {
                      alert("删除出现了问题")
                  },
                  success:function (data) {
                      if (data.status==200){
                          location.reload();
                      }
                  }
              });
          });
			  $("#editStaff").click(function () {
				var check = 0;					  
                if ($("#check").is(":checked")){
              	  check=1;
				}
				  var name=$("#name").val();
				  var sex=$("#sex").val();
				  var degree=$("#degree").val();
				  var department=$("#department").val();
				  var position=$("#position").val();
				  var state=$("#state").val();
				  var username=$("#username").val();
				  var password=$("#password").val();
				  selectId = parseInt(selectId)
				  console.log(name,sex,degree,department,position,state,username,password)
				  if (name==""){
				      alert("请输入名字");
				      return false;
				  }
				  if(EdiNew==1){
					  
                    $.ajax({
                        url: "staff/updateStaff", 
                        type: "POST",
                        async: false,
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        dataType: "json",
                        data: {
                            name:name,
                            sex:sex,
                            degree:degree,
                            department:department,
                            position:position,
                            state:state,
                            id:selectId,
							username:username,
							password:password,
							flag:check
                        },
                        error:function (error) {
                            alert("更新编辑出现了问题："+error.status);
                        },
                        success:function (data) {
                            alert("成功");
                            if (data.status==200){
                                location.reload();
                            }
                            if(data.status==401){
                          	  alert("用户名已存在");
                          	  return;
                            }
                        }
                    });
				  }
				  if(EdiNew==2){
                    if (name==""){
                        alert("请输入名字");
                        return false;
                    }
                    $.ajax({
                        url: "staff/insertStaff",
                        type: "POST",
                        async: false,
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        dataType: "json",
                        data: {
                            name:name,
                            sex:sex,
                            degree:degree,
                            department:department,
                            position:position,
                            selectId:selectId,
                            state:state,
                            username:username,
                            password:password,
							flag:flag
                        },
                        error:function (error) {
                            alert("新增员工出现了问题："+error.status);
                        },
                        success:function (data) {
                            //console.log("lw"+state);
                      	  alert("成功");
                            if (data.status==200){
                                location.reload();
                            }
                        }
                    });
				  }
            });
			$("#newButton").click(function () {
				$('#myModalLabel').html("新建员工信息");
				EdiNew=2;
          });
			pages = null;
			staffs = null;
        }
    });
}