<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html ng-app="myApp">
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0-rc.3/angular.js"></script>
</head>
<body>

  <h1>Demo 1:</h1>
  <input type="text" ng-model="someProperty" placeholder="Type to Enable">
  <button ng-model="button" ng-disabled="!someProperty">A Button</button>

  <h1>Demo 2:</h1>
  <textarea ng-disabled="isDisabled">Wait 1 second</textarea>

  <script>
    // JS for demo 2:
    angular.module('myApp', [])
    .run(function($rootScope, $timeout) {
      $rootScope.isDisabled = true;
      $timeout(function() {
        $rootScope.isDisabled = false;
      }, 1000);
    });
  </script>

</body>
</html>