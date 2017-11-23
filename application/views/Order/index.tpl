<div class="span10" id="content" ng-controller="ordersCtrl" ng-init="ordersList()">
	<div class="row-fluid">
		<div class="alert alert-error alert-block" ng-show="newOrdersCount >0">
			<h4 class="alert-heading">Orders Come !</h4>
			<p>you have new orders</p>
		</div>
	</div>
	<div class="row-fluid">
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header ">
				<div class="muted pull-left">Orders</div>
			</div>
			<div class="block-content collapse in">
				<form class="form-horizontal" id="frm">
					<div >
						<input name="p" ng-mdeol="p"  ng-init="p=1"  type="hidden" value="1" >
						<span>records per page</span>
						<select size="1" ng-model="records" ng-init="records='10'"  ng-change="search()" style="width:60px;" name="recods" >
							<option value="1" >1</option>
							<option value="10" selected>10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>
						<span>o_status:</span>
						<select name="o_status" ng-change="search()" ng-model="search_status" ng-init="search_status='all'">
							<option value="all">all</option>
							<option value="{{status.os_id}}" ng-repeat="status in order_status">{{status.os_name}}</option>
						</select>
						<span>o_id:</span>
						<input name="o_id" type="input">
						<{*
							<span>datetime_start:</span>
							<input name="o_datetime_start" type="input">
							<span>~datetime_end:</span>
							<input name="o_datetime_end" type="input">
						*}>
						<button class="btn btn-mini" id="search-btn" ng-click="search()">submit</button>
						<input type="reset" ng-click="reset()" ng-show="search_click" ng-model="search_click" ng-init="search_click=false" class="btn btn-mini" value="reset">
					</div>
				</form>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<table class="table  dataTable">
						<thead>
							<tr>
								<th>#</th>
								<th>o_id</th>
								<th>delivery_info</th>
								<th>o_datetime</th>
								<th>o_status</th>
								<th>action</th>
							</tr>
						</thead>
						<tbody ng-repeat-start="order in orders">
						<tr  >
							<td>
								<i ng-show="order.detailShow ==false"  ng-click="showDetailList(order, $index)" class="icon-chevron-down"></i>
								<i ng-show="order.detailShow ==true" ng-click="hideDetailList(order, $index)" class="icon-chevron-up"></i>
							</td>
							<td  align="right">{{order.o_id}}</td>
							<td>
								<span>consignee : {{order.o_consignee}}<br></span>
								<span>phone : {{order.o_phone}}<br></span>
								<span>messge : {{order.o_messge}}<br></span>
								<span ng-if="order.o_position_id !=0">o_position : {{order.p_name}}<br></span>
							</td>
							<td>{{order.o_datetime}}</td>
							<td>
								<select  style="width: 100px" ng-change="changeStatus(order)" ng-model="order.o_status">
									<option   ng-selected="{{status.os_id == order.o_status}}" value="{{status.os_id}}" ng-repeat="status in order_status">{{status.os_name}}</option>
								</select>
								<span ng-model="order.original_status" ng-init="order.original_status = order.o_status">
								</span>
							</td>
							<td>
								<a href="#">
									<i  ng-click="updateStatus(order.o_id, order.o_status, order.original_status)" ng-show="order.change_status" ng-init="order.change_status=false" class="icon-ok"></i>
								</a>
							</td>
						</tr>
						</tbody>
						<tbody ng-repeat-end ng-show="order.detailShow ==true">
							<tr>
								<td></td>
								<td><b>index</b></td>
								<td><b>f_name</b></td>
								<td><b>od_num</b></td>
								<td><b>od_price</b></td>
							</tr>
							<tr ng-repeat="detail in order.details">
								<td></td>
								<td>{{$index+1}}</td>
								<td>{{detail.f_name}}</td>
								<td>{{detail.od_num}}</td>
								<td>${{detail.od_price}}</td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4"><span style="float:right">total:</span></td>
								<td colspan="2">${{order.ol_total}}</td>
							</tr>
						</tr>
						</tbody>
						<{*

						*}>
					</table>
				</div>
				<div class="row">
					<div class="span6">
						<div class="dataTables_info" style="margin-left :32px" id="example_info">Showing 1 to 10 of {{total}} entries</div>
					</div>
					<div class="span6">
						<div class="dataTables_paginate paging_bootstrap pagination">
							<ul>
								<li ng-show="pages" ng-click="page_prev(prev)" class="prev" ng-class="p=='1'?'disabled':''">
									<a href="#">← Previous</a>
								</li>
								<li  ng-click="setPage(page.p)" ng-class=" p  == page.p?'active':''" ng-repeat="page in pages">
									<a href="">{{page.p}}</a>
								</li>
								<li ng-show="pages" ng-click="page_next(next)" class="next" ng-class="p==pages.length?'disabled':''"><a href="#">Next → </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /block -->
	</div>
</div>