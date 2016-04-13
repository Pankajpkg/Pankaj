<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js">
</script>
<script src="js/angular/ng-jsoneditor.js"></script>
<script src="js/angular/jsoneditor.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jsoneditor.min.css"/>

<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div ng-app="ngApp" ng-controller="ngCtrl">
		<div ng-jsoneditor="onLoad" ng-model="obj.data" options="obj.options"
			style="width: 400px; height: 300px;"></div>

		<button type="button" class="btn btn-primary" ng-click="changeData()">
			<i class="fa fa-check-circle"></i> change data
		</button>

		<button type="button" class="btn btn-primary"
			ng-click="changeOptions()">
			<i class="fa fa-check-circle"></i> change options
		</button>

		<pre>{{pretty(obj.data)}}</pre>

	</div>
	<script>
		var json = {
			"Array" : [ 1, 2, 3 ],
			"Boolean" : true,
			"Null" : null,
			"Number" : 123,
			"Object" : {
				"a" : "b",
				"c" : "d"
			},
			"String" : "Hello World"
		};

		angular
				.module('ngApp', [ 'ng.jsoneditor' ])
				.controller(
						'ngCtrl',
						function($scope) {
							$scope.obj = {
								data : json,
								options : {
									mode : 'tree'
								}
							};
							$scope.onLoad = function(instance) {
								instance.expandAll();
							};
							$scope.changeData = function() {
								$scope.obj.data = {
									foo : 'bar'
								};
							};
							$scope.changeOptions = function() {
								$scope.obj.options.mode = $scope.obj.options.mode == 'tree' ? 'code'
										: 'tree';
							};

							//other
							$scope.pretty = function(obj) {
								return angular.toJson(obj, true);
							}
						});
	</script>
</body>
</html>

