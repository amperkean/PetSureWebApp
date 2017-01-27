(function () {
    angular.module("app", [])
    .controller("PetsController", myControllerFunction);

    myControllerFunction.$inject = ["$scope", "$http"];

    function myControllerFunction($scope, $http) {
        $http.get('http://localhost:55434/api/pets/getpets').
            success(function (data, status, headers, config) {
                console.log('asdf');
                $scope.pets = data;
            }).
            error(function (data, status, headers, config) {
                console.log('error');
                console.log(data);
            });
        $scope.updateText = function () {
            //$scope.updateLabel = 
            // use $scope.selectedItem.code and $scope.selectedItem.name here
            // for other stuff ...
        }
    };

})();