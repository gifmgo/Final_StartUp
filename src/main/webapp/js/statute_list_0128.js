/**
 * 작성자 : 하재현
 * 작성일 : 2016-12-26
 * 목 적 : 의안 관련 스크립트
 */




//api Data 담을 변수
var pagingData;
//페이지 뿌려줄 데이타 개수 담을 변수
var selectPageNumber;

//페이징 처리 함수			obj > xml 데이터 담겨있음.
function pagingNumber(Use_Pagingdata){
	
	if(selectPageNumber == '' || selectPageNumber == undefined){
		selectPageNumber = 10;
		console.log("페이징 처리 함수 : 15번째 줄 : "+selectPageNumber);
	}
	
	var pagingButton = '<ul class="pagination">';
	pagingData = new Array();
	//처음 넘어온 데이터 배열에다가 넣어둠
	$.each(Use_Pagingdata, function(index, obj){
		pagingData.push(obj);
	});
	//페이징할 데이터 전체 개수
	var pageTotal = ''; 
	if(pagingData.length % selectPageNumber == 0){
		pageTotal = (pagingData.length / selectPageNumber); 
	}else{
		pageTotal = (pagingData.length / selectPageNumber)+1;
	}	
    
	console.log("넘어온파라미터  개수 : "+selectPageNumber+ " / 페이징 데이터 전체 개수 : "+pagingData.length);
	
	for(var i = 0; i < Math.floor(pageTotal); i++){
		pagingButton += '<li><span onclick="pagingAjax('+i+')">'+(i+1)+'</span></li>';
	}
	pagingButton += '</ul>'; 
	$("#pagingDiv").html(pagingButton);
}

//페이징 버튼 클릭시 호출
function pagingAjax(pagingNumber){
	
	console.log("확인좀 : "+$(window).width() +" / width 확인");

	if($(window).width() < "768"){
		
		console.log("768 보다 작아요 if 문 들어옴 확인좀");
		
		var table="";   
	    table+="<table class='table table-hover'>";
	    
	    if(pagingData[0].generalResult != undefined){
	    table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위.회</th><th>진행</th></tr>";
	    }else{
	    	table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위.회</th></tr>";
	    }
		
		//0 일때는 0 ~ 9까지
		//1 일때는 10 ~ 19 까지
		var lengthCount = pagingNumber * 10; 
		
		if(lengthCount == 0){
			$.each(pagingData, function(index, obj){
				var billName = obj.billName;
				    billName= billName.substring(0,5)+"...";
				var committeeName = obj.committeeName;
				    committeeName =committeeName.substring(0,2);
				    
				    if(obj.generalResult != null){
						var generalResult = obj.generalResult;    	
						    generalResult = generalResult.substring(2,4);
						    table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td><td>"+generalResult+"</td></tr>";	    
				    }else{
				    	table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td></tr>";
				    }
				
				if(index == 9){
					table += "</table>";
					$('#statuteTable').empty();
					$('#statuteTable').html(table);
					return;
				}
			});
		}else{
			//페이징 > 1이상일때
			var totalLength = (lengthCount+10)-1;
			for(var i = lengthCount; i < totalLength; i++){
				if(pagingData[i] != undefined || pagingData[i] != null){
					
					var billName = pagingData[i].billName.substring(0,5)+"...";
					console.log("빌네임 : "+pagingData[i].billName + " / 커미트 네임 :  "+pagingData[i].committeeName + " // 제너럴 리절트 : "+pagingData[i].generalResult);
				    var committeeName = pagingData[i].committeeName.substring(0,2);				    
				    
				    if(pagingData[i].generalResult != null){
				    var generalResult = pagingData[i].generalResult.substring(2,4);
				    	table+="<tr><td>"+pagingData[i].proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+pagingData[i].billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td><td>"+generalResult+"</td></tr>";
				    }else{
				    	table+="<tr><td>"+pagingData[i].proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+pagingData[i].billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td></tr>";
				    }
				   
				}else{
					table += "</table>";
					$('#statuteTable').empty();
					$('#statuteTable').html(table);
					return;
				}
			}
		}
	}else{
	
    var table="";   
    table+="<table class='table table-hover'>";
    table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th><th>진행상황</th></tr>";
	
	//0 일때는 0 ~ 9까지
	//1 일때는 10 ~ 19 까지
	var lengthCount = pagingNumber * 10; 
	
	if(lengthCount == 0){
		$.each(pagingData, function(index, obj){
			
			table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+obj.billName+"</a></td><td>"+obj.committeeName+"</td><td>"+obj.generalResult+"</td></tr>";
			if(index == 9){
				table += "</table>";
				$('#statuteTable').empty();
				$('#statuteTable').html(table);
				return;
			}
		});
	}else{
		//페이징 > 1이상일때
		var totalLength = (lengthCount+10)-1;
		for(var i = lengthCount; i < totalLength; i++){
			if(pagingData[i] != undefined || pagingData[i] != null){
				table+="<tr><td>"+pagingData[i].proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+pagingData[i].billId+"' target='_blank'>"+pagingData[i].billName+"</a></td><td>"+pagingData[i].committeeName+"</td><td>"+pagingData[i].generalResult+"</td></tr>";
			}else{
				table += "</table>";
				$('#statuteTable').empty();
				$('#statuteTable').html(table);
				return;
			}
		}
	}
  }
}

  $(function(){
	
	//모바일로 접근시
    if($(window).width() < "768"){
    	console.log("맨처음ㅁㅍㄴㅇ if 탑니까??");
    	$('#tabMenu').empty();
     	var tab = "";
     	tab += '<li>최근 통과안</li><li>최근 접수안</li><li>처리의안</li><li>계류의안</li>';
     	$('#tabMenu').html(tab);
    	
    	
    	var chooseTab;
  	  $('#pagingSize_Select').change(function(){
  		 var number = $('#pagingSize_Select option:selected').val();
  		 selectPageNumber = number;
  		 ///// 어느탭을 선택하고 있는지에 따라서 호출 해야 하는 함수가 달라짐.
  		 if(chooseTab==0){
               getRecentPasageList();
            //최근 접수의안     
            }else if(chooseTab==1){
               getRecentRceptList();      
            //처리의안     
            }else if(chooseTab==2){
               getJsictionComiteProcessList();
            //계류의안         
            }else{
               getRecentMoorList();
            }
  		 
  	  });
    	
    	$.ajax({
            url:"statuteList.do",
            success:function(data){
               $('#statuteTable').empty();
         
               var table="";   
               table+="<table class='table table-hover'>";
               table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위회</th><th>진행</th></tr>";
               
               //기본 10개씩 뿌려줌
               if(selectPageNumber == '' || selectPageNumber == undefined){
           		selectPageNumber = 10;
           		console.log("페이징 처리 함수 : 15번째 줄 : "+selectPageNumber);
           	   }
               
         
               if(data.statutelist.length>0){
                  $.each(data.statutelist, function(index, obj){
                     if(index <= selectPageNumber){
                     var billName = obj.billName;
                         billName= billName.substring(0,5)+"...";
                     
                     var committeeName = obj.committeeName;
                         committeeName= committeeName.substring(0,2);
                     
                     var generalResult = obj.generalResult;    
                         generalResult = generalResult.substring(2,4);
                     table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td><td>"+generalResult+"</td></tr>";
                    }else{
                  	  return;
                    }
                 });
                  
                 }else{
                     table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
                 }
              table+="</table>";
           $('#statuteTable').html(table);
           
             //페이징 처리 함수
              pagingNumber(data.statutelist);
            
              },beforeSend:function(){
  				$('#loading_form').css("display","block");
  			},complete:function(){
  				$('#loading_form').css("display","none");
  			}
         });
    	
    	$("#tabMenu").find("li").click(function(e) {
            
            var tSts = $(this).index();
            chooseTab = $(this).index();
            console.log(tSts);
            
            $(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
             
              //최근 통과의안
               if(tSts==0){
                  getRecentPasageList();
               //최근 접수의안     
               }else if(tSts==1){
                  getRecentRceptList();      
               //처리의안     
               }else if(tSts==2){
                  getJsictionComiteProcessList();
               //계류의안         
               }else{
                  getRecentMoorList();
               }
        });
    	return;
    }else{
    
	  
	  //내가 선택하는 의안 탭 담는 변수
	  var chooseTab;
	  $('#pagingSize_Select').change(function(){
		 var number = $('#pagingSize_Select option:selected').val();
		 selectPageNumber = number;
		 ///// 어느탭을 선택하고 있는지에 따라서 호출 해야 하는 함수가 달라짐.
		
		 if(chooseTab==0){
             getRecentPasageList();
          //최근 접수의안     
          }else if(chooseTab==1){
             getRecentRceptList();      
          //처리의안     
          }else if(chooseTab==2){
             getJsictionComiteProcessList();
          //계류의안         
          }else{
             getRecentMoorList();
          }
		 
	  });
	  
	  //맨처음 뿌려주는 데이터 
	  getRecentPasageList();
	  
      //탭 클릭시 사용됨
      $("#tabMenu").find("li").click(function(e) {
          
         var tSts = $(this).index();
         chooseTab = $(this).index();
         console.log(tSts);
         
         $(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});

       });
    }  
      
     //검색버튼 클릭시
    $('#searchStatuteBtn').click(function(){
          var statuteName = $('#statuteName').val();
         var statutePeople=$('#statutePeople').val();
         var committee =$('#committee').val();
         var statuteIng =$('#statuteIng option:selected').val();
         
      alert(statuteName+ " / "+statutePeople +" / "+committee + " / "+statuteIng);
      $.ajax({
            url: "http://apis.data.go.kr/9710000/BillInfoService/getBillInfoList?&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D",
            type:"GET",
            dataType:"xml",
            success:function(data){
               alert("성공");
               console.log(data);
            },
              error:function(data){
                 console.log(data);
                 alert('실패');
              }
      });
    });
 });
  
  
  //최근 통과 의안탭 클릭시
  function getRecentPasageList(){
     $.ajax({
          url:"statuteList.do",
          success:function(data){
             $('#statuteTable').empty();
             
             if($(window).width() < "768"){
            	 
            	$('#tabMenu').empty();
             	var tab = "";
             	tab += '<li>최근 통과안</li><li>최근 접수안</li><li>처리의안</li><li>계류의안</li>';
             	$('#tabMenu').html(tab);
            	 
                 var table="";   
                 table+="<table class='table table-hover'>";
                 table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위.회</th><th>진행</th></tr>";
                 
                 //기본 10개씩 뿌려줌
                 if(selectPageNumber == '' || selectPageNumber == undefined){
             		selectPageNumber = 10;
             		console.log("페이징 처리 함수 : 15번째 줄 : "+selectPageNumber);
             	}
                 
           
                 if(data.statutelist.length>0){
                    
		        	 $.each(data.statutelist, function(index, obj){
		        	   if(index <= selectPageNumber){
		                   var billName = obj.billName;
		                       billName= billName.substring(0,5)+"...";
		                   
		                   var committeeName = obj.committeeName;
		                       committeeName= committeeName.substring(0,2);
		           
		                   var generalResult = obj.generalResult;
		                       generalResult.substring(2,4);
		                       console.log("obj generalResult 확인 : "+generalResult);
			                  table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td><td>"+generalResult+"</td></tr>";
		                  }else{
		                	  return;
		                  }	
		    		 });
                 }else{
                	  table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
                 }
                 table+="</table>";
		         $('#statuteTable').html(table);
			     //페이징 처리 함수
		          pagingNumber(data.statutelist);
		          
		          $("#tabMenu").find("li").click(function(e) {
		              
		              var tSts = $(this).index();
		              chooseTab = $(this).index();
		              console.log(tSts);
		              
		              $(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
		               
		                //최근 통과의안
		                 if(tSts==0){
		                    getRecentPasageList();
		                 //최근 접수의안     
		                 }else if(tSts==1){
		                    getRecentRceptList();      
		                 //처리의안     
		                 }else if(tSts==2){
		                    getJsictionComiteProcessList();
		                 //계류의안         
		                 }else{
		                    getRecentMoorList();
		                 }
		          });
		          
		         return;
               }else{
            	
             
	             var table="";   
	             table+="<table class='table table-hover'>";
	             table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th><th>진행상황</th></tr>";
	             
	             //기본 10개씩 뿌려줌
	             if(selectPageNumber == '' || selectPageNumber == undefined){
	         		selectPageNumber = 10;
	         		console.log("페이징 처리 함수 : 15번째 줄 : "+selectPageNumber);
	         	}
             
       
                 if(data.statutelist.length>0){
                
	            	 $.each(data.statutelist, function(index, obj){
			               
			              if(index <= selectPageNumber){
			                   var billName = obj.billName;
			                   if(billName.length>30){
			                      billName= billName.substring(0,50)+"...";
			                   }
			                   var committeeName = obj.committeeName;
			                   if(committeeName.length>15){
			                      committeeName= committeeName.substring(0,15)+"...";
			                   }
			                  table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td><td>"+obj.generalResult+"</td></tr>";
			                  }else{
			                	  return;
			                  }
				       	});

		           }else{
		               table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
		           }
			       table+="</table>";
			       $('#statuteTable').html(table);
			     //페이징 처리 함수
		          pagingNumber(data.statutelist);
             }     
	         
             
            },beforeSend:function(){
				$('#loading_form').css("display","block");
			},complete:function(){
				$('#loading_form').css("display","none");
			}
		});

  }
  
  //최근 접수 의안 탭 클릭시
function getRecentRceptList(){
   $.ajax({
      url:"getRecentRceptList.do",
      success:function(data){
         
    	  $('#statuteTable').empty();
    	  
    	  if($(window).width() < "768"){ 

        	  $('#statuteTable').empty();
              var table="";   
              table+="<table class='table table-hover'>";
              table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위원회</th></tr>";
             
              //기본 10개씩 뿌려줌
              if(selectPageNumber == '' || selectPageNumber == undefined){
          		selectPageNumber = 10;
             	}
              
              if(data.statutelist.length>0){
		         $.each(data.statutelist, function(index, obj){
		            	if(index <= selectPageNumber){ 
			                var billName = obj.billName;
			                    billName= billName.substring(0,5)+"...";
			                
			                    var committeeName = obj.committeeName;
			                       committeeName= committeeName.substring(0,2);
			                    table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td></tr>";
		            	}else{
		            		return;
		            	}
		
		         	});
		         
              }else{
            	  table+"<tr><td colspan='3'>의안이 없습니다.</td></tr>";
              } 
              
              table+="</table>";
              $('#statuteTable').html(table);
              pagingNumber(data.statutelist);
              
              $("#tabMenu").find("li").click(function(e) {
                  
                  var tSts = $(this).index();
                  chooseTab = $(this).index();
                  console.log(tSts);
                  
                  $(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
                  
              });
              
     	  }else{
    	  
    	  
          var table="";   
          table+="<table class='table table-hover'>";
          table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위원회</th></tr>";
         
          //기본 10개씩 뿌려줌
          if(selectPageNumber == '' || selectPageNumber == undefined){
      		selectPageNumber = 10;
      		console.log("페이징 처리 함수 : 15번째 줄 : "+selectPageNumber);
         	}
          
          
          if(data.statutelist.length>0){

        	  $.each(data.statutelist, function(index, obj){
        		  		
	            	if(index <= selectPageNumber){ 
		                var billName = obj.billName;
		                if(billName.length>100){
		                    billName= billName.substring(0,70)+"...";
		                }
		                
		                var committeeName = obj.committeeName;
		                    if(committeeName.length > 70){
		                    	committeeName = committeeName.substring(0,15)+"...";
		                    }
		                    table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td></tr>";
	            	}else{
	            		return;
	            	}
        	  	}); 	
          }else{
                table+"<tr><td colspan='3'>의안이 없습니다.</td></tr>";
          }
         table+="</table>";
         $('#statuteTable').html(table);
         pagingNumber(data.statutelist);
         
     	 }
      }
   });
}

//처리의안 목록
function getJsictionComiteProcessList(){
	
	$.ajax({
       url:"getJsictionComiteProcessList.do",
       success:function(data){
    	   
     	  if($(window).width() < "768"){
     		 $('#statuteTable').empty();
         	   // 기본 10개씩 뿌려줌
              if(selectPageNumber == '' || selectPageNumber == undefined){
            		selectPageNumber = 10;
            		console.log("페이징 처리 함수 : 15번째 줄 : "+selectPageNumber);
               }
         	   
               $('#statuteTable').empty();
               var table="";   
               table+="<table class='table table-hover'>";
               table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위.회</th><th>진행상황</th></tr>";	
     		 
               if(data.statutelist.length>0){
                   
                   $.each(data.statutelist, function(index, obj){
                  	
                    if(index <= selectPageNumber){  
                  	 
      	                var billName = obj.billName;
      	                    billName= billName.substring(0,5)+"...";
      	                var committeeName = obj.committeeName;
      	                    committeeName= committeeName.substring(0,2);
                  	 }else{
                  		 return;
                     }
                     table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td><td>"+obj.generalResult+"</td></tr>";
                  });
                   
                }else{
                      table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
                }
               
     	  }else{

    	   //기본 10개씩 뿌려줌
         if(selectPageNumber == '' || selectPageNumber == undefined){
       		selectPageNumber = 10;
       		console.log("페이징 처리 함수 : 15번째 줄 : "+selectPageNumber);
          }
    	   
          $('#statuteTable').empty();
          var table="";   
          table+="<table class='table table-hover'>";
          table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th><th>진행상황</th></tr>";
          if(data.statutelist.length>0){
             
             $.each(data.statutelist, function(index, obj){
            	
              if(index <= selectPageNumber){  
            	 
	                var billName = obj.billName;
	                if(billName.length>30){
	                   billName= billName.substring(0,50)+"...";
	                }
	                var committeeName = obj.committeeName;
	                if(committeeName.length>15){
	                   committeeName= committeeName.substring(0,15)+"...";
	                }
            	}else{
            		 return;
               }
                
               table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td><td>"+obj.generalResult+"</td></tr>";
            });
             
          }else{
                table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
          }
          
      }
         table+="</table>";
         $('#statuteTable').html(table);
      
       //페이징 처리 함수
       pagingNumber(data.statutelist);
       
       }
    });
}

//계류의안 목록
function getRecentMoorList(){
	$('#statuteTable').empty();
	$.ajax({
       url:"getRecentMoorList.do",
       success:function(data){
    	   
      	  if($(window).width() < "768"){
      		  
      		$('#statuteTable').empty();
      		var table="";   
            table+="<table class='table table-hover'>";
            table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>위원회</th></tr>";
            
            //기본 10개씩 뿌려줌
            if(selectPageNumber == '' || selectPageNumber == undefined){
        		selectPageNumber = 10;
           	}
            
            if(data.statutelist.length>0){
		         $.each(data.statutelist, function(index, obj){
		            	if(index <= selectPageNumber){ 
			                var billName = obj.billName;
			                    billName= billName.substring(0,5)+"...";
			                
			                    var committeeName = obj.committeeName;
			                       committeeName= committeeName.substring(0,2);
			                    table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td></tr>";
		            	}else{
		            		return;
		            	}
		
		         	});
		         
            }else{
          	  table+"<tr><td colspan='3'>의안이 없습니다.</td></tr>";
            } 
            
            table+="</table>";
            $('#statuteTable').html(table);
            pagingNumber(data.statutelist);
            
            $("#tabMenu").find("li").click(function(e) {
                
                var tSts = $(this).index();
                chooseTab = $(this).index();      
                $(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
            });
      	  }else{
      		
      	  $('#statuteTable').empty();
          var table="";   
          table+="<table class='table table-hover'>";
          table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th></tr>";

          if(data.statutelist.length>0){
              
              $.each(data.statutelist, function(index, obj){
             	  
             	if(index <= selectPageNumber){ 
 	                var billName = obj.billName;
 	                if(billName.length>100){
 	                   billName= billName.substring(0,70)+"...";
 	                }
 	                var committeeName = obj.committeeName;
 	                if(committeeName.length>15){
 	                   committeeName= committeeName.substring(0,15)+"...";
 	                }
 	                table+="<tr><td>"+obj.proposeDt+"</td><td><a href='http://likms.assembly.go.kr/bill/billDetail.do?billId="+obj.billId+"' target='_blank'>"+billName+"</a></td><td>"+committeeName+"</td></tr>";
             	}else{
             		return;
             	}
             });
              
           }else{
                 table+"<tr><td colspan='3'>의안이 없습니다.</td></tr>"
           }
         table+="</table>";
         $('#statuteTable').html(table);

      //페이징 처리 함수
       pagingNumber(data.statutelist);
        }
   	  }	  
  });
}