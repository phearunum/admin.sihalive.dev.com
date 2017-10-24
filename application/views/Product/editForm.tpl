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
                <div class="span10" id="content" ng-controller="foodCtrl" >
                    <div class="row-fluid"  >
                        <div class="row-fluid">
                        <!-- block -->
							<div class="block">
								<div class="navbar navbar-inner block-header">
									<div class="muted pull-left">Edit</div>
								</div>
								<div class="block-content collapse in">
									<div class="span12">
										<form class="form-horizontal">
										  <fieldset>
											<legend>Food</legend>
											<div class="control-group">
											  <label class="control-label" for="typeahead">Food Name </label>
											  <div class="controls">
												<input type="text" class="span6" value="{{food.f_name}}">
											  </div>
											</div>
											<div class="control-group">
											  <label class="control-label" for="textarea2">Food Description</label>
											  <div class="controls">
												<textarea class="input-xlarge textarea" placeholder="Enter text ..." style="width: 810px; height: 200px">{{food.f_description}}</textarea>
											  </div>
											</div>
											<div class="control-group">
											<label class="control-label">Category<span class="required">*</span></label>
											<div class="controls">
												<select class="span6 m-wrap" name="category">
													<option value="">Select...</option>
													<option value="Category 1">Category 1</option>
													<option value="Category 2">Category 2</option>
													<option value="Category 3">Category 5</option>
													<option value="Category 4">Category 4</option>
												</select>
											</div>
											</div>
										  </fieldset>
										</form>

									</div>
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
		<script>
			var f_id = '<{$f_id}>';
		</script>
        <!--/.fluid-container-->
		<{include file='Frontend/js.tpl'}>
    </body>
</html>