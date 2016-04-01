<script>
var app = angular.module('user', []);
app.controller('userAdd', function($scope)
{
    $scope.username = "{$user.username}";
    $scope.name = "{$user.name}";
    $scope.phonenumber = "{$user.phonenumber}";
    $scope.regex = "^0?(13[0-9]|15[012356789]|18[0236789]|14[57]|17[7])[0-9]{8}$";
    $scope.email = "{$user.email}";
    $scope.edit = "{:($user ? 1 : 0)}";
});
</script>