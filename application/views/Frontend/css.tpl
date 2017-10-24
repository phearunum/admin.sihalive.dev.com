<!-- Bootstrap -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
<link href="/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
<link href="/assets/styles.css" rel="stylesheet" media="screen">


<{if $cssArray}>
	<{foreach from=$cssArray item=file}>
		<link rel="stylesheet" href="css/file">
	<{/foreach}>
<{/if}>
