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
    
    <body>
		<{*navbar*}>
		<{include file='Frontend/navbar.tpl'}>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2" id="sidebar">
					<{*sidebar*}>
                    <{include file='Frontend/sidebar.tpl'}>
                </div>
                <!--/span-->
                <div class="span10" id="content">
                    <div class="row-fluid" ng-controller="tableCtrl">
                        <div class="span12">
                            <!-- block -->
                            <div class="block" >
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">food</div>
                                    <div class="pull-right">
										<a href="/Product/insert" class="icon-plus"></a>
                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <!-- <th>id</th> -->
                                                <th>name</th>
                                                <th>price</th>
                                                <th>status</th>
                                                <th>ca_name</th>
                                                <th>action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="food in foods">
                                                <!-- <td>{{food.f_id}}</td> -->
                                                <td>{{food.f_name}}</td>
                                                <td>
													large_price:{{food.f_large_price}}<br>
													medium_price:{{food.f_medium_price}}<br>
													small_price:{{food.f_small_price}}
												</td>
                                                <td>{{food.f_status}}</td>
                                                <td>{{food.ca_name}}</td>
                                                <td>
													<a href="/Product/editForm/{{food.f_id}}" class="icon-cog"></a>
													<a href="/Product/delFood/{{food.f_id}}" ng-click="del(food.f_id, $event)" class=" icon-remove"></a>
												</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                    </div>
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