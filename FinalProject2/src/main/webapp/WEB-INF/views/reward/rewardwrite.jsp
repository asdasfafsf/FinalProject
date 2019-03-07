<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="/test/resources/js/common/jquery-3.3.1.js"></script>
<script src="/test/resources/js/reward/RewardWrite.js"></script>
<script src="/test/resources/js/common/TextEditor.js"></script>
<link rel="stylesheet" href="/test/resources/css/reward/RewardWrite.css">
<link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css">
<link rel="stylesheet" href="/test/resources/css/common/TextEditor.css">
<body>
  <div class="reward-header">

        <ul class="reward-menu">
            <li>기본 정보</li>
            <li>진행자 정보</li>
            <li>스토리</li>
            <li>리워드</li>
            <li>오픈예정</li>
            <li>정산</li>
            <div class="list-select-bar"></div>
        </ul>
    </div>
    
    

    <div class="reward-section">
        <div class="reward-warning">
            <p style="font-weight:bold; font-size:1.8em; color:rgba(255,0,0,0.8)">주의!</p>
            <p style="font-size: 1.2em;">모든 변경 사항은 저장하기를 누르지 않으면 저장되지 않습니다!</p>
        </div>

        <div class="reward-content-wrapper">
            <div class="reward-contents">

                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 번호</p>
                    <p class="assist">프로젝트의 번호가 부여됩니다. 프로젝트가 오픈되면 해당 URL로 프로젝트로 진입할 수 있습니다.</p>

                    

                    <div class="reward-content-hide">
                        <p class="plain">http://www.wadiz.com/project/reward/</p>
                        <p class="assist">프로젝트 URL이 생성되었습니다. 프로젝트가 오픈되면 해당 URL로 접속할 수 있습니다!</p>
                    </div>
                </div>



                <div class="reward-content-line"></div>

                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 이름</p>
                    <p class="assist">프로젝트의 이름을 프로젝트의 성격과 리워드를 짐작할 수 있게 간결하게 입력해주세요.</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectName">
                    </div>

                    <div class="reward-content-hide">
                        <input placeholder="무선 블루투스 이어폰!" name="rewardTitle" type="text" class="simple-text" maxlength="20">
                        <p class="textLimit">0/20</p>

                        <div class="btn-area">
                            <button class="reward-btn-ok">저장</button>
                        </div>
                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 짧은이름</p>
                    <p class="assist">프로젝트의 이름을 입력해주세요!</p>

                    
                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectShortName">
                    </div>

                    <div class="reward-content-hide">
                        <input placeholder="#코드리스이어폰" name="rewardShortTitle" type="text" class="simple-text" maxlength="20">
                        <p class="textLimit">0/20</p>

                        <div class="btn-area">
                            <button class="reward-btn-ok">저장</button>
                        </div>
                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 대표사진</p>
                    <p class="assist">프로젝트를 대표하는 이미지를 올려주세요!</p>

                    
                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectRepresentImg">
                    </div>

                    <div class="reward-content-hide">
                        <label for="reward-project-photo1" class="reward-img-upload-label"
                            style="width:300px; height:300px;"></label>
                        <input type="file" name="rewardProjectRepresentPhoto" id="reward-project-photo1" style="display:none;">

                        <div class="btn-area">
                            <button class="reward-btn-ok">저장</button>
                        </div>
                    </div>
                </div>



                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 분류</p>
                    <p class="assist">프로젝트의 카테고리를 정해주세요!</p>

                    
                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectCategory">
                    </div>

                    <div class="reward-content-hide">
                        <select class="reward-category-select" name="rewardCategory">
                            <c:forEach var="item" items="${category }" step="1" varStatus="status">
                            	<option value="${item.CATEGORYNO }">${item.CATEGORYNAME }</option>
                            </c:forEach>
                        </select>

                        <div class="btn-area">
                            <button class="reward-btn-ok">저장</button>
                        </div>
                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 소개</p>
                    <p class="assist">프로젝트에 대한 개요를 적어주세요! 제목과 연관성이 있어야합니다!</p>

                    
                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectIntroduce">
                    </div>

                    <div class="reward-content-hide">
                        <textarea class="reward-textarea" name="rewardProjectSynopsis" maxlength="80"></textarea>
                        <p class="textLimit">0/80</p>

          
                    </div>
                </div>


                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 목표금액</p>
                    <p class="assist">프로젝트의 목표 금액을 입력해주세요. 기간내에 달성하지 못한다면 프로젝트는 실패합니다!</p>

                    
                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectGoal">
                    </div>

                    <div class="reward-content-hide">
                        <input type="number" name="rewardGoal" class="simple-text" maxlength="20">
                        <p class="unit">원</p>

                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 완료일자</p>
                    <p class="assist">프로젝트의 목표 달성 기간을 입력하세요! 기간내에 달성하지 못한다면 프로젝트는 실패합니다!</p>

                    
                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectGoalDate">
                    </div>

                    <div class="reward-content-hide">
                        <input type="date" name="rewardDeadline" class="simple-text" maxlength="20">


            
                    </div>
                </div>


            </div>
        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 이름</p>
                    <p class="assist">프로젝트 진행자님의 이름을 입력해주세요! 입력하지 않으면 프로필에 기재된 이름이 등록됩니다!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectMCName">
                    </div>

                    <div class="reward-content-hide">
                        <input type="text" name="rewardMCName" class="simple-text" maxlength="20">
                        <p class="textLimit">0/20</p>

                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 소개</p>
                    <p class="assist">진행자님을 간단하게 소개해주세요!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectMCIntroduce">
                    </div>

                    <div class="reward-content-hide">
                        <textarea class="reward-textarea" name="rewardMCIntroduce" maxlength="40"></textarea>
                        <p class="textLimit">0/40</p>

                   
                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 프로필사진</p>
                    <p class="assist">진행자님의 프로필 사진을 올려주세요! 업로드하지 않으면 회원정보에 저장된 프로필 사진이 등록됩니다!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectMCPhoto">
                    </div>

                    <div class="reward-content-hide">
                        <label for="reward-project-photo2" class="reward-img-upload-label"
                            style="width:200px; height:200px;"></label>
                        <input type="file" name="rewardMCProfilePhoto" id="reward-project-photo2" style="display:none;">

                    </div>
                </div>


                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 홈페이지</p>
                    <p class="assist">프로젝트 진행자님의 홈페이지가 있다면 기재해주세요!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectMCUrl">
                    </div>

                    <div class="reward-content-hide">
                        <p class="urlheader">홈페이지 1&nbsp;&nbsp;</p>
                        <input type="url" name="rewardMCUrl1" class="simple-url" maxlength="20">

                        <br>
                        <p class="urlheader">홈페이지 2&nbsp;&nbsp;</p>
                        <input type="url" name="rewardMCUrl2" class="simple-url" maxlength="20">
                        <br>
                        <p class="urlheader">홈페이지 3&nbsp;&nbsp;</p>
                        <input type="url" name="rewardMCUrl3" class="simple-url" maxlength="20">
                        <br>
                     
                    </div>
                </div>

            </div>


        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 소개 미디어</p>
                    <p class="assist">프로젝트를 소개할 영상이나 대표 이미지를 업로드해주세요! 비디오는 mp4 파일만 가능하며 미리보기는 지원하지 않습니다!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectStoryMedia">
                    </div>

                    <div class="reward-content-hide">
                        <label for="reward-project-photo3" class="reward-img-upload-label"
                            style="width:600px; height:300px;"></label>
                        <input type="file" name="rewardProjectIntroduceMedia" id="reward-project-photo3" style="display:none;">

                 
                    </div>
                </div>

                <div class="reward-content-line"></div>

                <div id="reward-project-story" class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 스토리</p>
                    <p class="assist">프로젝트 스토리를 입력해주세요!</p>

                    <div class="hidden-data-area">
                        <input name="rewardProjectStory" type="hidden" value="0" name="isModifiedProjectStory">
                    </div>



                    <div class="reward-content-hide">


                    
                    </div>
                </div>

            </div>

        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">리워드?</p>
                    <p class="assist">프로젝트의 리워드 목록을 작성할 수 있습니다!</p>



                    <div class="reward-content-hide">
                        <div class="btn-area">
                            <button id="reward-content-reward-add-btn" class="reward-btn-ok">추가하기</button>
                        </div>
                    </div>


                </div>
            </div>

            <div class="reward-contents reward-subcontents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">리워드 #1</p>
                    <p class="assist">리워드의 상세사항을 적어주세요!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectReward">
                    </div>

                    <div class="reward-content-hide">
                        <div class="reward-content-reward">


                            <div class="reward-sequence">
                                <p class="reward-title">리워드 정렬순서</p>
                                <input type="number" style="width:200px;" class="simple-text">
                                <p class="unit">번째</p>
                            </div>

                            <div class="reward-price-area">
                                <p class="reward-title">리워드 금액</p>
                                <input type="number" class="simple-text">
                                <p class="unit">원</p>
                            </div>
                            <div class="reward-reward-limit-area">

                                <p class="reward-title">리워드 제한 수량</p>
                                <input type="number" class="simple-text">
                                <p class="unit">개</p>
                            </div>

                            <div class="reward-title-area">
                                <p class="reward-title">리워드 제목</p>
                                <input type="text" class="simple-text" style="text-align:left;" maxlength="20">
                                <p class="textLimit">0/20</p>
                            </div>

                            <div class="reward-detail-area">
                                <p class="reward-title" style="vertical-align: top;">리워드 설명</p>
                                <textarea contenteditable="true" class="reward-detail" maxlength="60"></textarea>
                                <p class="textLimit" style="vertical-align: bottom;">0/60</p>
                            </div>

                            <div class="reward-option-area">
                                <p class="reward-title">
                                    리워드 옵션
                                </p>

                                <div class="reward-option-detail-area">
                                    <div class="reward-option-select">
                                        <label class="reward-option-select-btn reward-option-label">선택형</label>
                                        <p style="display:inline-block;" class="assist">색상, 사이즈 등 선택할 수 있는 옵션이 있으면
                                            추가해주세요!</p>


                                        <div class="reward-option-select-hidden">
                                            <input type="text" maxLength="60" class="reward-option-text">
                                            <button style="width:50px; height:25px; vertical-align: middle;"
                                                class="reward-btn-ok reward-option-add" type="button">추가</button>

                                            <ul class="reward-option-ul select-ul">
                                                <li>
                                                    <p class="assist-inline">안녕</p>
                                                    <button type="button"
                                                        style="vertical-align: middle; width:45px; height:20px;"
                                                        class="reward-btn-cancel reward-option-delete">삭제</button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="reward-option-input">
                                        <label class="reward-option-input-btn reward-option-label">입력형</label>
                                        <p style="display:inline-block;" class="assist">각인 등, 사용자에게 추가 옵션 정보를 입력받아야 한다면
                                            추가해주세요!</p>

                                        <div class="reward-option-select-hidden">
                                            <input type="text" maxLength="60" class="reward-option-text">
                                            <button style="width:50px; height:25px; vertical-align: middle;"
                                                class="reward-btn-ok reward-option-add" type="button">추가</button>

                                            <ul class="reward-option-ul input-ul">
                                                <li>
                                                    <p class="assist-inline">안녕?</p>
                                                    <button type="button"
                                                        style="vertical-align: middle; width:45px; height:20px;"
                                                        class="reward-btn-cancel reward-option-delete">삭제</button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="reward-delivery-address-area">
                                <p class="reward-title">배송지 여부</p>
                                <label for="need-delivery-address" class="reward-delivery">필요함</label>
                                <label for="needless-delivery-address" class="reward-delivery">필요없음</label>
                                <input type="hidden" name="needDelivery">
                            </div>

                            <div class="reward-delivery-price-area">
                                <p class="reward-title">배송비</p>
                                <input type="number" style="width:120px" class="simple-text">
                                <p class="unit">원</p>
                            </div>


                            <div class="reward-delivery-date-area">
                                <p class="reward-title">예상 배송일</p>
                                <p class="unit">프로젝트 시작 후</p>
                                <input type="number" style="width:120px" class="simple-text">
                                <p class="unit">일 이후부터</p>
                                <input type="number" style="width:120px" class="simple-text">
                                <p class="unit">일 내에 배송됩니다.</p>
                            </div>

                        </div>

                        <div class="btn-area">
                            <button class="reward-content-reward-btn-ok reward-btn-ok">저장</button>
                            <button class="reward-content-reward-btn-delete reward-btn-cancel">삭제</button>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">오픈예정</p>
                    <p class="assist">프로젝트를 시작하기 전에 얼마간의 대기기간을 가질 수 있습니다!</p>

                    <div class="reward-content-hide">


                      
                    </div>
                </div>
            </div>


        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">정산</p>
                    <p class="assist">프로젝트가 성공하면 돈을 지불받을 계좌를 설정합니다!</p>

                    <div class="reward-content-hide">


                       
                    </div>
                </div>

                <div class="reward-content-line"></div>

                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">통장 사본</p>
                    <p class="assist">지불받을 계좌의 통장 사본을 업로드 해주세요!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" name="isModifiedProjectMCPhoto">
                    </div>

                    <div class="reward-content-hide">
                        <label for="reward-project-photo3" class="reward-img-upload-label"
                            style="width:600px; height:250px;"></label>
                        <input type="file" id="reward-project-photo3" style="display:none;">

                  
                    </div>
                </div>
            </div>

        </div>

        <button style="display:block; onclick="saveReward(${pageContext.request.ContextPath })" margin:20px auto; width:150px; height:50px; font-size:1.1em;"
            class="reward-btn-ok">저장하기</button>

    </div>

</body>
</html>