<!DOCTYPE html>
<html lang="en">
<head>
<title>Semantic Yellow Pages</title>
<script type="text/javascript">
 </script>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>  
<script type="text/javascript" src="js/Myriad_Pro_600.font.js"></script>
<!--[if lt IE 9]>
	<script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script>
	<script type="text/javascript" src="js/html5.js"></script>
<![endif]-->
<!-- addition for tab control -->
<link type="text/css" href="css/custom-theme/jquery-ui-1.8.10.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.10.custom.min.js"></script>
		<script type="text/javascript">
			$(function(){

				// Accordion
				$("#accordion").accordion({ header: "h3" });
	
				// Tabs
				$('#tabs').tabs();
	

				// Dialog			
				$('#dialog').dialog({
					autoOpen: false,
					width: 600,
					buttons: {
						"Ok": function() { 
							$(this).dialog("close"); 
						}, 
						"Cancel": function() { 
							$(this).dialog("close"); 
						} 
					}
				});
				
				// Dialog Link
				$('#dialog_link').click(function(){
					$('#dialog').dialog('open');
					return false;
				});

				// Datepicker
				$('#datepicker').datepicker({
					inline: true
				});
				
				// Slider
				$('#slider').slider({
					range: true,
					values: [17, 67]
				});
				
				// Progressbar
				$("#progressbar").progressbar({
					value: 20 
				});
				
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
			});
		</script>
        <link type="text/css" rel="stylesheet" href="css/suggest.min.css" />

<script type="text/javascript" src="js/suggest.min.js"></script>
			</head>
<body id="page3" onload="init();">
<div class="extra">
	<div class="main">
<!-- header -->
		<header>
			<div class="wrapper">
				<h1><a href="index.jsp" id="logo">SEMANTIC Yellow Pages</a></h1>
				<div class="right">
					<div class="wrapper">
						<form id="search" action="setSession" method="get">
							<div class="bg">
								<input type="submit" class="submit" value=""/>
								<input type="text" name="searchbox" class="input"/>
							</div>
						</form>
					</div>
					<div class="wrapper">
						<nav>
							<ul id="top_nav">
								<li><a href="#">Register</a></li>
								<li><a href="#" id="opener">Log In</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</nav>
					</div>	
				</div>
				
			</div>
			<nav>
				<ul id="menu">
					<li><a href="index.jsp" class="nav1">Home</a></li>
					<li><a href="userreg1.jsp" class="nav2">User Profile </a></li>
					<li><a href="servicereg.jsp" class="nav3">Service Profile</a></li>
					<li><a href="test.jsp" class="nav4">About</a></li>
					<li class="end"><a href="Contacts.html" class="nav5">Contacts</a></li>
				</ul>
			</nav>
			
			<div class="text">
				<h2 style="color: #2f82c8">Semantic Yellow Pages</h2>
				<p>Semantic Yellow Pages is a user centric search engine which is aimed at providing fast results relavant to the current user according to his preferences and lifestyle ! In other words its just customized for you !
				</p>
			
			</div>
			
			<div class="img"><br/><br/><img src="images/semanticlogo.jpg" height='300px' width='347px' alt="" /></div>
		</header><br/>
		<section id="content">
		<iframe src="Third.jsp" seamless="seamless" width="960px" height="500px"></iframe>
		</section>
</div>
</div>
</body>
</html>