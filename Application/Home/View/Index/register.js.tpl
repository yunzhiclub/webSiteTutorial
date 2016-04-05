<script type="text/javascript">
app.controller("register", function($scope, $http, $window) {
    $scope.error = "";
    $scope.isError = false;
    $scope.student = {
        "id":null,
        "num": "",
        "name": "",
        "password": "",
        "repassword": ""
    };
    $scope.is_register = 1;
    $scope.invalid = true;
    $scope.$watchGroup(['student.password', 'student.repassword'], function() {
        if ($scope.student.password !== "") {
            if ($scope.student.password !== $scope.student.repassword) {
                $scope.invalid = true;
            } else {
                $scope.invalid = false;
            }
        } else {
            $scope.invalid = true;
        }
    });

    $scope.submit = function() {
        $http.post("{:U('Login/submit')}", $scope.student).success(function(response) {
            if (response.status == "SUCCESS")
            {
                $scope.is_register = 0;
                $scope.student.is_visitor = response.is_visitor;
                $scope.student.class = response.class;
                $scope.student.id = response.id;
                $scope.isError = false;
            }
            else
            {
                $scope.isError = true;
                $scope.error = "学号和姓名信息不符或你已完成注册。请检查";
            }
        });
    };

    $scope.register = function(){
        $http({
            "method":"post", 
            "url": "{:U('Login/register')}", 
            "data":$scope.student, 
            "headers":{'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(response) {
                if (response.status === "SUCCESS")
                {
                    $window.location.href = "{:U('index')}";
                }
                else
                {
                    $scope.error = response.message;
                }
        });
    };
});
</script>
