

var FoodForIdApi ="/Api/foodForIdApi/";
var FoodListApi ="/Api/foodListApi/";



var adminApp = angular.module("adminApp", []);

var foodEditCtrl = function($scope, $http){
	$scope.status_list = [
        {value :'sale_out' , name:'sale_out'},
        {value :'sale_on' , name:'sale_on'},
        {value :'sale_off' , name:'sale_off'}
    ];
	$http({
		method: 'POST',
		url: FoodForIdApi,
		headers: {'Content-Type': 'application/json'},
		data: {f_id:f_id}
	}).then(
		function successCallback(response) {
			if(response['data']['status'] =='100')
			{
				if(action == 'edit')
				{
					$scope.food = response['data']['body']['row'];
					$scope.food['f_large_price'] =  parseFloat($scope.food['f_large_price']);
					$scope.food['f_medium_price'] =  parseFloat($scope.food['f_medium_price']);
					$scope.food['f_small_price'] =  parseFloat($scope.food['f_small_price']);
					$scope.ca_id_selected =  response['data']['body']['row']['category_list'][$scope.food['ca_id']-1];
					var temp= $.grep($scope.status_list, function(e){ return e.value == $scope.food['f_status']; });
					$scope.f_status_selected = temp[0];
				}else
				{
					$scope.food.category_list = response['data']['body']['row']['category_list'];
					$scope.ca_id_selected =  response['data']['body']['row']['category_list'][0];
					$scope.f_status_selected = $scope.status_list[1];
				}
			}else
			{
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
adminApp.controller('foodEditCtrl',  ['$scope', '$http', foodEditCtrl]);





