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
        div#address-container{
            width:1000px;
            display: inline-block;
            text-align: center;
            font-family: 'NIXGONM-Vb',바탕;
        }
        div#address-container>div{
            margin:5px;
        }
        table#address-table{
            width:700px;
            margin-top:30px;
            display:inline-block;
            text-align:center;
       }
        table#address-table>tbody{
            width:100%;
            display: inline-block;
            text-align: center;
        }
        .addressName{
            width:100px;
        }
        .name{
            width:70px;
        }
        .address{
            width:400px;
        }
        .phone{
            width:100px;
        }
        .select{
            width:150px;
        }

        #addAddress{
            width:100px;
            background-color: white;
            color:#D0CCE8;
            border:2px solid #D0CCE8;
            padding:3px;
            border-radius: 15px;
            line-height: 1.5;
            outline: none;
        }
        #addAddress:hover{
            width:100px;
            background-color: #D0CCE8;
            color:white;
            padding:3px;
            border-radius: 15px;
            line-height: 1.5;
        }

        .edit{
            width:45px;
            border:1px solid black;
            background-color: white;
            border-radius:10px;
            outline: none;
        }
        .delete{
            width:45px;
            border:1px solid black;
            background-color: white;
            border-radius:10px;
            outline: none;
        }

        #plusAccount{
            height:30px;
            border:1px solid rgba(0, 0, 0, 0.1);
            background-color: #D0CCE8;
        }
    </style>
</head>
<body>
    <header>깔끔한 메뉴가 여기에!!</header>
    <nav></nav>
    <section>
        <div id='address-container'>

            <h2>주소록 설정</h2>
            
            <div>새로운 주소를 등록하시려면 : <button id='addAddress'>주소록 추가</button></div>

            <table id='address-table'>
                <tr>
                    <th>배송지명</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>연락처</th>
                    <th>선택</th>
                </tr>
                <tr>
                    <td class='addressName'></td>
                    <td class='name'></td>
                    <td class='address'></td>
                    <td class='phone'></td>
                    <td class='select'>
                        <button class='edit'>수정</button>
                        <button class='delete'>삭제</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" id='plusAccount'>
                        + 추가
                    </td>
                </tr>
            </table>
        </div>
    </section>
    <footer></footer>
</body>
</html>