<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/vendors/easypiechart/jquery.easy-pie-chart.js"></script>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>


<script src="/assets/form-validation.js"></script>

<script src="/js/main.js?<{$randseed}>"></script>

<script src="/vendors/jquery.uniform.min.js"></script>
<script src="/vendors/chosen.jquery.min.js"></script>
<script src="/vendors/bootstrap-datepicker.js"></script>

<script src="/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
<script src="/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

<script src="/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

<script type="text/javascript" src="/vendors/jquery-validation/dist/jquery.validate.min.js"></script>


<script src="/vendors/datatables/js/jquery.dataTables.min.js"></script>


<script src="/assets/scripts.js"></script>
<script src="/assets/DT_bootstrap.js"></script>
<script src='//cdn.bootcss.com/socket.io/1.3.7/socket.io.js'></script>
<{if $jsArray}>
	<{foreach from=$jsArray item=file}>
		<link rel="stylesheet" href="/js/<{$file}>">
	<{/foreach}>
<{/if}>


        