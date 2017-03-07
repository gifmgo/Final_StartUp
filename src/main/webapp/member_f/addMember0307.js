/**
 * 
 */
//디비에서 아이디 중복확인 하는 부분
function checkDbId(){
	$.ajax({
		url:"id_Check.do",
		data : {
			id : $('#id').val()
		},
		success : function(data){
			//data.use  == 1 사용 가능
			if(data.use == 1){
				alert(data.msg);
				$('#hidden_id').val(data.hidden_id);
			}else{
				alert(data.msg);
			}
		}
	});
}

//디비에서 닉네임 중복확인 하는 부분
function checkDbNick(){
	$.ajax({
		url : "check_N.do",
		data : {
			nick : $('#newnickName').val()
		},
		success : function(data){
			//중복검사 통과 했을때 !!
			if(data.use == 1){
				alert(data.msg2);
				$('#hidden_nick').val(data.hidden_nick);
			}else{
				alert(data.msg2);
				$('#member_nickName').val('');
				$('#member_nickName').focus();
			}
		}
	});
}



//아이디 중복확인 했는지
function checkId(){
	var check = false;
	var idchk = $('#hidden_id').val();
	if(idchk == ''){
		alert("아이디 중복확인을 해주세요 !");
	}else{
		check = true;
	}
	return check;
}

//닉네임 중복 확인했는지 확인해야함.
function checkNick(){
	var check = false;
	var nickCheck = $('#hidden_nick').val();
	if(nickCheck == ''){
		alert("닉네임 중복확인을 해주세요 !");
	}else{
		check = true;
	}
	return check;
}

//이메일 정규식 함수
function emailcheck(strValue)
{
	
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	//입력을 안했으면
	if(strValue.lenght == 0 || strValue == '')
	{
		alert("이메일을 입력해주세요 !");
		$('#id').focus();
		return false;
	}
	//이메일 형식에 맞지않으면
	if (!strValue.match(regExp))
	{
		alert("이메일 형식이 아닙니다!");
		$('#id').focus();
		return false;
	}
	return true;
}

//빈값 유효성 검사
function nullCheck(){
	
	var nullCheck = true;
	
	if($('#id').val() == ''){
	   alert("아이디를 입력해주세요 !");
	   $('#id').focus();
	   nullCheck = false;
	   return nullCheck;
	}else{
		nullCheck = emailcheck($('#id').val());
		if(nullCheck == false){
			return nullCheck;
		}
	}
	
	if($('#pw').val() == ''){
		alert("비밀번호를 입력해주세요 !");
		$('#pw').focus();
		nullCheck = false;
		return nullCheck;
	}
	
	if($('#newnickName').val() == ''){
		alert("닉네임을 입력해주세요 !");
		$('#newnickName').focus();
		nullCheck = false;
		return nullCheck;
	}
	
	//생년월일 빈값 체크
	if($('#birth').val() == ''){
		alert("생년월일을 입력해주세요 !");
		$('#birth').focus();
		nullCheck = false;
		return nullCheck;
	}
	
	//생년월일 값 유효성 검사
	
	var birth = checkBirth($('#birth').val());
	if(birth == null){
		alert("if 탐");
		alert("생년월일을 바르게 입력해주세요 ! ex)19990102");
		$('#birth').focus();
		nullCheck = false;
		return nullCheck;
	}
	
	return nullCheck;
}

//1.날짜형식
function checkBirth(d) {
	var df = /[0-9]{4}[0-9]{2}[0-9]{2}/;
	return d.match(df);
}



// 관심사 >>>>>>>>>>>>>>> 
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




	
//이게 서브밋 버튼 클릭했을때 !!! ....
function addMemberFnc(){
	//유효성 전체 총괄
	var check = false;
	//널체크 하는부분
	check = nullCheck();
	alert("check 확인좀 "+check);
	
	//통과했다면 ..... >> 중복확인 했는지 다 확인하자  
	if(check == true){
		
		check = checkId();
		
		if(check == true){
			//닉네임 중복확인
			check = checkNick();
			if(check == true){
				AddsubmitFunc();
			}
		}
	}
}


function lastCheckIdAnick(){
	var chk = true;
	if($('#id').val() != $('#hidden_id').val()){
		alert("올바른 회원가입을 부탁드려요 !");
		$('#id').focus();
		chk = false;
		return chk;
	}
	
	if($('#newnickName').val() != $('#hidden_nick').val()){
		alert("올바른 회원가입을 부탁드려요 !");
		$('#newnickName').focus();
		chk = false;
		return chk;
	}
	return chk;
}

function AddsubmitFunc(){
	
	var chk = lastCheckIdAnick();
	if(chk == true){
		
	
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
	$('#addSubmitForm').submit();
	
	}else{
		return false;
	}
}

