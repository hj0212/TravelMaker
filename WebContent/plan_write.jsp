<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
        #title-board {
            font-size: 15px;
        }

        .container {
            margin-top: 50px;
        }

        .input-group {
            margin-bottom: 10px;
        }

        #plan-board {
            margin-top: 20px;
            width: 40%;
            float: left
        }

        #plan-div {
            margin-top: 20px;
        }
    </style>

</head>
<body>
    <div class="container">
        <div class="input-group input-group-lg">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
            </div>
            <input type="text" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="title-board">
        </div>

        <div clss="schedule">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">시간</th>
                        <th scope="col">장소</th>
                        <th scope="col">일정</th>
                        <th scope="col">예정</th>
                        <th scope="col">참고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>Otto</td>

                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td>Otto</td>

                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry the Bird</td>
                        <td>@twitter</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                </tbody>
            </table>
            <div id="bt-div" style="text-align: right;">

                <button type="button" class="btn btn-outline-danger btn-lg " id="delete-table">삭제</button>
            </div>
        </div>

        <div id="plan-board">
            <table class="table table-bordered " id="schedule-boarder ">
                <thead>
                </thead>

                <tbody>
                    <tr>
                        <th scope="row " style="background-color: #e9e9e9 ;text-align: center ">시간</th>
                        <td style="width:70%; text-align: center ">
                            <select class=" selectpicker " id=" inputGroupSelect01 ">
                                <option selected disabled>시</option>
                                <option value="1 ">1시</option>
                                <option value="2 ">2시</option>
                                <option value="3 ">3시</option>
                                <option value="4 ">4시</option>
                                <option value="5 ">5시</option>
                                <option value="6 ">6시</option>
                                <option value="7 ">7시</option>
                                <option value="8 ">8시</option>
                                <option value="9 ">9시</option>
                                <option value="10 ">10시</option>
                                <option value="11 ">11시</option>
                                <option value="12 ">12시</option>
                                <option value="13 ">13시</option>
                                <option value="14 ">14시</option>
                                <option value="15 ">15시</option>
                                <option value="16 ">16시</option>
                                <option value="17 ">17시</option>
                                <option value="18 ">18시</option>
                                <option value="19 ">19시</option>
                                <option value="20 ">20시</option>
                                <option value="21 ">21시</option>
                                <option value="22 ">22시</option>
                                <option value="23 ">23시</option>
                                <option value="24 ">24시</option>                                  
                            </select>
                            <select class="selectpicker " id=" inputGroupSelect02 ">
                                <option selected disabled>분</option>
                                <option value="0 ">00분</option>
                                <option value="1 ">01분</option>
                                <option value="2 ">02분</option>
                                <option value="3 ">03분</option>
                                <option value="4 ">04분</option>
                                <option value="5 ">05분</option>
                                <option value="6 ">06분</option>
                                <option value="7 ">07분</option>
                                <option value="8 ">08분</option>
                                <option value="9 ">09분</option>
                                <option value="10 ">10분</option>
                                <option value="11 ">11분</option>
                                <option value="12 ">12분</option>
                                <option value="13 ">13분</option>
                                <option value="14 ">14분</option>
                                <option value="15 ">15분</option>
                                <option value="16 ">16분</option>
                                <option value="17 ">17분</option>
                                <option value="18 ">18분</option>
                                <option value="19 ">19분</option>
                                <option value="20 ">20분</option>
                                <option value="21 ">21분</option>
                                <option value="22 ">22분</option>
                                <option value="23 ">23분</option>
                                <option value="24 ">24분</option>
                                <option value="25 ">25분</option>
                                <option value="26 ">26분</option>
                                <option value="27 ">27분</option>
                                <option value="28 ">28분</option>
                                <option value="29 ">29분</option>
                                <option value="30 ">30분</option>
                                <option value="31 ">31분</option>
                                <option value="32 ">32분</option>
                                <option value="33 ">33분</option>
                                <option value="34 ">34분</option>
                                <option value="35 ">35분</option>
                                <option value="36 ">36분</option>
                                <option value="37 ">37분</option>
                                <option value="38 ">38분</option>
                                <option value="39 ">39분</option>
                                <option value="40 ">40분</option>
                                <option value="41 ">41분</option>
                                <option value="42 ">42분</option>
                                <option value="43 ">43분</option>
                                <option value="44 ">44분</option>
                                <option value="45 ">45분</option>
                                <option value="46 ">46분</option>
                                <option value="47 ">47분</option>
                                <option value="48 ">48분</option>
                                <option value="49 ">49분</option>
                                <option value="50 ">50분</option>
                                <option value="51 ">51분</option>
                                <option value="52 ">52분</option>
                                <option value="53 ">53분</option>
                                <option value="54 ">54분</option>
                                <option value="55 ">55분</option>
                                <option value="56 ">56분</option>
                                <option value="57 ">57분</option>
                                <option value="58 ">58분</option>
                                <option value="59 ">59분</option>                                        
                            </select> ~
                            <select class="selectpicker " id=" inputGroupSelect03 ">
                                <option selected disabled>시</option>
                               <option value="1 ">1시</option>
                                <option value="2 ">2시</option>
                                <option value="3 ">3시</option>
                                <option value="4 ">4시</option>
                                <option value="5 ">5시</option>
                                <option value="6 ">6시</option>
                                <option value="7 ">7시</option>
                                <option value="8 ">8시</option>
                                <option value="9 ">9시</option>
                                <option value="10 ">10시</option>
                                <option value="11 ">11시</option>
                                <option value="12 ">12시</option>
                                <option value="13 ">13시</option>
                                <option value="14 ">14시</option>
                                <option value="15 ">15시</option>
                                <option value="16 ">16시</option>
                                <option value="17 ">17시</option>
                                <option value="18 ">18시</option>
                                <option value="19 ">19시</option>
                                <option value="20 ">20시</option>
                                <option value="21 ">21시</option>
                                <option value="22 ">22시</option>
                                <option value="23 ">23시</option>
                                <option value="24 ">24시</option>                                      
                            </select>
                            <select class="selectpicker " id=" inputGroupSelect04 ">
                                <option selected disabled>분</option>
                                 <option value="0 ">00분</option>
                                <option value="1 ">01분</option>
                                <option value="2 ">02분</option>
                                <option value="3 ">03분</option>
                                <option value="4 ">04분</option>
                                <option value="5 ">05분</option>
                                <option value="6 ">06분</option>
                                <option value="7 ">07분</option>
                                <option value="8 ">08분</option>
                                <option value="9 ">09분</option>
                                <option value="10 ">10분</option>
                                <option value="11 ">11분</option>
                                <option value="12 ">12분</option>
                                <option value="13 ">13분</option>
                                <option value="14 ">14분</option>
                                <option value="15 ">15분</option>
                                <option value="16 ">16분</option>
                                <option value="17 ">17분</option>
                                <option value="18 ">18분</option>
                                <option value="19 ">19분</option>
                                <option value="20 ">20분</option>
                                <option value="21 ">21분</option>
                                <option value="22 ">22분</option>
                                <option value="23 ">23분</option>
                                <option value="24 ">24분</option>
                                <option value="25 ">25분</option>
                                <option value="26 ">26분</option>
                                <option value="27 ">27분</option>
                                <option value="28 ">28분</option>
                                <option value="29 ">29분</option>
                                <option value="30 ">30분</option>
                                <option value="31 ">31분</option>
                                <option value="32 ">32분</option>
                                <option value="33 ">33분</option>
                                <option value="34 ">34분</option>
                                <option value="35 ">35분</option>
                                <option value="36 ">36분</option>
                                <option value="37 ">37분</option>
                                <option value="38 ">38분</option>
                                <option value="39 ">39분</option>
                                <option value="40 ">40분</option>
                                <option value="41 ">41분</option>
                                <option value="42 ">42분</option>
                                <option value="43 ">43분</option>
                                <option value="44 ">44분</option>
                                <option value="45 ">45분</option>
                                <option value="46 ">46분</option>
                                <option value="47 ">47분</option>
                                <option value="48 ">48분</option>
                                <option value="49 ">49분</option>
                                <option value="50 ">50분</option>
                                <option value="51 ">51분</option>
                                <option value="52 ">52분</option>
                                <option value="53 ">53분</option>
                                <option value="54 ">54분</option>
                                <option value="55 ">55분</option>
                                <option value="56 ">56분</option>
                                <option value="57 ">57분</option>
                                <option value="58 ">58분</option>
                                <option value="59 ">59분</option>                                           
                            </select>
                        </td>



                    </tr>
                    <tr>
                        <th scope="row " style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">장소</th>
                        <td>
                            <form action=" ">

                                <div class="input-group ">
                                    <input type="text " class="form-control " placeholder="Search " readonly>
                                    <div class="input-btn ">
                                        <button class="btn btn-default " type="submit " style="height: 100%; border: 1px ">
                                         	<i class="fa fa-search"></i>
                                         </button>
                                    </div>
                                </div>
                            </form>
                        </td>


                    </tr>
                    <tr>
                        <th scope="row " style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">일정</th>
                        <td><textarea class="form-control "></textarea></td>

                    </tr>
                    <tr>
                        <th scope="row " style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">예산</th>
                        <td><input type="text " class="form-control "></td>

                    </tr>
                    <tr>
                        <th scope="row " style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">참조</th>
                        <td><input type="text " class="form-control "></td>
                    </tr>
                </tbody>
            </table>
            <div style="text-align: right ">
                <button type="button " class="btn btn-outline-primary btn-lg" id="delete-primary ">완료</button>
            </div>
        </div>
        <div style="width: 40%; float: right" id="plan-div">
            <div>
                <button type="button" class="btn btn-inline-primary btn-lg"> 일정추가(+)</button>
            </div>
            <table class="table table-bordered">
                <thead></thead>
                <tbody>
                    <tr>
                        <th style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">1일차</th>
                        <td style="width: 70%">총 예산:300,000원</td>
                    </tr>
                    <tr>
                        <th style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">2일차</th>
                        <td style="width: 70%">총 예산:200,000원</td>
                    </tr>
                    <tr>
                        <th style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">3일차</th>
                        <td style="width: 70%">총 예산:200,000원</td>
                    </tr>
                    <tr>
                        <th style="background-color: #e9e9e9 ;text-align: center;vertical-align: middle ">4일차</th>
                        <td style="width: 70%">총 예산:200,000원</td>
                    </tr>


                </tbody>

            </table>
            <div style="text-align: right">
                <button class="btn btn-inline-primary btn-lg" type="">여행계획 완료</button>

            </div>


        </div>
    </div>

</body>
</html>