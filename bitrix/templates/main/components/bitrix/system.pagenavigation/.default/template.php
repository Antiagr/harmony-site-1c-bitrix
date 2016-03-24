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

if(!$arResult["NavShowAlways"])
{
	if ($arResult["NavRecordCount"] == 0 || ($arResult["NavPageCount"] == 1 && $arResult["NavShowAll"] == false))
		return;
}

$strNavQueryString = ($arResult["NavQueryString"] != "" ? $arResult["NavQueryString"]."&amp;" : "");
$strNavQueryStringFull = ($arResult["NavQueryString"] != "" ? "?".$arResult["NavQueryString"] : "");
?>
<nav class="text-center">
	 

<ul class="pagination">

<?if($arResult["bDescPageNumbering"] === true):?>


	<?if ($arResult["NavPageNomer"] < $arResult["NavPageCount"]):?>
		<?if($arResult["bSavePage"]):?>
			<li><a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=($arResult["NavPageNomer"]+1)?>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
		<?else:?>
			<?if ($arResult["NavPageCount"] == ($arResult["NavPageNomer"]+1) ):?>
				<li><a href="<?=$arResult["sUrlPath"]?><?=$strNavQueryStringFull?>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			<?else:?>
				<li><a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=($arResult["NavPageNomer"]+1)?>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			<?endif?>
		<?endif?>
	<?else:?>
		<li class="active">
		  <a href="#" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
		  </a>
		</li>
	<?endif?>

	<?while($arResult["nStartPage"] >= $arResult["nEndPage"]):?>
		<?$NavRecordGroupPrint = $arResult["NavPageCount"] - $arResult["nStartPage"] + 1;?>

		<?if ($arResult["nStartPage"] == $arResult["NavPageNomer"]):?>
			<li><a href="#" aria-label="Next"><span aria-hidden="true"><?=$NavRecordGroupPrint?></span></a></li>
		<?elseif($arResult["nStartPage"] == $arResult["NavPageCount"] && $arResult["bSavePage"] == false):?>
			<li><a href="<?=$arResult["sUrlPath"]?><?=$strNavQueryStringFull?>"><?=$NavRecordGroupPrint?></a>
		<?else:?>
			<li><a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=$arResult["nStartPage"]?>"><?=$NavRecordGroupPrint?></a>
		<?endif?>

		<?$arResult["nStartPage"]--?>
	<?endwhile?>


	<?if ($arResult["NavPageNomer"] > 1):?>
		<li><a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=($arResult["NavPageNomer"]-1)?>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	<?else:?>
		<li>
		  <a href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		  </a>
		</li>
	<?endif?>

<?else:?>

	<?if ($arResult["NavPageNomer"] > 1):?>

		<?if($arResult["bSavePage"]):?>
	<li>
	  <a href="#" aria-label="Previous">
		<span aria-hidden="true">&laquo;</span>
	  </a>
	</li>
			<li><a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=($arResult["NavPageNomer"]-1)?>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
		<?else:?>
			<?if ($arResult["NavPageNomer"] > 2):?>
				<li><a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=($arResult["NavPageNomer"]-1)?>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			<?else:?>
				<li><a aria-label="Previous" href="<?=$arResult["sUrlPath"]?><?=$strNavQueryStringFull?>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			<?endif?>
		<?endif?>

	<?else:?>
		<li class="active">
		  <a href="#" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
		  </a>
		</li>
	<?endif?>

	<?while($arResult["nStartPage"] <= $arResult["nEndPage"]):?>

		<?if ($arResult["nStartPage"] == $arResult["NavPageNomer"]):?>
			<li class="active"><a href="#"><?=$arResult["nStartPage"]?></a></li>
		<?elseif($arResult["nStartPage"] == 1 && $arResult["bSavePage"] == false):?>
			<li><a href="<?=$arResult["sUrlPath"]?><?=$strNavQueryStringFull?>"><?=$arResult["nStartPage"]?></a></li>
		<?else:?>
			<li><a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=$arResult["nStartPage"]?>"><?=$arResult["nStartPage"]?></a></li>
		<?endif?>
		<?$arResult["nStartPage"]++?>
	<?endwhile?>

	<?if($arResult["NavPageNomer"] < $arResult["NavPageCount"]):?>
		<li>
		  <a href="<?=$arResult["sUrlPath"]?>?<?=$strNavQueryString?>PAGEN_<?=$arResult["NavNum"]?>=<?=($arResult["NavPageNomer"]+1)?>" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		  </a>
		</li>
	<?else:?>
		<li class="active">
		  <a href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		  </a>
		</li>
	<?endif?>


<?endif?>

  </ul>

</nav>