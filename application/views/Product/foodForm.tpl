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
                <div class="span10" id="content" ng-controller="foodEditCtrl" >
                    <div class="row-fluid"  >
                        <div class="row-fluid">
                        <!-- block -->
							<div class="block">
								<div class="navbar navbar-inner block-header">
									<div class="muted pull-left"><{$action}></div>
								</div>
								<div class="block-content collapse in">
									<div class="span12">
										<form class="form-horizontal" action="/Product/do<{$action|capitalize:true}>" method="post" enctype="multipart/form-data">
											<fieldset>
												<legend>Food</legend>
												<div class="control-group">
													<label class="control-label" for="typeahead">Food Name<span class="required">*</span> </label>
													<div class="controls">
														<input type="text" maxlength="50" class="span4" name="f_name" required ng-model="food.f_name" placeholder="Key In Food Name">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="textarea2">Food Description<span class="required">*</span> </label>
													<div class="controls">
														<textarea class="input-xlarge textarea" name="f_description" required placeholder="Enter text ..." style="width: 810px; height: 200px"  ng-model="food.f_description" ></textarea>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Food Category<span class="required">*</span></label>
													<div class="controls">
														<select required name="ca_id"  class="span2 m-wrap"  ng-model="ca_id_selected" ng-options="category.ca_id as category.ca_name for category in food.category_list track by category.ca_id"  ></select>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Food Large Price</label>
													<div class="controls">
														$<input type="number" required name="f_large_price" ng-init="food.f_large_price = 1.00;" step="0.1" min="1.00" required class="span1"  ng-model="food.f_large_price" >
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Food Medium Price</label>
													<div class="controls">
														$<input type="number"  required name="f_medium_price" ng-init="food.f_medium_price = 1.00;" step="0.1" min="1.00" required class="span1"  ng-model="food.f_medium_price" >
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Food Small Price</label>
													<div class="controls">
														$<input type="number" required name="f_small_price" ng-init="food.f_small_price = 1.00;" step="0.1" min="1.00" required class="span1"  ng-model="food.f_small_price" >
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Food Category<span class="required">*</span></label>
													<div class="controls">
														<select class="span2 m-wrap" required  name="f_status" ng-model="f_status_selected"  ng-options="status.value as status.name  for status in status_list track by status.value"  >
														</select>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="fileInput">310*260 Food Image </label>
													<div class="controls">
														<div class="uploader" id="uniform-fileInput">
															<input  class="input-file uniform_on" name="images" id="fileInput" type="file">
															<span class="filename" style="user-select: none;">No file selected</span>
															<span class="action" style="user-select: none;">Choose File</span>
														</div>
														<p class="help-block">main menu image</p>
														<img  alt="310*260" style="width: 310px; height: 260px;" ng-src="<{$config.food_url}>/images/food/{{food.ca_id}}-{{food.f_id}}-310x260.png">
													</div>
												</div>
												<div class="form-actions">
													<button type="submit" class="btn btn-primary">Save changes</button>
												</div>
											</fieldset>
											<input name="f_id" type="hidden"   ng-model="food.f_id" ng-bind="food.f_id" value="{{food.f_id}}">
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
			var action ='<{$action}>';
			
		</script>
        <!--/.fluid-container-->
		<{include file='Frontend/js.tpl'}>
		<script>
			$(function() {
				$(".uniform_on").uniform();
			});
		</script>
    </body>
</html>