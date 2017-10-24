<!DOCTYPE html>
<html class="no-js">
    
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
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Users</div>
                                    <div class="pull-right">
										<span class="badge badge-info">1,234</span>
                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Vincent</td>
                                                <td>Gabriel</td>
                                                <td>@gabrielva</td>
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