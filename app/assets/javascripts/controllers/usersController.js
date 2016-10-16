function UsersController($scope) {
	$scope.name = 'Leah';
  $scope.ugh = "Eli"
}

angular
	.module('app')
  .controller('UsersController',
    UsersController);