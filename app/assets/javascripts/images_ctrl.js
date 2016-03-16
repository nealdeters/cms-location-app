(function() {
  "use strict";

  angular.module("app").controller("imagesCtrl", function($scope, $http){
    
    $scope.setup = function(){
        $http.get('/api/v1/images.json?brand_id=' + window.brandId).then(function(response){
            $scope.images = response.data;
            $scope.descending = !$scope.descending;
        });
    };

    $scope.sortBy = function(sortAttribute){
        $scope.sortByAttribute = sortAttribute;
        $scope.descending = !$scope.descending;
    };

    window.scope = $scope;

  });

}());