	$(document).ready(function () {
	    $("#editor").summernote({
	        height: 500,
	        lang: 'ko-KR',
	        disableResizeEditor: true,
	        callbacks: {
	            onImageUpload: function (files, editor, welEditable) {
	                sendFile(files[0], this);
	            },
	
	            onKeydown: function(e) {
	                if (e.keyCode == 8 || e.keyCode == 16 || e.keyCode == 17 || e.keyCode == 37) 
	                    return;
	                if ($("#editor").summernote('code').length > 1500){
//	                	$(".note-editable").text().length >= 1500
	                    e.preventDefault();
	                    return;
	                }
	            }
	        }
	    })
	});
	
	// summernote에서 이미지를 업로드 할 시 실행할 함수
	function sendFile(file, editor) {
	    // 파일 전송을 위한 폼생성
	    var data = new FormData();
	    data.append('uploadFile', file);
	    $.ajax({
	        data: data,
	        type: "POST",
	        url: "imageUpload.iu",
	        cache: false,
	        contentType: false,
	        processData: false,
	        success: function (data) {
	            // 서버에 이미지 저장 성공 후 에디터에 이미지 넣음
	            $(editor).summernote('editor.insertImage', data.url);
	        }
	    })
	};
	
	function sendContents() {
	    $("#editor").html($("#editor").summernote('code'));
	    
	    if($("#editor").summernote('code').length > 1500) {
	    	alert("글자수 제한 범위 초과");
	    	$('#send').attr('disabled', false);
	    }else {
	    	$('#send').attr('disabled', true);
	    	document.writeContents.submit();
	    }
	};
	
	$("#cancel").click(function(){
		$("#editor").summernote('reset');
	});
	
	$("#list").click(function() {
		location.href="freeboard.bo";
	})