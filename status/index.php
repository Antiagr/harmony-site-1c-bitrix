<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("������ � ����������");
?>
<?

if($_SERVER["REQUEST_METHOD"]=="POST")
{
	$arResult = Array();
	if (!$APPLICATION->CaptchaCheckCode($_REQUEST["captcha_word"], $_REQUEST["captcha_sid"]))
	{
	  $arResult['Error']['captha'] = "������� ������� ������� � ��������.";
	}
	else
	{
		$arForm['date'] = str_replace(" ","",$_REQUEST["date"]);
		$arForm['number'] = strtoupper(str_replace(" ","",$_REQUEST["number"]));
		$arForm['fio'] = strtoupper(str_replace(" ","",$_REQUEST["fio"]));
		$arForm['phone'] = str_replace(" ","",$_REQUEST["phone"]);
		$arForm['phone'] = $strWithoutChars = preg_replace('/[^0-9]/', '', $arForm['phone']);
		
		if(empty($arForm["date"])) 
			$arResult['Error']['date'] = "�������� ���� ���������.";
		if(empty($arForm["number"])) 
			$arResult['Error']['number'] = "������� ����� ���������.";
		if(empty($arForm["fio"])) 
			$arResult['Error']['fio'] = "������� ������� ��� �������� �����������.";
		if(empty($arForm["phone"])) 
			$arResult['Error']['phone'] = "������� ����� ��������.";
		if(empty($arResult['Error'])){
			if(preg_match( '~^0?(\d|[0-2]\d|3[0-2])\.0?(\d|1[0-2])\.(\d{4})$~',$arForm["date"],$matches) == false) $arResult['Error']['date'] = "�������� ������ ����.";
			$number_len = mb_strlen($arForm["number"]);
			if(13 < $number_len || $number_len < 9) $arResult['Error']['number'] = "����� ��������� ������ ����  ������ 9-13 ��������.";
			// if(mb_strlen($arForm["fio"]) < 5) $arResult['Error'][] = "����� ��������� ������ ����  ������ 9-13 ��������.";
			if(mb_strlen($arForm["phone"]) < 5) $arResult['Error']['phone'] = "����� �������� ������� ��������.";
		}
		
		//serch in file
		if(empty($arResult['Error'])){
			//read catalog
			if ($handle = opendir($_SERVER['DOCUMENT_ROOT'].'/upload/notissued')) {
				while (false !== ($file = readdir($handle))) { 
					if ($file != "." && $file != "..") { 
						$arFiles[] = $file; 
					} 
				}
				sort($arFiles);
				closedir($handle); 
			}

			$arDate['y'] = mb_substr($arFiles['0'], 0, 4);
			$arDate['m'] = mb_substr($arFiles['0'], 4, 2);
			$arDate['d'] = mb_substr($arFiles['0'], 6, 2);
			$arDate['h'] = mb_substr($arFiles['0'], 9, 2);
			$arDate['s'] = mb_substr($arFiles['0'], 11, 2);
			
			//read read newest file
			$content = file ($_SERVER['DOCUMENT_ROOT'].'/upload/notissued/'.$arFiles['0']); 
			
			foreach ($content as $line) { 
				$arLine = explode (';', $line);
				$err = false;
				if (strripos($arLine['0'], $arForm["date"]) === false) $err = true;
				if (strripos($arLine['1'], $arForm["number"]) === false) $err = true;
				if (strripos($arLine['2'], $arForm["fio"]) === false) $err = true;
				if (strripos($arLine['2'], $arForm["phone"]) === false) $err = true;
				
				if($err == false) $arResult['RESULT'] = $arLine;
			}
			if(!isset($arResult['RESULT'])) $arResult['Error']['none'] = "�� ������ ������� ������ �� �������.";
		}//serch in file
	}
}
?>
<!-- ������ ���������� ���������� ����� -->  
<div class="container-fluid">
<?if(!isset($arResult['RESULT'])):?>
<h4  class="StatusHeader text-center">��� ��������� ���������� � ��������� ������ ������������<br />��������� ��� ���� �����:</h4>
<?elseif(isset($arResult['RESULT'])):?>
<h4  class="StatusHeader text-center">���������� �� ��������� ��:<br /><?=$arDate['y'];?>.<?=$arDate['m'];?>.<?=$arDate['d'];?> <?=$arDate['h'];?>:<?=$arDate['s'];?></h4>
<?endif;?>
<div class="status">	
<?if(!isset($arResult['RESULT'])):?>
<?
if($arResult['Error']['none']){?><p class="err"><?=$arResult['Error']['none'];?></p><?}?>
<?
$captcha_code = htmlspecialchars($APPLICATION->CaptchaGetCode());
?>
<form method="post" name="status">
		<div class="row">
				
				<div class="col-md-12<?if($arResult['Error']['number']) echo" InputError";?>">
					<label>����� ���������:</label>
					
					
					
					<div class="StatusNumber"><input name="number" value="<?=trim($_REQUEST["number"]);?>"><span class="icon-cancel"></span></div>
					<div class="FormComment" role="alert">��������� (�������, ������� � ���������� �� �����)</div>
					<div class="CommentWrong" role="alert">
						<?=$arResult['Error']['number'];?>
					</div>
					
				</div>
		</div>
		
		<div class="row">	
				<div class="col-md-12<?if($arResult['Error']['date']) echo" InputError";?>">
					<label>����:</label>
					
					
					<div class="StatusDate"><input name="date" value="<?=trim($_REQUEST["date"]);?>" id="datepicker"><span class="icon-cancel"></span></div>
					<div class="FormComment" role="alert">��.��.����</div>
					<div class="CommentWrong" role="alert">
						<?=$arResult['Error']['date'];?>
					</div>
					
					
				</div>
		</div>
		
		<div class="row">
				
				<div class="col-md-12<?if($arResult['Error']['fio']) echo" InputError";?>">
					<label>������� ��� �������� �����������:</label>
					
					
					
					<div class="StatusName"><input name="fio" value="<?=trim($_REQUEST["fio"]);?>"><span class="icon-cancel"></span></div>
					<div class="FormComment" role="alert">��� ���������� � ����� ���������<br /> (�������, ������� � ���������� �� �����)</div>
					<div class="CommentWrong" role="alert">
						<?=$arResult['Error']['fio'];?>
					</div>
					
				</div>
		</div>
		
		
		<div class="row">
				
				<div class="col-md-12<?if($arResult['Error']['phone']) echo" InputError";?>">
					<label>����� �������� ��� ������ ���������� ����������:</label>
					
					
					
					<div class="StatusPhone"><input name="phone" value="<?=trim($_REQUEST["phone"]);?>"><span class="icon-cancel"></span></div>
					<div class="FormComment" role="alert">��� ���������� � ����� ���������<br /> (�������, ������� � ���������� �� �����)</div>
					<div class="CommentWrong" role="alert">
						<?=$arResult['Error']['phone'];?>
					</div>
					
				</div>
		</div>
		
		<div class="row">
				
				
				
				<div class="col-md-12<?if($arResult['Error']['captha']) echo" InputError";?>">
					<label>������� ��� � ��������:</label>
					<input type="hidden" name="captcha_sid" value="<?=$captcha_code?>" id='captcha_sid'/>
					<div class="StatusCaptcha"><span id='captcha_container'><img src="/bitrix/tools/captcha.php?captcha_sid=<?=$captcha_code?>" width="180" height="40" alt="CAPTCHA" /></span>
					<a href="#" id="refresh_captcha"><span class="icon-cw"></span></a></div>
					
					<div class="StatusCode"><input name="captcha_word" autocomplete="off"><span class="icon-cancel"></span></div>
					<?if($arResult['Error']['captha']):?>
					<div class="CommentWrong" role="alert">
						������� �������
					</div>
					<?endif;?>
					<div class="FormComment" role="alert">&nbsp;</div>
				</div>
				
				<div class="col-md-12">
					
					
					
					<div class="StatusSubmit">
						<div class="icon-tools">
							<input class=" the-icons span3" type="submit" id="submit" value="������ � ����������">
						</div>
					</div>	
					
				</div>
		</div>	
</form>

<?elseif(isset($arResult['RESULT'])):?>
<table class="STable">
	<tr class="SRow">
		<td class="SCell SDate">
			<label>����</label>
			<?=$arResult['RESULT']['0']?>
		</td>	
		<td class="SCell SNum">
			<label>�����</label>
			<?=$arResult['RESULT']['1']?>
		</td>	
	</tr>
	<tr class="SRow">
		<td class="SCell" colspan="2">
			<label>������ � ��� ���������� ��� �����</label>
			<p><?=$arResult['RESULT']['6']?></p>
			<p><?=$arResult['RESULT']['7']?></p>
		</td>
	</tr>
	<tr class="SRow">
		<td class="SCell" colspan="2">
			<label>������</label>
			
			<p><?=$arResult['RESULT']['3']?></p>
		</td>
	</tr>
	<tr class="SRow">
		<td class="SCell" colspan="2">
			<label>����������</label>
			<p><?=$arResult['RESULT']['8']?></p>
			<p>��������������� ��������� = <?=$arResult['RESULT']['4']?>. �������������� ��������� ��������� � ���������.</p>
		</td>
	</tr>
	<tr class="SRow">
		<td class="SCell" colspan="2">
			<label>�������������</label>
			<p><?=$arResult['RESULT']['5']?></p><!--p> ���. ���. 123�45�67, �������������� �������: 888�888�56�89�12</p-->

			
		</td>
	</tr>
</table>
	<!--div id="status_result">
	<br><br><br>
	���������� �� ��������� ��: <?=$arDate['y'];?>.<?=$arDate['m'];?>.<?=$arDate['d'];?> <?=$arDate['h'];?>:<?=$arDate['s'];?>
	<br><br>
	<h4>����</h4>
	<p><?=$arResult['RESULT']['0']?></p>
	<h4>�����</h4>
	<p><?=$arResult['RESULT']['1']?></p>
	<h4>�������������</h4>
	<p><?=$arResult['RESULT']['2']?></p>
	<h4>������ ����������</h4>
	<p><?=$arResult['RESULT']['3']?></p>
	<?if(!empty($arResult['RESULT']['4'])):?><h4>�����</h4>
	<p>��������������� ��������� = <?=$arResult['RESULT']['4']?>. �������������� ��������� ��������� � ���������.</p>
	<?endif;?>
	<h4>������</h4>
	<p><?=$arResult['RESULT']['5']?></p>
	<h4>��� �������</h4>
	<p><?=$arResult['RESULT']['6']?></p>
	<h4>���. �������</h4>
	<p><?=$arResult['RESULT']['7']?></p>
	<h4>����</h4>
	<p><?=$arResult['RESULT']['8']?></p>
	</div-->
<?endif;?>
	</div>	
</div>



<script>
$("#datepicker").mask("99.99.9999",{placeholder:"��.��.����"});
	
$("#datepicker").datepicker({ 
	dateFormat: "dd.mm.yy", 
	regional: "ru",
	monthNames: ['������', '�������', '����', '������',
	'���', '����', '����', '������', '��������',
	'�������', '������', '�������'],
	 dayNamesMin: ['��','��','��','��','��','��','��'],
	 firstDay: 1,
	}); 
$("input").click(function(){
	var parent = $(this).parent().parent(".InputError");
	$(parent).find('.CommentWrong').css('display', 'none');
	$(parent).find('.FormComment').css('display', 'block');
	$(parent).removeClass('InputError');
});


$(document).ready(function(){
	$('#refresh_captcha').click(function(){
	$.ajax({
		url: '/refresh_captcha.php',
		type: 'post',
		data: '',
		// dataType: 'json',
		success: function(data){
			// console.log(data);
			$('#captcha_container img').attr('src', '/bitrix/tools/captcha.php?captcha_sid=' + data);
			$('#captcha_sid').val(data);
		}
	});
	return false;
	});
});
</script>
<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>