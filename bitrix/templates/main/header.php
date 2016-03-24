<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><?$APPLICATION->ShowTitle()?></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" type="image/png" href="favicon.png" />
		<link rel="shortcut icon" href="favicon.png" type="image/png" />
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
		<noscript><link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=cyrillic,latin' rel='stylesheet' type='text/css'></noscript>
	    <link rel="stylesheet" href="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/fontello.css">
	    <!--[if IE 7]><link rel="stylesheet" href="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/fontello-ie7.css"><![endif]-->
        <link rel="stylesheet" href="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/bootstrap.css">
        <link rel="stylesheet" href="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/bootstrap-theme.min.css">
		<?$APPLICATION->ShowHead()?>

        <!--[if lt IE 9]>
            <script src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/html5-3.6-respond-1.4.2.min.js"></script>
        <![endif]-->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/jquery.maskedinput.min.js"></script>
    </head>
    <body>
		<?$APPLICATION->ShowPanel();?>
        <!--[if lt IE 8]>
            <p class="browserupgrade">�� ����������� <strong>�����</strong> ������ ������ ��������. ���������� <a href="http://browsehappy.com/">�������� ���</a> ��� ����������� ����������� ����������� ������.</p>
        <![endif]-->
	
	<!-- ������� ���� -->		
    <nav class="navbar hnav" role="navigation">
      <div class="container">
        <div class="logo-container">
          
		  <div class="logo">
          	<a href="/"><img src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/img/harmony-logo.png"></a>
		  </div>
          
        </div>
		
		<!-- ������ ����������� ���� ��� ���������� -->	
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar" style="color: #000; position: relative; z-index: 99;">
          <span class="sr-only">����</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
		
		<!-- ������������ ������� ����������� ���� -->	
		<div class="menu-container">
        	<div id="navbar" class="navbar-collapse collapse text-right ">
<?$APPLICATION->IncludeComponent("bitrix:menu", ".default", Array(
	"ROOT_MENU_TYPE" => "top",	// ��� ���� ��� ������� ������
		"MENU_CACHE_TYPE" => "A",	// ��� �����������
		"MENU_CACHE_TIME" => "3600",	// ����� ����������� (���.)
		"MENU_CACHE_USE_GROUPS" => "Y",	// ��������� ����� �������
		"MENU_CACHE_GET_VARS" => "",	// �������� ���������� �������
		"MAX_LEVEL" => "1",	// ������� ����������� ����
		"CHILD_MENU_TYPE" => "submenu",	// ��� ���� ��� ��������� �������
		"USE_EXT" => "Y",	// ���������� ����� � ������� ���� .���_����.menu_ext.php
		"DELAY" => "Y",	// ����������� ���������� ������� ����
		"ALLOW_MULTI_SELECT" => "Y",	// ��������� ��������� �������� ������� ������������
	),
	false
);?>
        	</div><!--/.navbar-collapse -->
		</div>	
      </div>
    </nav>

    
	<!-- ����������� ��������� -->	
    <div class="container">
      
      <div class="row">
		<!-- ������ ������� -->	  
        <div class="col-md-4 sidebar">
          	<div class="phones">
<?$APPLICATION->IncludeComponent(
	"bitrix:main.include", 
	".default", 
	array(
		"AREA_FILE_SHOW" => "sect",
		"AREA_FILE_RECURSIVE" => "Y",
		"AREA_FILE_SUFFIX" => "phone",
		"EDIT_TEMPLATE" => ""
	),
	false
);?>
			</div>
			<!-- ����� � �������� -->	 	
			<div class="map" id="mapid">
				
			</div>	
			
			<div class="mapcaption">
				<a href="" data-toggle="modal" data-target=".bs-example-modal-lg">��. ��������, 34 �� �����</a>
			</div>
			
			<!-- ������ ������� -->	 	
			<div class="side-menu">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/status/" class="the-icons span3"><i class="icon-tools"></i>������ � ����������</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked">		
					<li><a href="" class="the-icons span3"><i class="icon-basket-alt"></i>������� �����</a></li>
				</ul>	
				<ul class="nav nav-pills nav-stacked">	
					<li class="text-center"><h4><strong>������-������������:</strong></h4></li>
					<li><a href="" class="the-icons span3"><i class="icon-box"></i>�������<i class="icon-icq online"></i></a></li>
					<li><a href="" class="the-icons span3"><i class="icon-print"></i>������ ����������<i class="icon-icq"></i></a></li>
					<li><a href="" class="the-icons span3"><i class="icon-desktop"></i>������ ������������ �������<i class="icon-icq"></i></a></li>
				</ul>	
			</div>	
			
			
        </div> <!-- ����� �������� -->	
		
		<!-- �������� ���� -->	 
        <div class="col-md-8 mainfield">