<!DOCTYPE html>
<html class="no-js" ng-app="adminApp">
    
    <head>
        <title>Admin Home Page</title>
        <!-- Bootstrap -->
        <{include file='Frontend/css.tpl'}>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body ng-controller="bodyCtrl" ng-init="bodyinit()">
		<{*navbar*}>
		<{include file='Frontend/navbar.tpl'}>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" >
						<li  ng-repeat="od in orders_count" ng-show="od.o_status !=4" >
							<a href="/#!/?status={{od.o_status}}">
								<span  class="badge pull-right" ng-class="od.o_status =='1'?'badge-important':''" ng-model="od.total" ng-bind="od.total"></span> 
								{{od.os_name}}
							</a>
						</li>
					</ul>
                </div>
				<div class="span10" id="content">
				<div class="row-fluid">
					<div class="alert alert-error alert-block" ng-show="newOrderCount >0">
						<h4 class="alert-heading">Orders Come !</h4>
						<p>you have new orders</p>
					</div>
				</div>
                <!--/span-->
				<{if $content !=""}>
					<{include file=$content}>
				<{/if}>
				<ng-view></ng-view>
				</div>
            </div>
            <hr>
			<{*footer*}>
			<{include file='Frontend/footer.tpl'}>
        </div>
        <!--/.fluid-container-->
		<{include file='Frontend/js.tpl'}>
    </body>

</html>