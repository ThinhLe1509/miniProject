app.controller("sigup-ctrl", function ($scope, $http) {
	$scope.items = [];
	$scope.cates = [];
	$scope.form = {};



	$scope.initialize = function () {

		$http.get("/rest/sigup").then(resp => {
			$scope.items = resp.data;
			$scope.items.forEach(item => {
				item.createDate = new Date(item.createDate)
			})
		});

	
	}

	$scope.initialize();
    $scope.create = function () {
		var item = angular.copy($scope.form);
		$http.post(`/rest/sigup`, item).then(resp => {
			resp.data.createDate = new Date(resp.data.createDate)
			$scope.items.push(resp.data);
			$scope.reset();
			alert("Đăng kí tài khoản thành công!");
		}).catch(error => {
			alert("Đăng kí thất bại!");
			console.log("Error", error);
		});
	}
});