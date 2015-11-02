<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,700' rel='stylesheet' type='text/css'>

<link rel="stylesheet"  href="catalog/view/theme/<?php echo $theme_path; ?>/js/fancybox/jquery.fancybox.css" media="screen" />
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/photoswipe.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/magnificent.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/material-design.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/stylesheet.css" rel="stylesheet">

<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/fancybox/jquery.fancybox.js"></script>
<!--Green Sock-->
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/greensock/jquery.gsap.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/greensock/TimelineMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/greensock/TweenMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/greensock/jquery.scrollmagic.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>



<!--custom script-->
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/device.min.js" type="text/javascript"></script>
<!--[if lt IE 9]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]-->
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<p id="gl_path" class="hidden"><?php echo $theme_path;?></p>
<!-- swipe menu -->
<div class="swipe">
    <div class="swipe-menu">
        <ul>

            <li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i><span><?php echo $text_account; ?></span></a></li>
            <?php if ($logged) { ?>
                
                <li><a href="<?php echo $logout; ?>"><i class="fa fa-unlock"></i><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
                <li><a href="<?php echo $login; ?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a></li>
            <?php } ?>


        </ul>
        <?php if ($maintenance == 0){ ?>
            <ul class="foot">

            </ul>
        <?php } ?>

    </div>
</div>
<div id="page">
<div class="shadow"></div>
<div class="toprow-1">
	<a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
</div>

<header class="header">
	<div class="container">
		<div id="logo" class="logo">
			<?php if ($logo) { ?>
			<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			<?php } ?>
		</div>

		<div class="pull-right">



		<?php //echo $cart; ?>

		<div class="button-account toggle-wrap">
			<span class="toggle material-design-user157"  type="button"></span>
			<div class="toggle_cont pull-right">
				<?php if ($logged) { ?>
				<ul class="list-unstyled">


					<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
				</ul>
				<?php } else { ?>
				<ul class="list-unstyled">
					<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>

				</ul>
				<?php } ?>
			</div>
		</div>

		<?php //echo $search; ?>

		</div>

	</div>
	
	
	
<?php if($top_admin) { ?>	
	
<div class="container">
	<div id="menu-gadget" class="menu-gadget">
	<div id="menu-icon" class="menu-icon">STAFF</div>
	<ul class="menu">
	<li>
		<a href="javascript:;" >PP Team</a>	
		<ul>
			<li>
				<a href="index.php?route=account/address&staff_id=6">Cody Lui</a>
			<li>
				<a href="index.php?route=account/address&staff_id=7">Daniel Fong</a>
			</li>
			<li>
				<a href="index.php?route=account/address&staff_id=5">Dante Cheung</a>
			</li>
				<li>
				<a href="index.php?route=account/address&staff_id=4">Heidi Cheuk</a>
			</li>
				<li>
				<a href="index.php?route=account/address&staff_id=3">Joe Man</a>
			</li>
			<li>
				<a href="index.php?route=account/address&staff_id=8">Livia Kwong</a>
			</li>
			<li>
				<a href="index.php?route=account/address&staff_id=11">Oscar Cheung</a>
			</li>
			<li>
				<a href="index.php?route=account/address&staff_id=9">Xavier Fung</a>
			</li>
		</ul>
	</li>
	</ul>
	</div>
</div>
	
	
<div id="tm_menu" class="nav__primary">
<div class="container">
<ul class="menu">
<li>
<a href="javascript:;" >Staff</a>
<ul>
    <li>
        PP Team
        <ul>
            <li>
            	<a href="index.php?route=account/address&staff_id=6">Cody Lui</a>
            <li>
            	<a href="index.php?route=account/address&staff_id=7">Daniel Fong</a>
            </li>
            <li>
            	<a href="index.php?route=account/address&staff_id=5">Dante Cheung</a>
            </li>
			 <li>
            	<a href="index.php?route=account/address&staff_id=4">Heidi Cheuk</a>
            </li>
			 <li>
            	<a href="index.php?route=account/address&staff_id=3">Joe Man</a>
            </li>
			 <li>
            	<a href="index.php?route=account/address&staff_id=8">Livia Kwong</a>
            </li>
			<li>
				<a href="index.php?route=account/address&staff_id=11">Oscar Cheung</a>
			</li>
			 <li>
            	<a href="index.php?route=account/address&staff_id=9">Xavier Fung</a>
            </li>
			 
        </ul>
    </li>
</ul>
</li>
</ul>
<div class="clear"></div>
</div>
</div>


<script type="text/javascript">
		jQuery(window).load(function () {
		if ($('body').width() > 767) {
			$('#tm_menu').TMStickUp({})

		}});
</script>

<?php } ?>
</header>
