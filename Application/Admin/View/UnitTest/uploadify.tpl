<!DOCTYPE html>
<html>
<head>
    <title></title> 
    <link href="__ROOT__/css/style.css" rel="stylesheet" />
    <!-- Bootstrap Core CSS -->
    <link href="__BOW__/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="__BOW__/jquery/dist/jquery.min.js"></script>
</head>
<body>
    <form method="post" action="">
    <div class="row uploaderTables">
        <div class="col-xs-12">
            <table id="fileInfo" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width="80%">附件</th>
                    <th width="20%">大小</th>
                </tr>
            </table>
        </div>
    </div>
    <html:uploader value="value" name="fileSample" debug="true" type="file" callback="addFileInfo">
        请选择附件
    </html:uploader>

    <html:uploader value="value" name="imageSample" debug="true" type="image" callback="addHtml">
        请选择图片
    </html:uploader>
    
    <html:uploader value="value" name="otherSample" debug="true" type="file" callback="addHtml">
        请选择文件
    </html:uploader>

        <button type="submit">提交</button>
    </form>

    <script type="text/javascript">
        var addFileInfo = function(file, data, response){
            console.log(data);
            var str = '<tr><td><input type="hidden" name="fileList[]" value="'+data.id+'" /><a target="_blank" href="' + data.url + '">'+data.name+'</a>&nbsp;&nbsp;<a href="javascript:void(0);" class="uploaderDelete text-danger"><i class="glyphicon glyphicon-trash"></i></a></td><td>'+parseFloat(data.size).div(1024)+'KB</td></tr>';
            $("#fileInfo").append(str);
            uploaderDeleteClick();  
        };

     /**
     * uploaderDelete监听点击事件
     * @return {[type]} [description]
     */
     var uploaderDeleteClick = function() {
         $(".uploaderDelete").each(function() {
             this.addEventListener("click", function() {           
                $(this).parent().parent().remove();
                 //记录当前附件ID值
                 console.log(file.val());
             })
         });
     }   
    </script>
    <!--uploadify-->
    <js href="__ROOT__/lib/uploadify/jquery.uploadify.min.js" />
    <js href="__ROOT__/js/js.js" />
</body>
</html>
