<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyProfile</title>
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
        }
    
        /* 프로필 전체 내용*/
        div#myProfile-container{
            width:1000px;
            display: inline-block;
            text-align: center;
            font-family: 'NIXGONM-Vb',바탕;
        }
        div#myInfo-container{
            margin-top:30px;
        }
        div#myInfo-container>img{
            width:150px;
            height: 150px;
            border:1px solid  rgba(0, 0, 0, 0.2);
            border-radius: 25px;
        }
        div#myInfo-container>h1{
            margin-top:10px;
            margin-bottom:30px;
            font-size: 35px;
        }

        /* 정보 변경 탭*/
        div#myProfile-menu{
            width:450px;
            display:inline-block;
            text-align: center;
        }
        div#myProfile-menu>table{
            width:450px;
            display: inline-block;
            text-align: center;
        }
        div#myProfile-menu>table>tr{
            line-height: 2;
            text-align: right;
        }

        a#outUser{
            color:black;
        }


        div#myProfile-menu>div:first-of-type{
            border-top: 1px solid  rgba(0, 0, 0, 0.2);
            border-bottom: 1px solid  rgba(0, 0, 0, 0.2);
            padding:15px;
        }
        div#myProfile-menu>div{
            border-bottom: 1px solid  rgba(0, 0, 0, 0.2);
            padding:15px;
            width:400px;
            display:inline-block;
            cursor: pointer;
        }
        div#myProfile-menu>div:hover{
            border-bottom: 1px solid  rgba(0, 0, 0, 0.2);
            padding:15px;
            width:400px;
            display:inline-block;
            cursor: pointer;
            background-color: rgba(208,204,232,0.2);
        }

        div#myProfile-menu>div small{
            font-size:10px;
        }

        div#myProfile-menu>div>
        div#myProfile-menu>div>label>div>span{
            color : rgba(0, 0, 0, 0.1);
            font-size: 25px;
            float: right;
        }
        div#myProfile-menu>span{
            padding:5px;
            margin-left:15px;
            float: left;
            font-size:20px;
        }

        .myProfile-text{
            cursor: pointer;
            display: inline-block;
            width:370px;
            margin:0;
            padding:0;
        }
        .myProfile-btn{
            cursor: pointer;
            display: inline-block;
            width:20px;
            margin:0;
            padding:0;
        }
        .myProfile-btn>span{
            color : rgba(0, 0, 0, 0.2);
            font-size: 25px;
            float: right;
        }
        
    </style>
</head>
<body>
    <header>여기에 메뉴가 들어가요!</header>
    <nav></nav>
    <section>
        <div id='myProfile-container'>
            <div id='myInfo-container'>
                <img/>
                <h1>id</h1>
            </div>
            <div id='myProfile-menu'>
                <span><label>내정보 설정</label></span>
                <div id='editUserProfile'>
                    <label>
                        <div class='myProfile-text'>
                            <img/>회원정보 변경
                            <br/>
                            <small>프로필, 이메일, 이름, 휴대폰 등</small>
                        </div>
                        <div class='myProfile-btn'>
                            <span>></span>
                        </div>
                    </label>
                </div>
                <div id='editAddress'>
                    <label>
                        <div class='myProfile-text'>
                            <img/>
                            주소록 설정
                            <br/>
                            <small>배송지 추가, 변경, 삭제</small>
                        </div>
                        <div class='myProfile-btn'>
                            <span>></span>
                        </div>
                    </label>
                </div>
                <div id='editAccount'>
                    <label>
                        <div class='myProfile-text'>
                            <img/>
                            결제정보 변경
                            <br/>
                            <small>결제 계좌 변경</small>
                        </div>
                        <div class='myProfile-btn'>
                            <span>></span>
                        </div>
                    </label>
                </div>
                <div id='editPassword'>
                    <label>
                        <div class='myProfile-text'>
                            <img/>
                            비밀번호 변경
                            <br/>
                            <small>비밀번호 재설정</small>
                        </div>
                        <div class='myProfile-btn'>
                            <span>></span>
                        </div>
                    </label>
                </div>
                <br/>
                <a id='outUser' href="${pageContext.request.contextPath }/leave"><small>회원탈퇴</small></a>
            </div>
        </div>
    </section>
    <footer></footer>
    
    <script>
    	$(function(){
    		$('#editUserProfile').click(function(){
    			location.href="${pageContext.request.contextPath }/myprofile/modify/basic"
    		});
    		$('#editAddress').click(function(){
    			location.href="${pageContext.request.contextPath }/myprofile/modify/address"
    		});
    		$('#editAccount').click(function(){
    			location.href="${pageContext.request.contextPath }/myprofile/modify/account"
    		});
    		$('#editPassword').click(function(){
    			location.href="${pageContext.request.contextPath }/myprofile/modify/password"
    		});
    	});
    </script>
</body>
</html>