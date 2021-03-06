<?if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();?><?
include(GetLangFileName(dirname(__FILE__)."/", "/payment.php"));

$psTitle = GetMessage("SPCP_DTITLE");
$psDescription = GetMessage("SPCP_DDESCR");
$arPSCorrespondence = array(
		"SHOP_ID" => array(
				"NAME" => GetMessage("SHOP_ID"),
				"DESCR" => GetMessage("SHOP_ID_DESCR"),
				"VALUE" => "",
				"TYPE" => ""
			),
		"SCID" => array(
				"NAME" => GetMessage("SCID"),
				"DESCR" => GetMessage("SCID_DESCR"),
				"VALUE" => "",
				"TYPE" => ""
			),
		"SHOP_KEY" => array(
				"NAME" => GetMessage("SHOP_KEY"),
				"DESCR" => GetMessage("SHOP_KEY_DESCR"),
				"VALUE" => "",
				"TYPE" => ""
			),
		"ORDER_ID" => array(
				"NAME" => GetMessage("ORDER_ID"),
				"DESCR" => GetMessage("ORDER_ID_DESCR"),
				"VALUE" => "ID",
				"TYPE" => "ORDER"
			),
		/*"USER_ID" => array(
				"NAME" => GetMessage("USER_ID"),
				"DESCR" => GetMessage("USER_ID_DESCR"),
				"VALUE" => "",
				"TYPE" => ""
			),
		*/
		"ORDER_DATE" => array(
				"NAME" => GetMessage("ORDER_DATE"),
				"DESCR" => GetMessage("ORDER_DATE_DESCR"),
				"VALUE" => "DATE_INSERT_DATE",
				"TYPE" => "ORDER"
			),
		"SHOULD_PAY" => array(
				"NAME" => GetMessage("SHOULD_PAY"),
				"DESCR" => GetMessage("SHOULD_PAY_DESCR"),
				"VALUE" => "PRICE",
				"TYPE" => "ORDER"
			),
		"CHANGE_STATUS_PAY" => array(
				"NAME" => GetMessage("PYM_CHANGE_STATUS_PAY"),
				"DESCR" => GetMessage("PYM_CHANGE_STATUS_PAY_DESC"),
				"VALUE" => "Y",
				"TYPE" => ""
			),
		"PAYMENT_VALUE" => array(
				"NAME" => GetMessage("SALE_TYPE_PAYMENT"),
				"DESCR" => "",
				"TYPE" => "SELECT",
				"VALUE" => array(
					"PC" => array(
						"NAME" => GetMessage("SALE_YMoney"),
					),
					"AC" => array(
						"NAME" => GetMessage("SALE_YCards"),
					),
					"GP" => array(
						"NAME" => GetMessage("SALE_YTerminals"),
					),
					"MC" => array(
						"NAME" => GetMessage("SALE_YMobile")
					),
					"WM" => array(
						"NAME" => "WebMoney"
					),
					"SB" => array(
						"NAME" => GetMessage("SALE_YSberbank")
					),
					"MP" => array(
						"NAME" => GetMessage("SALE_YmPOS")
					),
					"AB" => array(
						"NAME" => GetMessage("SALE_YAlphaClick")
					),
					"MA" => array(
						"NAME" => GetMessage("SALE_YMasterPass")
					),
					"PB" => array(
						"NAME" => GetMessage("SALE_YPromsvyazbank")
					)
			),
		),
		"IS_TEST" => array(
				"NAME" => GetMessage("IS_TEST"),
				"DESCR" => GetMessage("IS_TEST_DESCR"),
				"VALUE" => "Y",
				"TYPE" => ""
			),
	);
?>