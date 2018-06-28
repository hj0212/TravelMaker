	$(document).ready(function () {
	    $("#editor").summernote({
	        height: 500,
	        lang: 'ko-KR',
	        disableResizeEditor: true,
	        callbacks: {
	            onImageUpload: function (files, editor, welEditable) {
	                sendFile(files[0], this);
	            },
	
	            // onKeydown: function (e) { 
	            //     var t = e.currentTarget.innerText; 
	
	
	            //     if (t.trim().length >= 400) {
	            //         //delete keys, arrow keys, copy, cut
	            //         if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey))
	            //         e.preventDefault(); 
	            //     } 
	            // },
	
	            // onKeyup: function (e) {
	            //     var t = e.currentTarget.innerText;
	            //     $('#summernote').text(400 - t.trim().length);
	
	            //     //나중에 코드 길이로... 
	            //     //console.log($("#summernote").summernote('code').length);
	            // },
	
	            // onPaste: function (e) {
	            //     var t = e.currentTarget.innerText;
	
	            //     var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
	            //     e.preventDefault();
	            //     var maxPaste = bufferText.length;
	            //     if(t.length + bufferText.length > 400){
	            //         maxPaste = 400 - t.length;
	            //     }
	            //     if(maxPaste > 0){
	            //         document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
	            //     }
	
	            //     $('#summernote').text(400 - t.length);
	            // }
	        }
	    })
	})
	
	// summernote에서 이미지를 업로드 할 시 실행할 함수
	function sendFile(file, editor) {
	    // 파일 전송을 위한 폼생성
	    var data = new FormData();
	    data.append('uploadFile', file);
	    data.append('boardnum', 1);
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
	}
	
	function sendContents() {
	    $("#editor").html($("#editor").summernote('code'));
	    document.writeContents.submit();
	}
	
	$("#cancel").click(function(){
		$("#editor").summernote('reset');
	})