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
        div#account-container{
            width:1000px;
            display: inline-block;
            text-align: center;
            font-family: 'NIXGONM-Vb',바탕;
        }
        div#myInfo-container{
            margin-top:10px;
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
        
        /* 프로필 전체 내용*/
        div#account-container{
            width:1000px;
            display: inline-block;
            text-align: center;
            font-family: 'NIXGONM-Vb',바탕;
        }
        table#account-table{
            width:700px;
            margin-top:30px;
            display:inline-block;
            text-align:center;
       }
        table#account-table>tbody{
            width:100%;
            display: inline-block;
            text-align: center;
        }
        .bankName{
            width:200px;
        }
        .accountNo{
            width:400px;
        }
        .selectBtn{
            width:100px;
        }

    </style>
</head>
<body>
    <header>멋진 메인 헤더 메뉴가 있을거야!</header>
    <nav></nav>
    <section>
        <div id='account-container'>
            <h2>결제정보 변경</h2>
            <table id='account-table'>
                <tr>
                    <th>은행명</th>
                    <th>계좌번호</th>
                    <th>선택</th>
                </tr>
                <tr>
                    <td class='bankName'></td>
                    <td class='accountNo'></td>
                    <td class='selectBtn'>
                        <button>삭제</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id='plusAccount'>
                        + 추가
                    </td>
                </tr>
            </table>
        </div>
    </section>
    <footer></footer>
</body>
</html>