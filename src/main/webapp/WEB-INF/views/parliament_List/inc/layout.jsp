<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/core2.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="paliament/custom.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<script src="js/main_header.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" type="text/css" href="loading/loading.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>의원정보</title>

</head>
<body>

   <!-- Header -->
   <tiles:insertAttribute name="header" />
   
   <!-- Main Wrapper -->
   <tiles:insertAttribute name="content" />
   
	<!--풋터-->
   <tiles:insertAttribute name="footer" />

<script>

   var guck = 0,
     sae = 0,
     doub = 0,
     muso = 0,
     jung = 0;
     ba = 0;
   // 당별 카운트 새기 위한 것
   
   //국회의원 객체를 만들어야 할듯  >> db 가 없으니까 객체 배열을 만들어서 정보를 담아둬야 할듯  리스트 뿌릴때 담아두면 만들어둔 배열에서 뽑으면 될듯.
   var PaliamentArray = new Array();
   //국회의원 객체               상세보기용 3개           //이미지   이름       정당          지역구    당선횟수
   function PaliamentDTO(empnm,deptCd,num,polyNm, img, orignm, reelegbnnm){
      this.empnm = empnm;
      this.deptCd = deptCd;
      this.num = num;
      this.img = img;
      this.jungDang = polyNm;
      this.orignm = orignm;
      this.reelegbnnm = reelegbnnm;
   }
   
   //검색 결과에 따라 > 영역 만드는 부분
   function MakeWell(obj){
      var searchColor = f_wellColor(obj.jungDang);
      var searchDiv ='';
         searchDiv += '<div class="col-sm-3">';
         searchDiv += '<div class="well text-center" style="background-color:white; border-top:10px solid '+searchColor+'">';
         searchDiv += '<input type="hidden" id='+obj.empnm+'>';
         searchDiv += '<input type="hidden" id='+obj.deptCd+'>';
         searchDiv += '<input type="hidden" id='+obj.num+'>';
         searchDiv += '<span><img style="width:100px; height:100px;" src='+obj.img+'></span><br/><br/>';
         searchDiv += '<span>이름 : '+obj.empnm+'</span><br/>';
         searchDiv += '<span>정당 : '+obj.jungDang+'</span><br/>';
         if(obj.orignm != '비례대표'){
        	 searchDiv += '<span>지역구 : '+obj.orignm.substring(0,6)+'</span><br/>';	 
         }else{
        	 searchDiv += '<span>지역구 : '+obj.orignm+'</span><br/>';
         }
         searchDiv += '<span>당선 회수 : '+obj.reelegbnnm+'</span><br/><br/>';
         searchDiv += '<input type="button" class="btn detail_btn" style="color:white; background-color:'+searchColor+'" onclick="detailPaliament(this)" value=상세보기>';
         searchDiv += '</div>';
         searchDiv += '</div>';
         return searchDiv;
   }
   
   //검색결과가 없을때 .
   function NoSearch(){
      var searchDiv = '';
      searchDiv += '<div class="col-sm-offset-4 col-sm-4">';
      searchDiv += '<div class="well text-center" style="height:400px; background-color:white; border-top:10px solid black">';
      searchDiv += '<span>검색하신 결과가 없습니다.</span>';
      searchDiv += '</div>';
      searchDiv += '</div>';
      return searchDiv;
   }
   	
    //UTF-8 변경
    function encodeUTF8(str){
     return encodeURIComponent(str);
	}

   
    //국회의원 상세보기
    function detailPaliament($obj){
      var img = $($obj).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().attr("src");
      img = encodeUTF8(img);
      var num = $($obj).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().attr("id");
      num = encodeUTF8(num);
      var deptCd = $($obj).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().attr("id");
      deptCd = encodeUTF8(deptCd);
      var name = $($obj).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().attr("id");
      name = encodeUTF8(name);
      location.href="PaliamentDetail.do?num="+num+"&dept_cd="+deptCd+"&img="+img+"&name="+name;
   }


    //정당 뽑아오는 함수
    /* function jungDang(deptcd,num){
       
       jungdangName = '';
      $.ajax({
         url : "PaliamentJungDang.do",
         data : {
            dept_cd : deptcd,
            num : num
         },
         async:false,
         success : function(data){                        
            var jungDang = $(data.jungDang).find("item").find("polyNm").text();
            console.log("색상좀 확인 : "+$(data.jungDang).find("item").find("polyNm").text());
            if(jungDang != undefined && jungDang != null){
               jungdangName = $(data.jungDang).find("item").find("polyNm").text();   
            }else{
               location.href="Member_Parliament.do";      
            }
         }
      }); 
      return jungdangName;
   } */
    
    
    //국회의원 전체 리스트 뿌릴때
    function PaliamentList(){
       var searchDiv = '';
       $.each(PaliamentArray, function(index, obj){
          searchDiv += MakeWell(obj);
      });
       
       $('#resultDiv').html(searchDiv);
    }
    
    //1-1 이름만 입력
    function justSearchName(name){
      console.log("1-1 함수 호출 ");
       var result = 0;
       var searchDiv = '';
      $('#resultDiv').empty();
      //obj >> DTO 담여있음 
      $.each(PaliamentArray, function(index, obj){
         if(obj.name == name){
            console.log("일치합니다 1-1 : "+obj.name + " / 넘어온 이름 : "+name);
            searchDiv += MakeWell(obj);
            result ++;
         }
      });
      
      if(result > 0){
         $('#resultDiv').html(searchDiv);   
      }else{
         searchDiv = NoSearch();
         $('#resultDiv').html(searchDiv);
      }
    }
    
    
    //1-2 정당만 입력
    function noNameJustPolyNm(jungDangName){
       console.log("1-2 함수 호출");
       var searchDiv = '';
       $.each(PaliamentArray, function(index, obj){
          if(jungDangName == obj.jungDang){
             searchDiv += MakeWell(obj);
          }
       });
       $('#resultDiv').html(searchDiv);
    }
    
    //1-3 지역구만 입력 했을때 !! >> 비례대표 선택시
    function onlysearchOrignm(){
       console.log("1-3 함수 호출");
       var searchDiv = '';
       $.each(PaliamentArray, function(index, obj){
          if(obj.orignm == '비례대표'){
             searchDiv += MakeWell(obj);
          }
       });
       $('#resultDiv').html(searchDiv);
    }
    
    //1-3-2 지역규만 입력시 >> 비례대표 제외하고
    function onlysearchOrignm2(orignm){
       console.log("1-3-2 함수 호출");
       var searchDiv = '';
       if(orignm == '전체'){
          PaliamentList();
       }else{
          $.each(PaliamentArray, function(index, obj){
              if(orignm == obj.orignm.substring(0,2)){
                 searchDiv += MakeWell(obj);
              }
           });   
          $('#resultDiv').html(searchDiv);
       }
    }
    
    
    //2 - 2 이름 , 지역구
    function noNamePolyNm_orignm(empNm, orignm){
       console.log("2- 2  함수 호출 orignm");
       if(orignm=='비례대표'){
          $('#resultDiv').empty();
          console.log("2- 2 if 부분 호출");
         var searchDiv = '';
         var result = 0;
         $.each(PaliamentArray, function(index, obj){
              if(obj.orignm == '비례대표' && empNm == obj.name){
                 searchDiv += MakeWell(obj);
                 result ++;
              }
           });
         
         if(result > 0){
            $('#resultDiv').html(searchDiv);   
         }else{
            searchDiv = NoSearch();
            $('#resultDiv').html(searchDiv);
         }
      
      }else{
         console.log("2- 2 Else 부분 호출 : ");
         $('#resultDiv').empty();
         var searchDiv = '';
         var result = 0;
         $.each(PaliamentArray, function(index, obj){
              if((orignm == obj.orignm.substring(0,2)) && (empNm == obj.name)){
                 searchDiv += MakeWell(obj);
                 result ++;
              }
           });
         if(result > 0){
            $('#resultDiv').html(searchDiv);   
         }else{
            searchDiv = NoSearch();
            $('#resultDiv').html(searchDiv);
         }
      }
    }
    
    // 2- 3 정당, 지역구 검색시
    function noNamePolyNm_orignm_two(polyNm, orignm){
    
       if(orignm == '비례대표'){
         var searchDiv = '';
         var result = 0;
         $.each(PaliamentArray, function(index, obj){
              if(obj.orignm == '비례대표' && polyNm == obj.polyNm){
                 searchDiv += MakeWell(obj);
                 result ++;
              }
           });
         
         if(result > 0){
            $('#resultDiv').html(searchDiv);   
         }else{
            searchDiv = NoSearch();
            $('#resultDiv').html(searchDiv);
         }
       }else{
          
          var searchDiv = '';
         var result = 0;
         $.each(PaliamentArray, function(index, obj){
              if(obj.orignm.substring(0,2) == orignm && polyNm == obj.jungDang){
                 searchDiv += MakeWell(obj);
                 result ++;
              }
           });
         if(result > 0){
            $('#resultDiv').html(searchDiv);   
         }else{
            searchDiv = NoSearch();
            $('#resultDiv').html(searchDiv);
         }
       }
       
    }
    
    //3-1 3개 입력시
    function allSearchTree(empNm, polyNm, orignm){
       if(orignm == '비례대표'){
          var searchDiv = '';
         var result = 0;
         $.each(PaliamentArray, function(index, obj){
              if(obj.orignm == '비례대표' && polyNm == obj.jungDang && empNm == obj.name){
                 searchDiv += MakeWell(obj);
                 result ++;
              }
           });
         if(result > 0){
            $('#resultDiv').html(searchDiv);   
         }else{
            searchDiv = NoSearch();
            $('#resultDiv').html(searchDiv);
         }
       }else{
          var searchDiv = '';
         var result = 0;
         
          $.each(PaliamentArray, function(index, obj){
              if(obj.orignm.substring(0,2) == orignm && polyNm == obj.jungDang && empNm == obj.name){
                 searchDiv += MakeWell(obj);
                 result ++;
              }
           });
          if(result > 0){
            $('#resultDiv').html(searchDiv);   
         }else{
            searchDiv = NoSearch();
            $('#resultDiv').html(searchDiv);
         }
       }
    }
    
    //이름 + 정당 
    function allSearch(empNm, polyNm){
       
       var searchDiv = '';
       var result = 0;
       
       //정당 전체에서 검색할때
       if(polyNm =='전체'){
          $.each(PaliamentArray, function(index, obj){
             if(empNm == obj.empnm){
                $.each(PaliamentArray, function(index, obj){
                     if(empNm == obj.empnm){
                        searchDiv += MakeWell(obj);
                       result ++;
                     }
                  });
             }
          });
       //전체가 아닌 정당별로 검색 들어갈때
       }else{
          $.each(PaliamentArray, function(index, obj){
              if(empNm == obj.empnm && polyNm == obj.jungDang){
                 searchDiv += MakeWell(obj);
                result ++;
              }
           });
       }
       if(result == 0){
          var searchDiv =NoSearch(); 
          $('#resultDiv').html(searchDiv);   
       }else{
          $('#resultDiv').html(searchDiv);
       }
    }
    
    //처음
    function f_wellColor(resultJung){
       var wellColor = '';
      
         switch(resultJung){
           case '국민의당': 
                      wellColor = '#79b394';
                       guck += 1;
                       break;   
           case '더불어민주당': 
                       wellColor = '#1870b9';
                       doub += 1;
                       break;
           case '바른정당':
        	    	   wellColor = '#01B1EC';
        	    	   ba += 1;
        	    	   break;
           case '자유한국당': 
                      wellColor = '#dc5356';
                       sae += 1;
                       break;
           case '정의당': 
                      wellColor = '#f2c755';
                       jung += 1;
                       break;
           case '무소속': 
                      wellColor = '#a6a6a6';
                       muso += 1;
                       break;
        }
      return wellColor;
    }
    
    
    //의원검색시 사용할 테두리 색깔
    function color(jungDang){
       var wellColor = '';
       if(jungDang == '' || jungDang == ""){
          jungDang = "무소속";
      }
      
      switch(jungDang){
         case '국민의당': 
                     wellColor = '#79b394';
                     break;   
         case '더불어민주당': 
                     wellColor = '#1870b9';
                     break;
         case '바른정당':
         			 wellColor = '#01B1EC';
         			 break;
         case '자유한국당': 
                     wellColor = '#dc5356';
                     break;
         case '정의당': 
                     wellColor = '#f2c755';
                     break;
         case '무소속': 
                     wellColor = '#a6a6a6';
                     break;
      }
      return wellColor;
    }

   $(function(){
      //국회의원 리스트 뽑아줌
      $.ajax({
         url:"ListPaliament.do", 
         success : function(data){   
            var PaliamentDiv = '';
            //var resultJung = jungDang2(data.xml);
            //xml 데이터 담겨져있음\
            $.each(data.xml, function(index, obj){
               var wellColor = f_wellColor(obj.polyNm);      
               PaliamentDiv += '<div class="col-sm-3">';
               PaliamentDiv += '<div class="well text-center" style="background-color:white; border-top:10px solid '+wellColor+'">';
               PaliamentDiv += '<input type="hidden" id='+obj.empNm+'>';
               PaliamentDiv += '<input type="hidden" id='+obj.deptCd+'>';
               PaliamentDiv += '<input type="hidden" id='+obj.num2+'>';
               PaliamentDiv += '<span><img style="width:100px; height:100px;" src='+obj.jpgLink+'></span><br/><br/>';
               PaliamentDiv += '<span>이름 : '+obj.empNm+'</span><br/>';
               PaliamentDiv += '<span>정당 : '+obj.polyNm+'</span><br/>';
               if(obj.origNm != '비례대표'){
            	   var origNm = obj.origNm.substring(0,6);
            	   PaliamentDiv += '<span>지역구 : '+origNm+'</span><br/>';   
               }else{
            	   PaliamentDiv += '<span>지역구 : '+obj.origNm+'</span><br/>';
               }
               PaliamentDiv += '<span>당선 회수 : '+obj.reeleGbnNm+'</span><br/><br/>';
               PaliamentDiv += '<input type="button" class="btn" style="color:white; background-color:'+wellColor+'" onclick="detailPaliament(this)" value=상세보기>';
               PaliamentDiv+= '</div>';
               PaliamentDiv+= '</div>';
               console.log("데이터 확인 empNm : "+obj.empNm+ " / dept : "+obj.deptCd+ " / num2 : "+obj.num2 + " / obj.polyNm : "+obj.polyNm);
               PaliamentArray.push(new PaliamentDTO(obj.empNm,obj.deptCd,obj.num2,obj.polyNm, obj.jpgLink, obj.origNm, obj.reeleGbnNm));
            });
            
            //$('#resultDiv').html(PaliamentDiv);
            google.charts.load('current', {'packages':['corechart']});
             google.charts.setOnLoadCallback(drawChart);
             
         },beforeSend:function(){
         },complete:function(){
         },timeout : 100000
      });
      
      //의원 검색 클릭시
      $("#searchBtn").click(function() {
   
         //국회의원 객체                이미지   이름       정당          지역구    당선횟수
         //  empnm,deptCd,num, img, name, jungDang, orignm, reelegbnnm
         
         var empNm = $('#empNm').val();
         var polyNm =$('#polyNm').val();
         var orignm = $('#orignm').val();

         $.ajax({
            url:"selectPaliament.do",
            data:{
            	empnm: $('#empNm').val(),
            	polyNm:$('#polyNm').val(),
            	orignm: $('#orignm').val()
            },
            success : function(data){   
               var PaliamentDiv = '';
               $('#resultDiv').empty();
               $(data).each(function(index,item){
            	   with(item){
            		   if(size==0){
            			   PaliamentDiv += '<div class="col-md-offset-4 col-md-4">';
            			   PaliamentDiv += '<div class="well customWell text-center">';
            			   PaliamentDiv += '<span class="text-center"><i class="fa fa-meh-o" style="font-size:48px;color:red"></i></span><br/><br/>';
            			   PaliamentDiv += '<p>검색한 의원이 없습니다.</p>';
            			   PaliamentDiv += '</div>';
            			   PaliamentDiv += '</div>';
            			   $('#resultDiv').html(PaliamentDiv);
            			   return false;
            		   }
            	   }
               });
               //var resultJung = jungDang2(data.xml);
               //xml 데이터 담겨져있음\
               $.each(data.xml, function(index, obj){
                  var wellColor = f_wellColor(obj.polyNm);      
                  PaliamentDiv += '<div class="col-sm-3">';
                  PaliamentDiv += '<div class="well text-center" style="background-color:white; border-top:10px solid '+wellColor+'">';
                  PaliamentDiv += '<input type="hidden" id='+obj.empNm+'>';
                  PaliamentDiv += '<input type="hidden" id='+obj.deptCd+'>';
                  PaliamentDiv += '<input type="hidden" id='+obj.num2+'>';
                  PaliamentDiv += '<span><img style="width:100px; height:100px;" src='+obj.jpgLink+'></span><br/><br/>';
                  PaliamentDiv += '<span>이름 : '+obj.empNm+'</span><br/>';
                  PaliamentDiv += '<span>정당 : '+obj.polyNm+'</span><br/>';
                  if(obj.origNm != '비례대표'){
               	   var origNm = obj.origNm.substring(0,6);
               	   PaliamentDiv += '<span>지역구 : '+origNm+'</span><br/>';   
                  }else{
               	   PaliamentDiv += '<span>지역구 : '+obj.origNm+'</span><br/>';
                  }
                  /* PaliamentDiv += '<span>생활 포인트 : '+obj.point+'</span><br/><br/>'; */
                  PaliamentDiv += '<span>당선 회수 : '+obj.reeleGbnNm+'</span><br/><br/>';
                  PaliamentDiv += '<input type="button" class="btn" style="color:white; background-color:'+wellColor+'" onclick="detailPaliament(this)" value=상세보기>';
                  PaliamentDiv+= '</div>';
                  PaliamentDiv+= '</div>';

               });
               
               $('#resultDiv').html(PaliamentDiv);
            }
         });

/* 
         //div 영역 담당
         var searchDiv = '';
         
         //1.1 - 이름만 검색한 경우
         if(empNm != '' && polyNm == '전체' && orignm == '전체'){
            console.log("1-1 호출");
            justSearchName(empNm);
         }
         
         //1.2 - 정당만 검색한 경우
         if(empNm == '' && polyNm != '' && orignm == '전체'){
            switch (polyNm) {
            
            case '전체' :
                  $('#resultDiv').empty();   
                  PaliamentList();
                  break;
            
            case '국민의당':
                  $('#resultDiv').empty();
                  noNameJustPolyNm(polyNm);
                  break;
            
            case '더불어민주당':
                 $('#resultDiv').empty();
                 noNameJustPolyNm(polyNm);
                 break;   
                 
            case '바른정당':
            	 $('#resultDiv').empty();
            	 noNameJustPolyNm(polyNm);
                 break;
                 
            case '무소속':
                 $('#resultDiv').empty();
                 noNameJustPolyNm(polyNm);
                 break;
                 
            case '자유한국당':
                 $('#resultDiv').empty(); 
                 noNameJustPolyNm(polyNm);
                 break;        
         
            case '정의당':
                 $('#resultDiv').empty();
                 noNameJustPolyNm(polyNm);
                 break;      
         
            default:
                 alert("정당을 선택해주세요 !");
                 break;
            }
         }
         
         //1.3 - 지역구만 검색한 경우
         if(empNm == '' && polyNm == '전체' && orignm != ''){
            //비례대표 일때
            if(orignm == '비례대표'){
               onlysearchOrignm();
            }else{
               //비례대표 제외하고
               onlysearchOrignm2(orignm);
            }
         }
         //하나씩 한거는 끝 
         //////////////////////////////////////////////////////////////////////////////////////////
         
         //2개짜리 시작
         //2-1 . 이름 , 정당 다 검색할 때 
         if(empNm != '' && polyNm != '전체' && orignm == '전체'){
            $('#resultDiv').empty();
            allSearch(empNm, polyNm);
         }
         
         //2-2. 이름 , 지역구  검색
         if(empNm != '' && polyNm == '전체' && orignm != '전체'){
            console.log("2-2 처음 부분 호출");
            $('#resultDiv').empty();
            noNamePolyNm_orignm(empNm, orignm);
         }
         
         //2-3. 정당, 지역이름 검색
         if(empNm == '' && polyNm != '전체' && orignm != '전체'){
            console.log("2-3 처음 부분 호출");
            $('#resultDiv').empty();
            noNamePolyNm_orignm_two(polyNm, orignm);
         }
         //2개짜리 끝
         /////////////////////////////////////////////////////////////////////////////////////////////////
         
         //3개짜리 시작
         //3-1 이름, 정당, 지역구 전체 선택시 
         if(empNm != '' && polyNm != '전체' && orignm != '전체'){
            allSearchTree(empNm, polyNm, orignm);
         }
          */
      }); 
   });
    

   
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['국민의당',     guck],
        ['더불어 민주당',      doub],
        ['바른 정당',      ba],
        ['자유한국당',  sae],
        ['정의당', jung],
        ['무소속',    muso]
      ]);

      var options = {
        title: '국회의원 현황',
        sliceVisibilityThreshold: .0,
        slices: {
           0: { color: '#79b394' },
           1: { color: '#1870b9' },
           2: { color: '#01B1EC' },
           3: { color: '#dc5356' },
           4: { color: '#f2c755' },
           5: { color: '#a6a6a6' }
         }
      };

      
      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      chart.draw(data, options);
    }   
   
</script>
</body>
</html>