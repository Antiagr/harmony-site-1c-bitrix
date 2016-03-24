        </div>
        
       
      </div>

      

      
    </div> <!-- /container --> 
	
	<!-- Подвал -->	    
    <footer>
		<div class="container">
			<div class="col-md-4"><?$APPLICATION->IncludeComponent(
	"bitrix:main.include", 
	".default", 
	array(
		"AREA_FILE_SHOW" => "sect",
		"AREA_FILE_RECURSIVE" => "Y",
		"AREA_FILE_SUFFIX" => "copyright",
		"EDIT_TEMPLATE" => ""
	),
	false
);?></div>	
			<div class="col-md-4 counter">
      	  		<!-- counter -->
			</div>
			<div class="col-md-4 design">
      	  		<a href="http://www.senator.perm.ru">&copy; Дизайн и разработка сайта:<br />
Имиджевый центр «<span>Сенатор</span>», 2015.</a>
			</div>
		</div>	
    </footer>
	
	
  	<!-- Модальное окно с большой картой -->	

 	 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
   	 <div class="modal-dialog modal-lg">
     	 <div class="modal-content">
			<div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		          <h4 class="modal-title text-center" id="gridSystemModalLabel">Технический центр «Гармония»</h4>
			  </div>
			<div class="large-map" id="largemap">
		
			</div>
			<div class="mapcaption">
				г. Пермь, ул. Пермская, 34
			</div>	
     	 </div>
   	 </div>
  	</div>
  	<!-- Конец модального окна -->
	<!-- Конец подвала -->	
	
	   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/bootstrap.min.js"></script>
  
	   
	   
        <script src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/plugins.js"></script>
        <script src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/main.js"></script>
		
		<!-- Яндекс карты -->					
		<script type='text/javascript' src='http://api-maps.yandex.ru/2.1/?load=package.full&#038;lang=ru-RU&#038;ver=3.9.2'></script>	
		<!-- Карта в сайдбаре -->
 	    <script type="text/javascript">
 	   		//<![CDATA[
 	   		ymaps.ready(VasuMap);
 	   		function VasuMap(){var YMapId = document.getElementById("mapid");var l_YMapId = YMapId.id;var l_YaMap1 = new ymaps.Map(l_YMapId,{center: [58.014325,56.254484], type:'yandex#map', zoom:16, controls:[]},{maxZoom:17, minZoom:0}); var l_collection = new ymaps.GeoObjectCollection();var l_Placemark = new ymaps.Placemark([58.014325,56.254484],{},{preset:"islands#dotIcon",iconColor:"#007330"});
 	   			var x = 'Технический центр «Гармония»'; 
 	   			l_Placemark.properties.set("balloonContent",x)
 	   			l_collection.add(l_Placemark);
 	   			if (l_collection.getLength()>0){
 	   					 l_YaMap1.geoObjects.add(l_collection);
 	   			}
 	   			};
 	   			//]]&gt;
 		</script>
		<!-- Большая карта в модальном окне -->
		<script type="text/javascript">
			//<![CDATA[
			ymaps.ready(VasuMap);
			function VasuMap(){var YMapId = document.getElementById("largemap");var l_YMapId = YMapId.id;var l_YaMap1 = new ymaps.Map(l_YMapId,{center: [58.014325,56.254484], type:'yandex#map', zoom:16, controls:[]},{maxZoom:17, minZoom:0}); var l_collection = new ymaps.GeoObjectCollection();var l_Placemark = new ymaps.Placemark([58.014325,56.254484],{},{preset:"islands#dotIcon",iconColor:"#007330"});
			var x = 'Технический центр «Гармония»'; 
			l_Placemark.properties.set("balloonContent",x)
			l_collection.add(l_Placemark);
			if (l_collection.getLength()>0){
				  	   	l_YaMap1.geoObjects.add(l_collection);
			}
			};
			//]]&gt;
		</script>			
    </body>
</html>
