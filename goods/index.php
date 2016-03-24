<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("������");
?>
<?$APPLICATION->IncludeComponent("bitrix:news.list", "brands", Array(
	"IBLOCK_TYPE" => "catalog",	// ��� ��������������� ����� (������������ ������ ��� ��������)
		"IBLOCK_ID" => "2",	// ��� ��������������� �����
		"NEWS_COUNT" => "1000",	// ���������� �������� �� ��������
		"SORT_BY1" => "ACTIVE_FROM",	// ���� ��� ������ ���������� ��������
		"SORT_ORDER1" => "DESC",	// ����������� ��� ������ ���������� ��������
		"SORT_BY2" => "SORT",	// ���� ��� ������ ���������� ��������
		"SORT_ORDER2" => "ASC",	// ����������� ��� ������ ���������� ��������
		"FILTER_NAME" => "",	// ������
		"FIELD_CODE" => array(	// ����
			0 => "",
			1 => "",
		),
		"PROPERTY_CODE" => array(	// ��������
			0 => "PARTNER",
			1 => "LINK",
			2 => "",
		),
		"CHECK_DATES" => "Y",	// ���������� ������ �������� �� ������ ������ ��������
		"DETAIL_URL" => "",	// URL �������� ���������� ��������� (�� ��������� - �� �������� ���������)
		"AJAX_MODE" => "N",	// �������� ����� AJAX
		"AJAX_OPTION_SHADOW" => "Y",
		"AJAX_OPTION_JUMP" => "N",	// �������� ��������� � ������ ����������
		"AJAX_OPTION_STYLE" => "Y",	// �������� ��������� ������
		"AJAX_OPTION_HISTORY" => "N",	// �������� �������� ��������� ��������
		"CACHE_TYPE" => "A",	// ��� �����������
		"CACHE_TIME" => "36000000",	// ����� ����������� (���.)
		"CACHE_FILTER" => "N",	// ���������� ��� ������������� �������
		"CACHE_GROUPS" => "Y",	// ��������� ����� �������
		"PREVIEW_TRUNCATE_LEN" => "",	// ������������ ����� ������ ��� ������ (������ ��� ���� �����)
		"ACTIVE_DATE_FORMAT" => "d.m.Y",	// ������ ������ ����
		"SET_TITLE" => "N",	// ������������� ��������� ��������
		"SET_STATUS_404" => "N",	// ������������� ������ 404, ���� �� ������� ������� ��� ������
		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",	// �������� �������� � ������� ���������
		"ADD_SECTIONS_CHAIN" => "N",	// �������� ������ � ������� ���������
		"HIDE_LINK_WHEN_NO_DETAIL" => "N",	// �������� ������, ���� ��� ���������� ��������
		"PARENT_SECTION" => "",	// ID �������
		"PARENT_SECTION_CODE" => "",	// ��� �������
		"DISPLAY_TOP_PAGER" => "N",	// �������� ��� �������
		"DISPLAY_BOTTOM_PAGER" => "Y",	// �������� ��� �������
		"PAGER_TITLE" => "",	// �������� ���������
		"PAGER_SHOW_ALWAYS" => "N",	// �������� ������
		"PAGER_TEMPLATE" => ".default",	// ������ ������������ ���������
		"PAGER_DESC_NUMBERING" => "N",	// ������������ �������� ���������
		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",	// ����� ����������� ������� ��� �������� ���������
		"PAGER_SHOW_ALL" => "N",	// ���������� ������ "���"
		"DISPLAY_DATE" => "N",	// �������� ���� ��������
		"DISPLAY_NAME" => "Y",	// �������� �������� ��������
		"DISPLAY_PICTURE" => "Y",	// �������� ����������� ��� ������
		"DISPLAY_PREVIEW_TEXT" => "N",	// �������� ����� ������
		"AJAX_OPTION_ADDITIONAL" => "",	// �������������� �������������
		"SET_BROWSER_TITLE" => "Y",	// ������������� ��������� ���� ��������
		"SET_META_KEYWORDS" => "Y",	// ������������� �������� ����� ��������
		"SET_META_DESCRIPTION" => "Y",	// ������������� �������� ��������
		"INCLUDE_SUBSECTIONS" => "Y",	// ���������� �������� ����������� �������
	),
	false
);?>
<div class="container-fluid">
<?$APPLICATION->IncludeComponent(
	"bitrix:main.include", 
	".default", 
	array(
		"AREA_FILE_SHOW" => "sect",
		"AREA_FILE_RECURSIVE" => "Y",
		"AREA_FILE_SUFFIX" => "goods",
		"EDIT_TEMPLATE" => ""
	),
	false
);?>
</div>
<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>