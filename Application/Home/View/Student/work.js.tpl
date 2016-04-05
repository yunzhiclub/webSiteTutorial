<script type="text/javascript">
var app = angular.module('app', ['ngFileUpload']);
app.controller("workCtrl", function($scope, Upload) {
    $scope.submit = function() {
        $scope.upload($scope.file);
    };

    // upload on file select or drop
    $scope.upload = function (file) {
        Upload.upload({
            url: '{:U("upload/uploadImage")}',
            data: {'yunzhifile':file,'PHPSESSID':getCookie('PHPSESSID')}
        }).then(function (resp) {
            console.log('Success ' + resp.config.data.yunzhifile.name + 'uploaded. Response: ' + resp.data);
            console.log(resp);
        }, function (resp) {
            console.log('Error status: ' + resp.status);
        }, function (evt) {
            console.log(evt);

            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
            console.log('progress: ' + progressPercentage + '% ' + evt.config.data.yunzhifile.name);
        });
    };
});
</script>
