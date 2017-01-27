(function () {
    angular.module("app", [])
    .controller("PetsController", myControllerFunction);

    myControllerFunction.$inject = ["$scope", "$http"];

    function myControllerFunction($scope, $http) {
        var url = 'http://localhost:55434/';
        $http.get( url+'api/pets/getpets').
            success(function (data, status, headers, config) {
                
                $scope.pets = data;
            }).
            error(function (data, status, headers, config) {
                
                console.log(data);
            });
 
    };

})();