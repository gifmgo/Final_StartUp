// JavaScript Document

function checkForm(){
	var result = true;
	if($('#pw').val() == ''){
		alert("비밀번호를 입력해주세요 !");
		$('#pw').focus();
		result = false;
		return result;
	}
	
	if($('#newnickName').val() == ''){
		alert("닉네임을 입력해주세요 !");
		$('#newnickName').focus();
		result = false;
		return result;
	}
	
	if($('#newnickName').val() != $('#short_btn_hidden').val()){
		alert("닉네임을 확인해주세요 !");
		$('#newnickName').focus();
		result = false;
		return result;
	}
}

//실제 모디파이 하는 부분
function modifyFunc(){
	var result = checkForm();
	if(result == false){
		return false;
	}else{
		modifySubmit();
	}
}

$(document).ready(function(e) {
	
	$('#modifyStartBtn').click(function(){
		
		location.href="modifyView.do";
	});

}); 

//첫번째꺼 
var chk_Array = '';
function checkBox0(obj){
	
	console.log("checkBox0 호출");
	
	var $chk = $(obj);
	if($chk.prop("checked")){
		chk_Array = "경제";
		console.log("체크 : "+chk_Array);	
	}else{
		chk_Array = '';
		console.log("체크 안됨");
	}
}

var chk_Array2 = '';
function checkBox1(obj){
	console.log("checkBox1 호출");
	
	var $chk = $(obj);
	if($chk.prop("checked")){
		chk_Array2 = "사회";
		console.log("체크 : "+chk_Array2);	
	}else{
		chk_Array2 = '';
		console.log("체크 안됨");
	}
}

var chk_Array3 = '';
function checkBox2(obj){
	console.log("checkBox3 호출");
	
	var $chk = $(obj);
	if($chk.prop("checked")){
		chk_Array3 = "연예";
		console.log("체크 : "+chk_Array3);	
	}else{
		chk_Array3 = '';
		console.log("체크 안됨");
	}
}

var chk_Array4 = '';
function checkBox3(obj){
	
	console.log("checkBox4 호출");
	
	var $chk = $(obj);
	if($chk.prop("checked")){
		chk_Array4 = "스포츠";
		console.log("체크 : "+chk_Array4);	
	}else{
		chk_Array4 = '';
		console.log("체크 안됨");
	}
}


var inputNick = '';

//처음 로그인한 사용자가 사용하는 닉네임과 변경한 닉네임 값 비교 하는 메서드
function checkNickName(){
	//model 에 담겨 있던 데이터 
	var dbNickName = $('#nick').val();
	//내가 입력하는 데이터
	var nickNameValue = $('#newnickName').val();
	
	if(dbNickName == nickNameValue){
		alert("현재 사용하시고 있는 닉네임 입니다!");
		$('#newnickName').focus();
		$('#short_btn_hidden').val(nickNameValue);
	}else{
		changeNick(nickNameValue);
	}
}
//디비에서 닉네임값 읽어와서 비교 하는 부분.
function changeNick(nickNameValue){
	$.ajax({
		url : "checkNick.do",
		data : {
			nick : nickNameValue
		},
		success : function(data){
			//사용가능한 닉네임
			if(data.use == '1'){
				//중복검사 했다는 의미
				alert(data.msg);
				$('#short_btn_hidden').val(nickNameValue);
			}else{
				alert(data.msg);
				$('#newnickName').focus();
			}
		}
	});
}

//서브밋 직전 내가 입력해놓은 값이 중복검사를 한건지 ...
function finalCheck(checkNick){
	//중복검사 버튼 클릭시 들어가지는 hidden input 에 있는 값
	var hiddenInput = $('#short_btn_hidden').val();
	if(hiddenInput == '' || (hiddenInput != checkNick)){
		alert("중복검사를 해주세요 !!");
		$("#personal_tb>table").find("tr").eq(1).find("td").find("input").focus();
		return false;
	}
	//최종 서브밋 전 input 태그 값 >> checkNick
}


//>> 다 통과하고 넘어온거니까 여기서 submit 이벤트 발생 시키면 끝남
function modifySubmit(){
	var favorit_Result = new Array();
	if(chk_Array != ''){
		favorit_Result.push(chk_Array); 
	}
	
	if(chk_Array2 != ''){
		favorit_Result.push(chk_Array2);
	}
	if(chk_Array3 != ''){
		favorit_Result.push(chk_Array3);
	}
	
	if(chk_Array4 != ''){
		favorit_Result.push(chk_Array4);
	}

	for(var i = 0; i < favorit_Result.length; i++){
		console.log("최종 : "+favorit_Result[i]);
	}
	
	favorit_Result=JSON.stringify(favorit_Result);
	
	console.log("제이슨 형식 : "+favorit_Result);
	
	$('#member_favorit').val(favorit_Result);
	console.log("왜 안되지 ? : "+$('#member_favorit').val());
	$("#modifySubmitForm").submit();
}
