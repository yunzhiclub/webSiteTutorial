<script type="text/javascript">
console.log(app);
app.controller("index", function($scope, $http, $timeout) {
    $scope.info = '';

    $scope.students = [
        <?php
            foreach($users as $user)
            {
                echo json_encode($user) . ',';
            }
        ?>
    ];

    $scope.submitScore = function (student)
    {
        var url = '{:U("submitScoreAjax")}';
        $http.get(url, {params:{studentId:student.id, score:student.score}})
        .success(function(res){
            $scope.info = '操作成功';
            $timeout(function() {
                $scope.info = '';
            }, 1500);
        })
        .error(function(res){
            $scope.info = '网络错误';
            $timeout(function() {
                $scope.info = '';
            }, 3000);
        });
    };
});
</script>
