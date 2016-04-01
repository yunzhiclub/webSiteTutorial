<script type="text/javascript">
    app.controller("index",function(){
        //添加文件信息.1是添加图片URL信息，2是添加附件ID信息
        var addFileInfo = function(file, data, response){
              $scope.$apply(function(){
                    console.log(data);
                    // $scope.data.url = data.url;
                    // $scope.data.attachment_id = data.id;

                });
           
            console.log(data);
        };
        var config = {
            "id":"file", 
            "uploader":"{:U('uploadExcel')}", 
            "callback":addFileInfo, 
            "buttonClass":"btn btn-primary btn-sm",
            "debug":false,};
        uploader(config);
    });
</script>