<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <style>
        /* 폰트 */
            /* 소제목용 */
        @font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
            /* 버튼용 */
        @font-face { font-family: 'yg-jalnan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff'); font-weight: normal; font-style: normal; }
    
        /* 대략적인 위치 잡기 (가운데 정렬은 text-align, display:inline-block으로 함) */
        body{
            margin:0;
            width:100%;
            text-align: center;
        }
        header{
            display:inline-block;
            width:1000px;
            height:55px;
            border-bottom:1px solid rgba(0, 0, 0, 0.2);
        }
        section{
            display: inline-block;
            width:1000px;
            /* border:1px solid black; */
        }
    
        /* 내정보 메인 있는 부분 */
        div#mypage-container{
            margin-top:60px;
            width:1000px;
            text-align: center;
            display:inline-block;
            font-family: 'NIXGONM-Vb',바탕;
        }
        div#myInfo-container{
            display:inline-block;
            width:800px;
            height:250px;
        }

        div#myInfo-container>h1{
            text-align:left;
            margin-bottom:20px;
            font-size: 40px;
        }
        
        div#funding-menu{
            width:1000px;
            height:40px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.2);
        }
        div.btn-fund-menu{
            width:497px;
            height:40px;
            text-align: center;
            line-height: 2;
            display:inline-block;
        }
        div.btn-fund-menu:hover{
            border-bottom: 2px solid rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }
        div#funding-container{
            width:1000px;
            padding:15px;
            text-align: left;
            clear: both;
        }
        div.funding-min{
            display:inline-block;
            width:300px;
            height:300px;
            border:1px solid rgba(0, 0, 0, 0.2);
            opacity: 0.8;
            margin:3px;
        }
        div.funding-min:hover{
            border:1px solid rgba(0, 0, 0, 0.5);
            opacity: 1.3;
        }

        div#funding-filter{
            float: right;
            margin-top:15px;
        }
    </style>
</head>
<body>
    <header>여기에 메뉴가 들어가요!</header>
    <nav></nav>
    <section>
        <div id='mypage-container'>
            <div id='myInfo-container'>
                <h1>id</h1>
            </div>
            <div id='funding-menu'>
                <div class='btn-fund-menu' id='made'>내가 만든 펀딩</div>
                <div class='btn-fund-menu' id='join'>참여한 펀딩</div>
            </div>
            <div id="funding-filter">
                <label>
                    <small>분류</small>
                    <small>
                        <select id='filter'>
                            <option value='all' selected>전체</option>
                            <option value='continue'>진행중인 펀딩</option>
                            <option value='finished'>종료된 펀딩</option>
                        </select>
                    </small>
                </label>
            </div>
            <div id='funding-container'>
                <div class='funding-min'></div>
                <div class='funding-min'></div>
                <div class='funding-min'></div>
                <div class='funding-min'></div>
            </div>
        </div>
    </section>
    <footer></footer>
</body>
</html>