<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" >
	<li ng-click="selectStatus(od.o_status, od.total)" ng-repeat="od in orders_count" ng-show="od.o_status !=4" >
		<a >
			<span  class="badge pull-right" ng-class="od.o_status =='1'?'badge-important':''" ng-model="od.total" ng-bind="od.total"></span> 
			{{od.os_name}}
		</a>
	</li>
</ul>