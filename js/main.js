

var FoodForIdApi ="/Api/foodForIdApi/";
var FoodListApi ="/Api/foodListApi/";



var adminApp = angular.module("adminApp", []);

var foodCtrl = function($scope, $http){
	$http({
        method: 'POST',
        url: FoodForIdApi,
		headers: {'Content-Type': 'application/json'},
		data: {f_id:f_id}
    }).then(
		function successCallback(response) {
			if(response['data']['status'] =='100')
			{
				console.log(response);
				$scope.food = response['data']['body']['row'];
			}else
			{
				console.log(response);
				alert(response['data']['message']);
			}
        }, 
		function errorCallback(response) {
            // 请求失败执行代码
		}
	); 
}

var tableCtrl = function($scope, $http){
	$http({
        method: 'POST',
        url: FoodListApi,
		headers: {'Content-Type': 'application/json'},
		data: {search :'all'}
    }).then(
		function successCallback(response) {
			if(response['data']['status'] =='100')
			{
				$scope.foods = response['data']['body']['list'];
			}
        }, 
		function errorCallback(response) {
            // 请求失败执行代码
		}
	); 
};


adminApp.controller('tableCtrl',  ['$scope', '$http', tableCtrl]);
adminApp.controller('foodCtrl',  ['$scope', '$http', foodCtrl]);





