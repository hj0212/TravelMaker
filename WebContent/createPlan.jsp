<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
        .mobile-wrap {
            text-align: center;
            margin: auto;
            width: 400px;
            height: 534px;
            overflow: hidden;
            position: relative;
            background-color: white;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0 rgba(0, 0, 0, .19);
            box-sizing: border-box;
        }

        .mobile-header {
            width: 100%;
            height: 15%;
            text-align: center;
            margin: 0px auto;
            display: block;
            color: white;
            margin-top: 20px;
            font-size: 30px;
            text-shadow: black 2px 2px 2px;
            box-sizing: border-box;
        }

        .mobile-title {
            width: 100%;
            height: 10%;
            text-align: center;
            margin: 0px auto;


            box-sizing: border-box;
            margin-top: 30px;
        }

        .mobile-title>input {
            text-align: center;
            width: 70%;
            height: 90%;
            border: none;
            box-sizing: border-box;
            border-color: white;
            border: none;
            border-bottom: 1px solid gray;
            border-top: 1px solid gray;

            font-size: 15px;
            font-style: italic;


            color: gray;
        }

        #picker-div {
            width: 100%;
            height: 10%;
            text-align: center;
            margin: 0px auto;
            box-sizing: border-box;
            margin-top: 30px;
        }

        .picker-pic {
            width: 170px;
            height: 100%;
            text-align: center;
            margin: auto;
            box-sizing: border-box;
            margin-left: 15px;
            float: left;
            padding-top: 4px;
            box-sizing: border-box;
            color: gray;
        }

        #start-plan {
            width: 100%;
            height: 10%;
            text-align: center;
            margin: 0px auto;
            box-sizing: border-box;
            margin-top: 90px;
        }

        #start-bt {
            color: aliceblue;
            background-color: aqua;
        }

        #start-bt:hover {
            box-shadow: turquoise 2px 2px 2px;
            opacity: 0.7;
            color: chartreuse;
            text-shadow: black 1px 1px 1px;
        }

    </style>
</head>
<body>
  <div class="mobile-wrap">

        <div class="mobile-header">
            나의 여행계획 세우기
        </div>

        <div class="mobile-title">
            <input type="text" class="from-contol" placeholder="여행 제목을 입력해주세요">
        </div>

        <div id="picker-div">
            <div class="picker-pic">여행 시작 날짜<input id="datepicker" width="170" /></div>
            <div class="picker-pic">여행 종료 날짜<input id="datepicker-end" width="170" /></div>

        </div>

        <div id="start-plan">
            <p>땡박 땡일</p>
            <button class="btn btn-inline bt-lg" id="start-bt">여행 계획 시작하기</button>
        </div>
    </div>


    <script>
    $(document).ready(function(){
    	 var minDate = new Date();
    	    var maxDate = new Date();
    	    var mm = minDate.getDate()-1;
    	    var dd = maxDate.getDate()+ 62;
    	    minDate.setDate(mm);
    	    maxDate.setDate(dd);
    	    
        $("#datepicker").datepicker({
            uiLibrary: 'bootstrap4',
            format: 'yyyy/mm/dd',
            language: "ko",
            minDate:minDate,
            maxDate : maxDate,
            constrainInput: true, 
            
          
        });
        $("#datepicker-end").datepicker({
            uiLibrary: 'bootstrap4',
            format: 'yyyy/mm/dd',
            language: "ko",
            constrainInput: true, 
            minDate:minDate,
            maxDate : maxDate,
         
        });
		
        $("#start-bt").click(function(){
        var todate=	$("#datepicker").val();
        var enddate=$("#datepicker-end").val();
         
        	
        	var arrtodate = todate.split("/");
        	var arrenddate = enddate.split("/");
        	
         
        	
        	var formdt =new Date(arrtodate[0],arrtodate[1],arrtodate[2]);
        	var todt =new Date(arrenddate[0],arrenddate[1],arrenddate[2]);
        	
        	console.log((todt.getTime()-formdt.getTime())/(24*60*60*1000));//일수
   
        	
        });
        
    });
    
        
    </script>

</body>
</html>