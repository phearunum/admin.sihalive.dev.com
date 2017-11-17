<div class="span12" id="content" ng-controller="ordersCtrl" ng-init="ordersDetail()">
	<input type="hidden" ng-model="o_id" ng-init="o_id='<{$o_id}>'">
	<div class="row-fluid">
		<!-- block -->
		<div class="block">
			<div class="block-content collapse in">
				<div class="span12">
					<table class="table table-hover">
					  <thead>
						<tr>
						  <th>o_id</th>
						  <th>od_item_index</th>
						  <th>f_name</th>
						  <th>od_num</th>
						  <th>od_price</th>
						  <th>datetime</th>
						  <th>action</th>
						</tr>
					  </thead>
					  <tbody>
						<tr  ng-repeat="detail in details">
						  <td>
							{{detail.o_id}}
						  </td>
						  <td>{{detail.od_item_index}}</td>
						  <td>
							<span ng-if="order.u_name !=NULL" >u_name : {{order.u_name}}<br></span>
							<span ng-if="order.u_email !=NULL" >u_email : {{order.u_email}}<br></span>
							<span ng-if="order.fb_u_id !=NULL" >fb_u_id : {{order.fb_u_id}}</span>
						  </td>
						  <td>{{order.o_datetime}}</td>
						  <td>{{order.o_status}}</td>
						  <td></td>
						  <td>
							<a href="/Order/detail/{{order.o_id}}"><i class="icon-cog"></i></a>
						  </td>
						</tr>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /block -->
	</div>
</div>