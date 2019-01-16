$('document').ready(function () {
    window.pageCount;
    $("body").keydown(function(event) {
        if (event.keyCode == "13") {
           $('#query').click();
        }
    });
    $('#query').click(function() {
        query({
            id: $('#id').val(),
            name:$('#name').val()
        });
    });
    query({
        page:1,
        pageSize:10
    });
});

function query(queryInfo) {
    var defaultArg = {
        id: "",
        name: "",
        page: 1,
        pageSize: 10
    };
    
    queryInfo = $.extend({}, defaultArg, queryInfo);
    $.ajax({
        url: "staff/findAllStaff",
        type: "POST",
        dataType: "json",
        data: queryInfo,
        success: function (data) {
            console("1313",data)
            pageCount = Math.ceil(data.total/queryInfo.pageSize);
            if(data.total>0){
                // 每次查询前先清空表格
                $('#userTable tbody').empty();
                for (var item of data.rows) {
                    var $template = $($('#rowTemplate').html()).clone();
                    var $operateMenu = $($('#operateMenuTemplate').html()).clone();
                    $template.children('td').eq(0).text(item.id);
                    $template.children('td').eq(1).text(item.name);
                    $template.children('td').eq(2).text(item.sex);
                    $template.children('td').eq(3).text(item.degree);
                    $template.children('td').eq(4).append(item.department);
                    $template.children('td').eq(5).append(item.position);
                    $template.children('td').eq(6).append(item.state);
                    // 给操作按钮添加点击事件
                    $operateMenu.children('div').children('div').children('button:first').on('click',function(event){
                        event = event ? event : window.event; 
                        var source = event.srcElement ? event.srcElement : event.target; 
                        var $source = $(source);
                        var $rowNow = $source.parent().parent().parent().parent();
                        if($source.html() == "修改"){
                            $rowNow.siblings("td").eq(1).html("<input type='text' value='"+$(this).text()+"'>");
                            $rowNow.siblings("td").eq(2).html("<input type='text' value='"+$(this).text()+"'>");
                            $rowNow.siblings("td").eq(3).html("<input type='text' value='"+$(this).text()+"'>");
                            $source.html("确定");
                        }else if($source.html() == "确定"){
                            update({
                                id:rowNow.children('td').eq(0).html(),
                                name:rowNow.children('td').eq(1).html(),
                                position:rowNow.children('td').eq(2).html(),
                                department:rowNow.children('td').eq(3).html()
                            });
                        }
                    });
                    $('#userTable').append($template);
                };
                
                // 往页码块里面填数字(不足5个就隐藏多出来的)
                $('#pagination').empty();
                var $pageNum = $($('#solidUlTemplate').html()).clone();
                for(var i = 0; i<5; i++){
                    if(i<pageCount){
                        $pageNum.children('li').children('a.no').eq(i).text(i+1);
                    } else{
                        $pageNum.children('li').children('a.no').eq(i).hide();
                    }
                }
                // 动态识别页容量
                var $select = $pageNum.children('div').children('#pSize');
                if(Number(queryInfo.pageSize) == 10){
                    $select.children().eq(0).attr('selected',true);
                }else if(Number(queryInfo.pageSize) == 20){
                    $select.children().eq(1).attr('selected',true);
                }else if(Number(queryInfo.pageSize) == 50){
                    $select.children().eq(2).attr('selected',true);
                }
                // 显示最大页数
                $pageNum.children('label#pageCountText').text('最大页数:'+pageCount);
                // 到第一页,第一页按钮不可用 到最后一页,最后一页按钮不可用
                if(queryInfo.page == 1){
                    $pageNum.children('li:first').attr("class","disabled");
                }else if(data.pageNow == pageCount){
                    $pageNum.children('li:last').attr("class","disabled");
                }
                
                // 给动态生成的页码链接添加点击事件
                $pageNum.children('li').bind("click",function(event){
                    event = event ? event : window.event; 
                    var source = event.srcElement ? event.srcElement : event.target; 
                    var $source = $(source); 
                    // 跳到第一页
                    if($source.attr("id") == 'firstPage'){
                        query({
                            title: $('#title').val(),
                            description:$('#description').val(),
                            page:1,
                            pageSize:queryInfo.pageSize
                        });
                    // 跳到最后一页
                    } else if($source.attr("id") == 'lastPage'){
                        query({
                            title: $('#title').val(),
                            description:$('#description').val(),
                            page:pageCount,
                            pageSize:queryInfo.pageSize
                        });
                    // 上一页
                    } else if($source.attr("id") == 'pre'){
                        if(data.pageNow != 1){
                            query({
                                title: $('#title').val(),
                                description:$('#description').val(),
                                page:data.pageNow-1,
                                pageSize:queryInfo.pageSize
                            });
                        }
                    // 下一页
                    } else if($source.attr("id") == 'next'){
                        if(data.pageNow != pageCount){
                            query({
                                title: $('#title').val(),
                                description:$('#description').val(),
                                page:data.pageNow+1,
                                pageSize:queryInfo.pageSize
                            });
                        }
                    // 根据点击的页码跳到相应页
                    } else {
                        query({
                            title: $('#title').val(),
                            description:$('#description').val(),
                            page:parseInt($source.text()),
                            pageSize:queryInfo.pageSize
                        });
                    }
                });
                
                // 给页容量添加change事件
                $select.change(function(event){
                    event = event ? event : window.event; 
                    var source = event.srcElement ? event.srcElement : event.target; 
                    var $source = $(source);
                    queryInfo.pageSize = parseInt($source.find("option:selected").text());
                    query({
                        title: $('#title').val(),
                        description:$('#description').val(),
                        pageSize:parseInt($source.find("option:selected").text())
                    });
                });
                
                
                // 将内容添加到页面
                $('#pagination').append($pageNum);
            } else {
                $('#pagination').empty();
                $('#userTable tbody').empty();
                $('#pagination').append("<tr><td>当前页没有信息</td></tr>");
            }
            // 点击完之后将当前页码放到页码排序中间(总页数必须超过5,如果右边没有2个,或者左边没有两个了才变动)
            if(pageCount > 5 && queryInfo.page >= 3){
                if( queryInfo.page <= pageCount-2){
                    $('#1').text(queryInfo.page-2);
                    $('#2').text(queryInfo.page-1);
                    $('#3').text(queryInfo.page);
                    $('#4').text(queryInfo.page+1);
                    $('#5').text(queryInfo.page+2);
                // 考虑到当前页是总页数-1或者等于总页数的情况
                }else if(queryInfo.page == pageCount-1){
                    $('#1').text(queryInfo.page-3);
                    $('#2').text(queryInfo.page-2);
                    $('#3').text(queryInfo.page-1);
                    $('#4').text(queryInfo.page);
                    $('#5').text(queryInfo.page+1);
                }else if(pageCount>5 && queryInfo.page == pageCount){
                    $('#1').text(queryInfo.page-4);
                    $('#2').text(queryInfo.page-3);
                    $('#3').text(queryInfo.page-2);
                    $('#4').text(queryInfo.page-1);
                    $('#5').text(queryInfo.page);
                }
            }
        }
    });
}



function update(film){
    $.ajax({
        url: "film",
        type: "GET",
        dataType: "json",
        data: queryInfo,
        success: function (data) {
        }
});
}



















        
        
        
        