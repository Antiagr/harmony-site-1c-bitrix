<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");?>
			<!-- Карусель главной страницы -->	
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			  </ol>

			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/img/Teaser-1.jpg" />
			      <div class="carousel-caption">
			        
			      </div>
			    </div>
			    <div class="item">
			      <img src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/img/Teaser-2.jpg" />
			      <div class="carousel-caption">
			        
			      </div>
			    </div>
			    <div class="item">
			      <img src="/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/img/Teaser-3.jpg" />
			      <div class="carousel-caption">
			        
			      </div>
			    </div>
			    
			  </div>

			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="" aria-hidden="true"></span>
			    <span class="sr-only">Предыдущий</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="" aria-hidden="true"></span>
			    <span class="sr-only">Следующий</span>
			  </a>
			</div>
			<!-- Конец карусели -->	
<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>