<script type="text/javascript">
app.controller("personalCenter", function($scope) {
    $scope.student = {
        "password": "",
        "newpassword": "",
        "image":"{:$M->getUrlByAttachmentId($student['attachment_id'])}",
        "attachment_id":{$student['attachment_id']}
    };
    var addFileInfo = function(file, data, response){
        $scope.$apply(function(){
            $scope.student.attachment_id = data.id;
            $scope.student.image = data.url;
        });
        
        console.log(data);
    };

    var config = {
        "id": "file",
        "uploader": "{:U('upload/uploadImage')}",
        "callback": addFileInfo,
        "buttonClass": "btn btn-primary btn-sm",
        "debug": false,
    };
    uploader(config);
});
</script>
