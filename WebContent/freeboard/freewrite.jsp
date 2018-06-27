<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
        <script src="../dist/lang/summernote-ko-KR.js"></script>
        <style>
        	/* 에디터 p태그의 높이 조절 */
            .note-editable p { margin: 0 0 0.0001pt; }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>summernote</h1>
            <form action="freeview.jsp" method="post" onsubmit="return sendContents()" name="writeContents">
                <textarea id="summernote" name="contents"></textarea>
                <input type="submit" class="btn btn-primary" value="글쓰기">
            </form>
        </div>

        <script>
            $(document).ready(function () {
                $("#summernote").summernote({
                    height: 500,
                    lang: 'ko-KR',
                    disableResizeEditor: true,
                    callbacks: {
                        onImageUpload: function (files, editor, welEditable) {
                            sendFile(files[0], this);
                        },
                    }
                })
            })

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
                              	console.log("찍힙니까?...");
                        $(editor).summernote('editor.insertImage', data.url);
                    }
                })
            }

            function sendContents() {
                $("#summernote").html($("#summernote").summernote('code'));
                document.writeContents.submit();
            }
        </script>
    </body>

    </html>