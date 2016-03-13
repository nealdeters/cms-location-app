(function() {
  "use strict";

  angular.module("app").controller("brandsCtrl", function($scope, $http){
    
    $scope.setup = function(){
        $http.get('/api/v1/brands.json').then(function(response){
            $scope.brands = response.data;
        });
    };

    $scope.sortBy = function(sortAttribute){
        $scope.sortByAttribute = sortAttribute;
        $scope.descending = !$scope.descending;
    };

    window.scope = $scope;

  });

}());