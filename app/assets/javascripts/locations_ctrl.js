(function() {
  "use strict";

  angular.module("app").controller("locationsCtrl", function($scope, $http){
    
    $scope.setup = function(){
        $http.get('/api/v1/locations.json?brand_id=' + window.brandId).then(function(response){
            $scope.locations = response.data;
            $scope.descending = $scope.descending;
        });
    };

    $scope.sortBy = function(sortAttribute){
        $scope.sortByAttribute = sortAttribute;
        $scope.descending = !$scope.descending;
    };

    window.scope = $scope;

  });

}());