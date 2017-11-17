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
    
    <body ng-controller="bodyCtrl">
		<{*navbar*}>
		<{include file='Frontend/navbar.tpl'}>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2" id="sidebar">
                    <{include file='Frontend/sidebar.tpl'}>
                </div>
                <!--/span-->
				<{*
				<div class="row-fluid">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<h4>Success</h4>
						The operation completed successfully
					</div>
					<div class="navbar">
						<div class="navbar-inner">
							<ul class="breadcrumb">
								<i class="icon-chevron-left hide-sidebar"><a href="#" title="Hide Sidebar" rel="tooltip">&nbsp;</a></i>
								<i class="icon-chevron-right show-sidebar" style="display:none;"><a href="#" title="Show Sidebar" rel="tooltip">&nbsp;</a></i>
								<li>
									<a href="#">Dashboard</a> <span class="divider">/</span>	
								</li>
								<li>
									<a href="#">Settings</a> <span class="divider">/</span>	
								</li>
								<li class="active">Tools</li>
							</ul>
						</div>
					</div>
				</div>
				*}>
				<{include file=$content}>
            </div>
            <hr>
			<{*footer*}>
			<{include file='Frontend/footer.tpl'}>
        </div>
        <!--/.fluid-container-->
		<{include file='Frontend/js.tpl'}>
    </body>

</html>