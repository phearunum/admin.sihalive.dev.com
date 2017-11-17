

var FoodForIdApi ="/Api/foodForIdApi/";
var FoodListApi ="/Api/foodListApi/";
var OrderListApi ="/Api/orderList/";
var OrderDetailListApi ="/Api/orderDetailList/";
var UpdateOrderStatusApi ="/Api/updateOrderStatus/";



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
					$scope.food['f_image'] =$scope.food.ca_id+'-'+$scope.food.f_id+'-310x260.png';
					$scope.ca_id_selected =  response['data']['body']['row']['category_list'][$scope.food['ca_id']-1];
				}else
				{
					// $scope.ca_id_selected =  response['data']['body']['row']['category_list'][0];
					// $scope.f_status_selected = $scope.status_list[1];
				}
				$scope.category_list = response['data']['body']['row']['category_list'];
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
	$scope.del = function(f_id, $event){
		if(!confirm('confirm deletion'))
		{
			$event.preventDefault();
		}
	}
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

var ordersCtrl = function($scope, $http)
{
	
	$scope.search = function()
	{
		$scope.search_click = true;
		$scope.ordersList();
	}
	
	$scope.setPage = function(p)
	{
		$scope.p =  p;
		$('input[name=p]').val(p);
		$scope.search();
	}
	
	$scope.reset = function()
	{
		$('input[name=o_datetime_start]').val('');
		$('input[name=o_datetime_end]').val('');
		$('input[name=o_id]').val('');
		$('select[name=o_status]').val('all');
		$scope.ordersList();
		$scope.search_click = false;
	}
	
	$scope.showDetailList = function(obj, index)
	{
		obj.detailShow = true;
		$scope.detail_show= true;
	}	
	
	$scope.hideDetailList = function(obj, index)
	{
		obj.detailShow = false;
		$scope.detail_show= false;
	}
	
	$scope.updateStatus = function(o_id, o_status, original_status)
	{
		if(o_status < original_status)
		{
			if(!confirm("back status ok?"))
			{
				return false;
			}
		}
		
		
		if(o_status -original_status > 1 )
		{
			if(!confirm("more status ok?"))
			{
				return false;
			}
		}
		
		var order = this.order;
		
		if(confirm("update status ok"))
		{
			$http({
			method: 'GET',
			url: UpdateOrderStatusApi+"?o_id="+o_id+"&o_status="+o_status,
			headers: {'Content-Type': 'application/json'},
			}).then(
				function successCallback(response) {
					if(response['data']['status'] =='100')
					{
						order.change_status = false;
						order.original_status = o_status;
					}else
					{
						alert(response['data']['message']);
					}
				}, 
				function errorCallback(response) {
					// 请求失败执行代码
					alert('system error');
				}
			);
		}
	}
	
	$scope.changeStatus = function(obj)
	{
		if(obj.original_status != obj.o_status)
		{
			obj.change_status=true;
			return false;
		}

		obj.change_status=false;
	}
	
	$scope.page_prev = function(p){
		$('input[name=p]').val(p);
		$scope.p = p;
		$scope.search();
	}
	
	$scope.page_next = function(p){
		$('input[name=p]').val(p);
		$scope.p = p;
		$scope.search();
	}
	
	$scope.ordersList= function()
	{
		var getData = $('#frm').serialize()
		$http({
			method: 'GET',
			url: OrderListApi+'?'+getData,
			headers: {'Content-Type': 'application/json'},
		}).then(
			function successCallback(response) {
				if(response['data']['status'] =='100')
				{
					$scope.orders = response['data']['body']['orders'];
					$scope.prev = response['data']['body']['prev'];
					$scope.next = response['data']['body']['next'];
					$scope.order_status = response['data']['body']['order_status'];
					$scope.pages = response['data']['body']['pages'];
				}else
				{
					alert(response['data']['message']);
				}
			}, 
			function errorCallback(response) {
				// 请求失败执行代码
				alert('system error');
			}
		);
	}
	
	$scope.total = function(ary)
	{
		var total = 0;
		angular.forEach(ary, function(value, key) {
			console.log(key + ': ' + value);
			
		});
	}
}

var bodyCtrl = function($scope, $http, MyService)
{

	$scope.init = function()
	{
		
	};

}

adminApp.factory('MyService', ['$q', '$rootScope', function($q, $rootScope) 
{
	var Service = {};
	var url ="";
	var uid ="001";
	// var socket = io('http://websokcet.sihalive.dev.com:2120');
	// var ws = new WebSocket("ws://"+ws_domain+":2120");
	// socket.on('connect', function(){
    	// socket.emit('login', uid);
    // });
	return Service;
}]);
adminApp.controller('tableCtrl',  ['$scope', '$http', tableCtrl]);
adminApp.controller('foodEditCtrl',  ['$scope', '$http', foodEditCtrl]);
adminApp.controller('ordersCtrl',  ['$scope', '$http', ordersCtrl]);
adminApp.controller('bodyCtrl',  ['$scope', '$http', 'MyService', bodyCtrl]);





