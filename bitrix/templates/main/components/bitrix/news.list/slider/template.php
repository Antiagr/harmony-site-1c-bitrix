<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @global CDatabase $DB */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var CBitrixComponent $component */
$this->setFrameMode(true);
?>
<!-- Карусель главной страницы -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	 <!-- Indicators -->
	<ol class="carousel-indicators">
	<?$i = 0;?>
<?foreach($arResult["ITEMS"] as $arItem):?>
		<li data-target="#carousel-example-generic" data-slide-to="<?=$i;?>" <?if($i == 0):?> class="active"<?endif;?>></li>
		<?$i++;?>
<?endforeach;?>
	</ol>
	 <!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">

<?$ii = 0;?>
<?foreach($arResult["ITEMS"] as $arItem):?>
	<?
	$this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
	$this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
	?>
		<div class="item<?if($ii == 0):?> active<?endif;?>">
 <img src="<?=$arItem['DETAIL_PICTURE']['SRC'];?>">
			<div class="carousel-caption">
			</div>
		</div>
	<?$ii++;?>
<?endforeach;?>
	</div>
	 <!-- Controls --> <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <span class="sr-only">Предыдущий</span> </a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <span class="sr-only">Следующий</span> </a>
</div>
<!-- Конец карусели -->