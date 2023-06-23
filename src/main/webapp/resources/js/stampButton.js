function stampbutton() { // 찜버튼
	var button = document.getElementById("stamp-button");
	var isstamp = button.classList.contains('off');
	
  var onoffstamp = new XMLHttpRequest();
  onoffstamp.onreadystatechange = function(){
	  
	  $("$")
	  
	  
	  if(onoffstamp.readyState === XMLHttpRequest.DONE){
		  if(xhr.status === 200){
			  console.log("준비완료")
			  
			  if (isstamp) {
			    button.classList.remove('off');
			    button.classList.add('on');
			  } else {
			    button.classList.remove('on');
			    button.classList.add('off');
			  }
		  }else{
			  console.error("실패")
		  }
	  }
	  $.ajax({
                type : "POST",            // HTTP method type(GET, POST) 형식이다.
                url : "/GroupBuying/stamp",      // 컨트롤러에서 대기중인 URL 주소이다.
                data : params,            // Json 형식의 데이터이다.
                success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    // 응답코드 > 0000
                    alert(res.code);
                },
                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    alert("통신 실패.")
                }
            });
  };
  
  onoffstamp.open('GET','controller주소')
  onoffstamp.send();
  }

