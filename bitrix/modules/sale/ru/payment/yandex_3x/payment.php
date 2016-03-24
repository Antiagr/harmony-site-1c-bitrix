<?if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();?><?

$Sum = CSalePaySystemAction::GetParamValue("SHOULD_PAY");
$ShopID = CSalePaySystemAction::GetParamValue("SHOP_ID");
$scid = CSalePaySystemAction::GetParamValue("SCID");
$customerNumber = CSalePaySystemAction::GetParamValue("ORDER_ID");
$orderDate = CSalePaySystemAction::GetParamValue("ORDER_DATE");
$orderNumber = CSalePaySystemAction::GetParamValue("ORDER_ID");
$paymentType = CSalePaySystemAction::GetParamValue("PAYMENT_VALUE");

$Sum = number_format($Sum, 2, ',', '');
?>
<font class="tablebodytext">
������ ������������� ������ ������-�������� <b>&laquo;������.�����&raquo;</b>.<br /><br />
����� � ������ �� �����: <b><?=$Sum?> �.</b><br />
<br />
</font>
<?if(strlen(CSalePaySystemAction::GetParamValue("IS_TEST")) > 0):
	?>
	<form name="ShopForm" action="https://demomoney.yandex.ru/eshop.xml" method="post" target="_blank">
<?else:
	?>
	<form name="ShopForm" action="https://money.yandex.ru/eshop.xml" method="post">
<?endif;?>
<font class="tablebodytext">
<input name="ShopID" value="<?=$ShopID?>" type="hidden">
<input name="scid" value="<?=$scid?>" type="hidden">
<input name="customerNumber" value="<?=$customerNumber?>" type="hidden">
<input name="orderNumber" value="<?=$orderNumber?>" type="hidden">
<input name="Sum" value="<?=$Sum?>" type="hidden">
<input name="paymentType" value="<?=$paymentType?>" type="hidden">
<input name="cms_name" value="1C-Bitrix" type="hidden">

<!-- <br /> -->
<!-- ������ ������:<br /> -->
<!-- <input name="OrderDetails" value="����� �<?=$orderNumber?> (<?=$orderDate?>)" type="hidden"> -->
<br />
<input name="BuyButton" value="��������" type="submit">

</font><p><font class="tablebodytext"><b>�������� ��������:</b> ���� �� ���������� �� �������, ��� �������� ����� ��� �������� ���������� � �������.</font></p>
</form>