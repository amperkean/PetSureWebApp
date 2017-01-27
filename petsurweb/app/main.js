//(function () {
//    'use strict';

//    angular.module('app',['$http']).controller('Main', main,$http);

//    function main() {
//        var vm = this;
//        var url = "http://localhost:55434/api/";
//        //vm.food = 'pizza';
//        console.log('asdf');
//        $http.get(url + 'pets').success(function (data) {
//            console.log(data);
//            vm.pets = data;
//        });
//    }

//})();

var petsModule = angular.module("app", []);
var url = 'http://localhost:58298/api/';

//app.factory('PetsService', function ($http) {
//    var fac = {};
//    fac.GetAllRecords = function () {
//        return $http.get(url+ 'pets');
//    }
//    return fac;
//});
//petsModule.controller('PetsController', function ($scope, $http, PetsService) {
//    PetsService.GetAllRecords().then(function (d) {
//                    $scope.pets = d.data; // Success
//                }, function () {
//                    alert('Error Occured !!!'); // Failed
//                });
//});
petsModule.service("APIService", function ($http) {
    this.getSubs = function () {
        console.log(url + 'pets');
        return $http.get(url + 'contracts/reqtask/c00401');
    }
});
petsModule.controller("PetsController", function ($scope, $http, APIService) {
    console.log('asdf');
    
        getAll();

        function getAll() {
            var servCall = APIService.getSubs();
            servCall.then(function (d) {
                $scope.pets = d.data;
            }, function (error) {
                console.log('error');
                console.log( error);
            })
        }
 
    }
);