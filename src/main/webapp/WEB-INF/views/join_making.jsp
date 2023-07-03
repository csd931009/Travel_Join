<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	<link href="/css/join_making.css" rel="stylesheet" type="text/css"/>
   
<div class="making-container">

		<div class="makingList">
		
			제 목 <input  type="text" name="title"><br/>
				
			구분 
		<div class ="flex">
			<input  type="radio" checked="checked" value="0" name="planType"> 국내 
			&nbsp;&nbsp;<input type="radio" value="1" name="planType"> 해외 <br/>
		</div>
				
			여 행 지<input  type="text" name="destination"><br/>
			
			여행 기간 
		<div class ="flex">
			<input type="date" name="startDay"> ~ 
			<input type="date" name="endDay"><br/>
		</div>
				
			인 원 수 <input type="number" min="1" max="100" name="personnel">
			마 감 일 <input type="date" name="finishDate">
			<br><br><br>

			<textarea id="summernote" name="content"></textarea>
			<button class="makingBtn" type="button" id="submitBtn">글올리기</button>
		</div>
		
</div>


<%@ include file="footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('#summernote').summernote({
            width: 700, height: 400,
            minHeight: null, maxHeight: null,
            toolbar: [
                ['fontsize', ['fontsize']],
                ['style', ['bold']],
                ['insert', ['picture']]
            ],
            fontSizes: ['10', '20', '30', '40', '50', '60', '70', '80', '90', '100'],
            callbacks: {
                onImageUpload: function (files, editor, welEditable) { //이미지 첨부
                    for (let i = files.length - 1; i >= 0; i--) { // 다중 업로드
                        uploadSummernoteImageFile(files[i], this);
                    }
                }
            }

        });
    });

    //글쓰기 중 사진을 넣을때 저장시키고 불러오는 함수
    function uploadSummernoteImageFile(file, el) {
        let formData = new FormData();
        formData.append("file", file);
        $.ajax({
            url: "/uploadSummernoteImageFile",	//Controller 요청 주소
            type: "POST",
            enctype: 'multipart/form-data',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: (data) => {
                $(el).summernote('editor.insertImage', data.url);
            }
        });
    }

    document.getElementById("submitBtn").addEventListener("click", function () {
        // 글작성올리기전 검증(빈칸)후에 비동기로 db에 전송
        let titlt = $('input[name="title"]').val(); // 제목
        let destination = $('input[name="destination"]').val(); // 여행 구분
        let planType = $('input[name="planType"]').val(); // 여행 목적지
        let startDay = $('input[name="startDay"]').val(); //여행시작
        let endDay = $('input[name="endDay"]').val(); 	  //여행끝
        let personnel = $('input[name="personnel"]').val(); //인원
        let finishDate = $('input[name="finishDate"]').val(); //여행모집 마감
        let content = $('textarea[name="content"]').innerHTML;

        if (titlt === "") {
            alert("제목을 입력해주세요")
            return false;
        } else if (destination === "") {
            alert("여행지를 선택해주세요")
            return false;
        } else if (startDay === "") {
            alert("시작일을 입력해주세요")
            return false;
        } else if (endDay === "") {
            alert("종료일을 입력해주세요")
            return false;
        } else if (personnel === "") {
            alert("인원수를 입력해주세요")
            return false;
        } else if (finishDate === "") {
            alert("마감일을 입력해주세요")
            return false;
        } else if (content === "") {
            alert("본문을 입력해주세요")
            return false;
        } else {

            let content = $('#summernote').summernote('code'); //에디터 내용가져오기

            let imageFileNameList = []; //내용 중 이미지 태그를 추출 후 리스트로 만들기
            $(content).find('img').each(function () {
                let imageUrl = $(this).attr('src');
                let fileName = imageUrl.split('/').pop();
                imageFileNameList.push(fileName);
            });

            $.ajax({
                type: "POST",	//요청 method
                contentType: "application/json; charset=utf-8",	//json 포맷 utf-8 내용으로 통신하겠다
                url: "/joinmaking_process", //어디 경로로 요청할건지
                data: JSON.stringify({	//JSON string 으로 변환
                    title: titlt,
                    destination: destination,
                    startDay: startDay,
                    planType: planType,
                    endDay: endDay,
                    personnel: personnel,
                    content: content,
                    finishDate: finishDate,
                    imageFileNameList: imageFileNameList
                }),	//파라미터로 같이 담아서 보낼 것들
                success: (data) => {
                    window.location.href = "/join_view";
                    return true;
                },	//요청에 대해 성공한 경우 수행할 내용
                error: () => {
                    alert('실행 오류');
                }	//요청이 실패,오류난 경우 수행할 내용

            });
        }
    });

</script>
