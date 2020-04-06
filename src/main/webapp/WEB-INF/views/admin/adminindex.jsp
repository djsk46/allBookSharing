<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="adminPage/css/font-face.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link href="adminPage/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- Vendor CSS-->
    <link href="adminPage/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="adminPage/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
    <div class="page-wrapper">


        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="adminPage/images/icon/logo.png" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">

                            </ul>
                        </li>

                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-table"></i>도서관 관리</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="#" onclick="adminmenuMove(1)">도서관 등록</a>
                                </li>
                                <li>
                                    <a href="#" onclick="adminmenuMove(2)">도서관 수정</a>
                                </li>
                                <li>
                                    <a href="#" onclick="adminmenuMove(5)">공지사항</a>
                                </li>
                                
                                

                            </ul>
                        </li>
                     
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="far fa-check-square"></i>사서관리</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="#" onclick="adminmenuMove(3)">사서 계정 등록</a>
                                </li>
                                <li>
                                    <a href="#" onclick="adminmenuMove(4)">사서 계정 목록</a>
                                </li>
                            </ul>
                        </li>

                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-calendar-alt"></i>추천도서 관리</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="#" onclick="adminmenuMove(6)">추천도서 등록</a>
                                </li>
                                <li>
                                    <a href="#" onclick="adminmenuMove(7)">추천도서 목록</a>
                                </li>

                            </ul>
                        </li>

                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-chart-bar"></i>도서관별 대출 현황</a>
                       
                       </li>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">

                            <div class="header-button">

                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="./images/icia.jpg" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">mr.Pak</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="./images/icia.jpg" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#">mr.Pak</a>
                                                    </h5>
                                                    <span class="email">johndoe@example.com</span>
                                                </div>
                                            </div>
                                             
                                             <div class="account-dropdown__footer">
                                             <a href="./"><i class="fas fa-igloo"></i>MainPage</a>
                                             </div>
                                             
                                            <div class="account-dropdown__footer">
                                                <a id="logout" href="#" onclick="logoutGo()"> 
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                                    
                                                                                                   
                                  <form action="logout" name="logoutform" method="post">
                                  <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                  </form>
                                                    
                                            </div>
                                            
                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
             <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">

                        <div class="row" style="height: 1000px">
                            <div class="col-md-12" >
                                    <iframe id="contents" name="contents" width="100%" height="100%" src="adminchartmove">
                                    
                                    </iframe>


                            </div>

                        </div>



                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="adminPage/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="adminPage/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS -->
    <script src="adminPage/vendor/slick/slick.min.js">
    </script>
    <script src="adminPage/vendor/wow/wow.min.js"></script>
    <script src="adminPage/vendor/animsition/animsition.min.js"></script>
    <script src="adminPage/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="adminPage/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="adminPage/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="adminPage/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="adminPage/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="adminPage/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="adminPage/vendor/select2/select2.min.js">
    </script>

    <script type="text/javascript">
    function logoutGo() {
      
      var logoutform=document.logoutform;
      logoutform.submit();
      
   }
    
  //대출차트
    var dataCnt=new Array();
    var dataName=new Array();
    
    
    $.ajax({
       type : 'get',
       url :"barchart",
       async: false,   //true:동기, false:비동기 
       success : function(result) {
           console.log("데이타는?",result);
           Object.entries(result);
           var res=Object.entries(result);
           console.log("배열",res);
           console.log("0배열",res[0]);
           /* for(var i=0;i<result.length;i++){
          console.log("데이타는i?",result[i].cnt);
           dataName[i]=result[i].bd_bo_num;
           dataCnt[i]=result[i].cnt;
           }
           console.log(dataCnt);
           console.log(dataName);
       */
   
       for (var prop in result) {
             console.log(prop, result[prop]); // a 1, b 2, c 3
            dataName.push(prop);
             dataCnt.push(result[prop]);
            
         }
       console.log("월",dataName.sort(function(a,b){
          
          return a-b;
       }));
       console.log(dataCnt);
       
         },
       error : function(xhr, status) {
         }
       
       
    }); //end ajax 
   

    data = {
            datasets: [{
               label:"",
                backgroundColor: [
                    'rgba(255,99,13,0.5)',
                    'rgba(54,162,235,0.5)',
                    'rgba(255,206,86,0.5)',
                    'rgba(75,192,192,0.5)',
                    'rgba(153,102,255,0.5)',
                    'rgba(255,159,64,0.5)',
                    'rgba(105,159,13,0.5)',
                    'rgba(30,199,13,0.5)',
                    'rgba(30,199,123,0.5)',
                    'rgba(40,139,50,0.5)',
                ],
                data: dataCnt
            }], 
        labels:[dataName[0]+"월",dataName[1]+"월",dataName[2]+"월",dataName[3]+"월",dataName[4]+"월",dataName[5]+"월",dataName[6]+"월",dataName[7]+"월",dataName[8]+"월",dataName[9]+"월",dataName[10]+"월",dataName[11]+"월"]//이름
        }; 
    
 // bar 차트 
    var ctx1 = document.getElementById("myChart1"); 
    var myBarChart = new Chart(ctx1, { type: 'bar', data: data, options: { 
        legend:{
        display:false
    },
    title:{
        display:true,
        text:'월별 도서관 전체 대출현황'   //차트 제목
    }
        
    } });
    
  //대출차트
    var dataCnt=new Array();
    var dataName=new Array();
    $.ajax({
       type : 'get',
       url :"piechart",
       async: false,   //true:동기, false:비동기 
       success : function(result) {
           // $('#borrowCnt').html(data).css('color', 'black').css('font-weight','bold');
           console.log("데이타는?",result);
           console.log("데이타는?",result[0].bg_cate);
           for(var i=0;i<result.length;i++){
           console.log("데이타는i?",result[i].cnt);
           dataName[i]=result[i].bg_cate;
           dataCnt[i]=result[i].cnt;
           }
           console.log(dataCnt);
           console.log(dataName);

         },
       error : function(xhr, status) {
         }
       
       
    }); //end ajax 


    data = {
            datasets: [{
                backgroundColor: [
                    'rgba(255,99,13,0.5)',
                    'rgba(54,162,235,0.5)',
                    'rgba(255,206,86,0.5)',
                    'rgba(75,192,192,0.5)',
                    'rgba(153,102,255,0.5)',
                    'rgba(255,159,64,0.5)',
                    'rgba(105,159,13,0.5)',
                    'rgba(30,199,13,0.5)',
                    'rgba(30,199,123,0.5)',
                    'rgba(40,139,50,0.5)',
                ],
                data: dataCnt
            }], 
        labels: dataName //이름
        }; 




    // 가운데 구멍이 없는 파이형 차트 
    var ctx1 = document.getElementById("myChart2"); var myPieChart = new Chart(ctx1, { type: 'pie', data: data, options: {
        title:{
        display:true,
        text:'장르별 대출 추이'   //차트 제목
    }
        
    } });
    </script>



    <!-- Main JS-->
    <script src="adminPage/js/main.js"></script>

   <script type="text/javascript" src="js/librarianMove.js"></script>

</body></html>
<!-- end document-->