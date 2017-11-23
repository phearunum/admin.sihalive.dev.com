<!-- Bootstrap -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
<link href="/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
<link href="/assets/styles.css" rel="stylesheet" media="screen">
<link href="/vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="/vendors/uniform.default.css" rel="stylesheet" media="screen">
<link href="/vendors/chosen.min.css" rel="stylesheet" media="screen">
<link href="/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
<link href="/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css">
<{if $cssArray}>
	<{foreach from=$cssArray item=file}>
		<link rel="stylesheet" href="/css/<{$file}>">
	<{/foreach}>
<{/if}>

