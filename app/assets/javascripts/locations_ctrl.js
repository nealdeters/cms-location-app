(function() {
  "use strict";

  angular.module("app").controller("locationsCtrl", function($scope, $http){
    
    $scope.setup = function(){
        $http.get('/api/v1/locations.json?brand_id=' + window.brandId).then(function(response){
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