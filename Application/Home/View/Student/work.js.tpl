<script type="text/javascript">
var app = angular.module('app', ['ngFileUpload']);
app.controller("workCtrl", function($scope, Upload, $http) {
    $scope.submit = function() {
        $scope.upload($scope.file);
    };

    $scope.attachment_id = '{$work['attachment_id']}';
    $scope.show = 1;
    $scope.index = {
        "html":''
    };

    // upload on file select or drop
    $scope.upload = function(file) {
        Upload.upload({
            url: '{:U("upload/uploadHtml")}',
            data: {
                'yunzhifile': file
            }
        }).then(function(resp) {
            console.log(resp);
            $scope.attachment_id = resp.data.id;
            if (resp.data.state == "SUCCESS") {
                // Simple GET request example:
                $http({
                    method: 'GET',
                    url: '{:U("getTextByAttachmentId")}?id='+resp.data.id
                }).then(function successCallback(response) {
                    $scope.index.html = response.data.data;
                    $scope.show = 0;
                    console.log(response);
                }, function errorCallback(response) {
                    console.log(response);
                });
            }

        }, function(resp) {
            console.log('Error status: ' + resp.status);
        }, function(evt) {
            console.log(evt);
            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
            // console.log('progress: ' + progressPercentage + '% ' + evt.config.data.yunzhifile.name);
        });
    };
});
</script>
