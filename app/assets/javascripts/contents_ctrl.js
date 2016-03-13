(function() {
  "use strict";

  angular.module("app").controller("contentsCtrl", function($scope, $http){
    
    $scope.setup = function(){
        $http.get('/api/v1/contents.json?brand_id=' + window.brandId).then(function(response){
            $scope.contents = response.data;
        });
    };

    $scope.sortBy = function(sortAttribute){
        $scope.sortByAttribute = sortAttribute;
        $scope.descending = !$scope.descending;
    };

    window.scope = $scope;

  });

}());