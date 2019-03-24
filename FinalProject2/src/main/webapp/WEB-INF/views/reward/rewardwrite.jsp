<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>
  <link href="https://fonts.googleapis.com/css?family=Bree+Serif|Open+Sans" rel="stylesheet">
<script src="/test/resources/js/common/jquery-3.3.1.js"></script>
<script src="/test/resources/js/reward/RewardWrite.js"></script>
<script src="/test/resources/js/reward/RewardWriteSave.js"></script>
<script src="/test/resources/js/reward/RewardValidate.js"></script>
<script src="/test/resources/js/common/TextEditor.js"></script>
<script src="/test/resources/js/common/context.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>

<link rel="stylesheet" href="/test/resources/css/reward/RewardWrite.css">
<link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css">
<link rel="stylesheet" href="/test/resources/css/common/TextEditor.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/registerAccount.js"></script> <!-- 통장인증 js --> 
        <div class="reward-warning">
            <p style="font-weight:bold; font-size:1.8em; color:rgba(255,0,0,0.8)">주의!</p>
            <p style="font-size: 1.2em;">모든 변경 사항은 저장하기를 누르지 않으면 저장되지 않습니다!</p>     
        </div>
        
        <div class="reward-menu-introduce" style='font-family:"NanumSquareRound"; font-size:0.8em; background-color:rgba(248,248,248,1); width:850px; margin:20px auto; padding-top:5px; padding-bottom:5px;'>
        	<div style='margin:10px; color:gray; font-size:1.2em;'>
        		<div style='background-image:url("${pageContext.request.contextPath}/resources/images/reward/advertising.png")'class='reward-menu-check-icon'></div>
        		프로젝트를 완성하려면 모든 메뉴를 검토 요청이 가능한 상태로 만들어야 합니다!</div>
        	
        	<div style='margin:10px; color:gray;'><div class='reward-menu-check-icon reward-menu-no-save' style='display:inline-block;'></div>
        		해당 탭이 저장되지 않았을 경우
        	</div>
        	<div style='margin:10px; color:gray;'><div class='reward-menu-check-icon reward-menu-save' style='display:inline-block;'></div>
        		해당 탭이 저장은 되었지만 요구사항을 만족하지 않아 검토를 요청할 수 없는 경우
        	</div>
        	<div style='margin:10px; color:gray;'><div class='reward-menu-check-icon reward-menu-complete' style='display:inline-block;'></div>
        		해당 탭이 현재 검토를 요청할 수 있는 상태일 경우
        	</div>
        </div>

  	<div class="reward-header" id="reward-write-header">

        <ul class="reward-menu">
            <li><div class='reward-menu-check-icon reward-menu-save'></div>기본 정보</li>
            <li><div class='reward-menu-check-icon reward-menu-save'></div>진행자 정보</li>
            <li><div class='reward-menu-check-icon reward-menu-save'></div>스토리</li>
            <li><div class='reward-menu-check-icon reward-menu-save'></div>리워드</li>
            <li><div class='reward-menu-check-icon reward-menu-save'></div>오픈예정</li>
            <li><div class='reward-menu-check-icon reward-menu-save'></div>정산</li>

            <div id="reward-preview-btn" >미리보기</div>
            <div id="reward-check-btn" >검토 요청하기</div>
        </ul>
    </div>
    
    <div class="reward-section-background" style="background-color:rgba(248,248,248,1);">
    <div class="reward-section" style='background-color:rgba(248,248,248,1);'>
    <br>

        <div class="reward-content-wrapper">
            <div class="reward-contents">
				<form id="rewardProjectForm" method="post" action="${pageContext.request.contextPath }/project/reward/updateBasicInfo" enctype="multipart/form-data">
                <input type="hidden" value="0" class="isModified">
                
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 번호</p>
                    <p class="assist">프로젝트의 번호가 부여됩니다. 프로젝트가 오픈되면 해당 URL로 프로젝트로 진입할 수 있습니다.</p>

                    

                    <div class="reward-content-hide">
                        <p class="plain">http://www.wadiz.com/project/reward/${rewardNo }</p>
                        <p class="assist">프로젝트 URL이 생성되었습니다. 프로젝트가 오픈되면 해당 URL로 접속할 수 있습니다!</p>
                        <input type="hidden" name="rewardNo" value="${reward.no }">
                    </div>
                </div>



                <div class="reward-content-line"></div>

                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 이름</p>
                    <p class="assist">프로젝트의 이름을 프로젝트의 성격과 리워드를 짐작할 수 있게 간결하게 입력해주세요.</p>


                    <div class="reward-content-hide">
                        <input placeholder="무선 블루투스 이어폰!" name="rewardTitle" type="text" class="simple-text" maxlength="20"  value="${reward.name }">
                        <p class="textLimit">${fn:length(reward.name)}/20</p>

                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 짧은이름</p>
                    <p class="assist">프로젝트의 이름을 입력해주세요!</p>

                    <div class="reward-content-hide">
                        <input placeholder="#코드리스이어폰" name="rewardShortTitle" type="text" class="simple-text" maxlength="20" value="${reward.shortName }">
                        <p class="textLimit">${fn:length(reward.shortName)}/20</p>

                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 대표사진</p>
                    <p class="assist">프로젝트를 대표하는 이미지를 올려주세요!</p>


                    <div class="reward-content-hide">
                        <label for="reward-project-photo1" class="reward-img-upload-label"
                            style='width:300px; height:300px; background-image:url("${pageContext.request.contextPath}/${reward.representImage }")'></label>
                        <input type="file" name="file" id="reward-project-photo1" style="display:none;">

                    </div>
                </div>



                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 분류</p>
                    <p class="assist">프로젝트의 카테고리를 정해주세요!</p>

                  
                    <div class="reward-content-hide">
                        <select class="reward-category-select" name="rewardCategory">
                            <c:forEach var="item" items="${category }" step="1" varStatus="status">
                            	<option value='${item.CATEGORYNO }' <c:if test="${item.CATEGORYNO == reward.categoryNo}">selected</c:if> >${item.CATEGORYNAME }</option>
                            </c:forEach>
                        </select>

                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 소개</p>
                    <p class="assist">프로젝트에 대한 개요를 적어주세요! 제목과 연관성이 있어야합니다!</p>

                    
                    <div class="reward-content-hide">
                        <textarea class="reward-textarea" name="rewardSynopsis" maxlength="80">${reward.synopsis }</textarea>
                        <p class="textLimit">${fn:length(reward.synopsis)}/80</p>

          
                    </div>
                </div>


                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 목표금액</p>
                    <p class="assist">프로젝트의 목표 금액을 입력해주세요. 기간내에 달성하지 못한다면 프로젝트는 실패합니다! 최대 목표액은 20억입니다.</p>

                    <div class="reward-content-hide">
                        <input type="number" max="2000000000" value="${reward.goal }"name="rewardGoal" class="simple-text" maxlength="20">
                        <p class="unit">원</p>

                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 완료일자</p>
                    <p class="assist">프로젝트의 목표 달성 기간을 입력하세요! 기간내에 달성하지 못한다면 프로젝트는 실패합니다!</p>

                    

                    <div class="reward-content-hide">
                        <input type="date" id="rewardDeadline" name="rewardDeadline" class="simple-text" maxlength="20">


            
                    </div>
                </div>

				</form>
            </div>
            
        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
            	<form id="rewardMCForm" method="post" action="${pageContext.request.contextPath }/project/reward/updateMCInfo" enctype="multipart/form-data">
                <input type="hidden" value="0" class="isModified">
                
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 이름</p>
                    <p class="assist">프로젝트 진행자님의 이름을 입력해주세요! 입력하지 않으면 프로필에 기재된 이름이 등록됩니다!</p>

                    <div class="reward-content-hide">
                        <input type="text" value="${reward.mcName }"name="rewardMCName" class="simple-text" maxlength="20">
                        <p class="textLimit">${fn:length(reward.mcName)}/20</p>

                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 소개</p>
                    <p class="assist">진행자님을 간단하게 소개해주세요!</p>

                    <div class="reward-content-hide">
                    	<input type="hidden" name="rewardNo" value="${reward.no }">
                        <textarea class="reward-textarea" name="rewardMCIntroduce" maxlength="40">${reward.mcIntroduce }</textarea>
                        <p class="textLimit">${fn:length(reward.mcIntroduce)}/40</p>

                   
                    </div>
                </div>

                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 프로필사진</p>
                    <p class="assist">진행자님의 프로필 사진을 올려주세요! 업로드하지 않으면 회원정보에 저장된 프로필 사진이 등록됩니다!</p>

                    <div class="reward-content-hide">
                        <label for="reward-project-photo2" class="reward-img-upload-label"
                            style='width:200px; height:200px; background-image:url("${pageContext.request.contextPath}/${reward.mcProfilePhoto}")'></label>
                        <input type="file" name="file" id="reward-project-photo2" style="display:none;">

                    </div>
                </div>


                <div class="reward-content-line"></div>
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">진행자 홈페이지</p>
                    <p class="assist">프로젝트 진행자님의 홈페이지가 있다면 기재해주세요!</p>

                    <div class="reward-content-hide">
                        <p class="urlheader">홈페이지 1&nbsp;&nbsp;</p>
                        <input type="url" value="${reward.mcURL1 }"name="rewardMCUrl1" class="simple-url" maxlength="20">

                        <br>
                        <p class="urlheader">홈페이지 2&nbsp;&nbsp;</p>
                        <input type="url" value="${reward.mcURL2 }" name="rewardMCUrl2" class="simple-url" maxlength="20">
                        <br>
                        <p class="urlheader">홈페이지 3&nbsp;&nbsp;</p>
                        <input type="url" value="${reward.mcURL3 }" name="rewardMCUrl3" class="simple-url" maxlength="20">
                        <br>
                     
                    </div>
                </div>
                </form>

            </div>


        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">프로젝트 소개 미디어</p>
                    <p class="assist">프로젝트를 소개할 영상이나 대표 이미지를 업로드해주세요! 비디오는 mp4 파일만 가능하며 미리보기는 지원하지 않습니다!</p>
 
					<form id="projectStoryForm" method="post" action="${pageContext.request.contextPath }/project/reward/updateStory" enctype="multipart/form-data">
                    <div class="reward-content-hide">
                        <label for="reward-project-photo3" class="reward-img-upload-label"
                            style='width:600px; height:300px; background-image:url("${pageContext.request.contextPath}${reward.storyMedia }")'></label>
                        <input type="file" name="file" id="reward-project-photo3" style="display:none;">

                 
                    </div>
                    </form>
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
                      <div class="text-editor-wrapper">


        <div id="text-editor-fontsize-option" class="text-editor-select-wrapper">
            <input type="text" style="width:120px;" class="text-editor-select-input">
            <div class="text-editor-select-button"></div>
            <ul class="text-editor-select-option">
                <li style="font-size:10pt;">10</li>
                <li style="font-size:12pt;">12</li>
                <li style="font-size:14pt;">14</li>
                <li style="font-size:16pt;">16</li>
                <li style="font-size:20pt;">20</li>
                <li style="font-size:24pt;">24</li>
                <li style="font-size:32pt;">32</li>
                <li style="font-size:40pt;">40</li>
                <li style="font-size:48pt;">48</li>
                <li style="font-size:60pt;">60</li>
                <li style="font-size:72pt;">72</li>
            </ul>
        </div>


        <div id="text-editor-font-option" class="text-editor-select-wrapper">
            <input type="text" style="width:120px;" class="text-editor-select-input" disabled>
            <div class="text-editor-select-button"></div>
            <ul class="text-editor-select-option">
                <li style="font-family:Arial;">Arial</li>
                <li style="font-family:Arial Black;">Arial Black</li>
                <li style="font-family:Comic sans ms;">Comic sans ms</li>
                <li style="font-family:Courier New;">Courier New</li>
                <li style="font-family:Helvetica;">Helvetica</li>
                <li style="font-family:Impact;">Impact</li>
                <li style="font-family:굴림;">굴림</li>
                <li style="font-family:굴림체;">굴림체</li>
                <li style="font-family:궁서;">궁서</li>
                <li style="font-family:돋움;">돋움</li>
                <li style="font-family:돋움체;">돋움체</li>
            </ul>
        </div>

        <button style="font-weight:bold;" id="text-edit-bold" class="text-editor-button">
            B
            <input type="hidden" value="bold">
        </button>


        <button style="text-decoration: underline;" id="text-edit-underline" class="text-editor-button">
            U
            <input type="hidden" value="Underline">
        </button>

        <button style="font-style: italic;" id="text-edit-italic" class="text-editor-button">
            I
            <input type="hidden" value="Italic">
        </button>

        <button style="text-decoration:line-through;" id="text-edit-strike" class="text-editor-button">
            S
            <input type="hidden" value="strikeThrough">
        </button>

        <span style="position: relative">
        <button id="text-edit-color" class="text-editor-button-type2">
            A
            <input type="hidden" value="strikeThrough">
        </button>

        <div class="text-editor-color-pallete-wrapper" style="display:none; left:0px;">
            <div class="text-editor-color-pallete">
                <div class="text-editor-color-pallete2"></div>

                <div class="text-editor-color-dot">

                </div>

            </div>

            <div class="text-editor-color-pallete-bar">
                <div class="text-editor-color-pallete-bar-select"></div>
                <div class="text-editor-color-pallete-progress"></div>
            </div>

            <div class="text-editor-color-wrapper">
                <div class="text-editor-color" style="background-color:rgba(255,255,255,1);">

                </div>

            </div>
        </div>
    </span>

        <button id="text-edit-backgroundColor" class="text-editor-button-type2">
            A
            <input type="hidden" value="strikeThrough">
        </button>
   




        <button id="text-edit-imageupload" class="text-editor-imageupload">
            S
            <input type="hidden" value="superscript">
            <input type="file" id="text-editor-imageupload" style="display:none;">
        </button>
        ${reward.storyContentList }
        <div contentEditable="true" class="text-editor-content"><c:forEach items="${reward.storyContentList }" var="item"><div>${item.tag }</div></c:forEach></div>
    </div>


                    
                    </div>
                </div>

            </div>

        </div>
        <div class="reward-content-wrapper">
        	 <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">리워드?</p>
                    <p class="assist">리워드 작성 가이드를 볼 수 있습니다.</p>



                    <div class="reward-content-hide">
               			<div class="reward-menu-introduce" style='font-family:"NanumSquareRound"; font-size:0.8em; padding-top:5px; padding-bottom:5px;'>
        					
        					
        					<div style='margin:10px; color:gray; font-size:1.2em;'>
        						<div style='background-image:url("${pageContext.request.contextPath}/resources/images/reward/advertising.png")'class='reward-menu-check-icon'></div>
        							리워드의 상태는 다음과 같습니다.</div>
        	
        						<div style='margin:10px; color:gray;'><div class='reward-menu-check-icon reward-menu-no-save' style='display:inline-block;'></div>
        							해당 리워드가 저장되지 않았을 경우
        						</div>
        						<div style='margin:10px; color:gray;'><div class='reward-menu-check-icon reward-menu-save' style='display:inline-block;'></div>
        							해당 리워드가 저장은 되었지만 요구사항을 만족하지 않아 검토를 요청할 수 없는 경우
        						</div>
        						<div style='margin:10px; color:gray;'><div class='reward-menu-check-icon reward-menu-complete' style='display:inline-block;'></div>
        							해당 리워드가 요구사항을 모두 만족하여 현재 검토를 요청할 수 있는 상태일 경우
        						</div>
        						
        						<br>
        						
        						<div style='margin:10px; color:gray; font-size:1.2em;'>
        						<div style='background-image:url("${pageContext.request.contextPath}/resources/images/reward/advertising.png")'class='reward-menu-check-icon'></div>
        							리워드의 각 항목은 다음과 같습니다.</div>
        						
        						 <div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		리워드 정렬 순서
        						 	</div>
        							해당 리워드가 몇 번째로 표시될 것인지 결정합니다. 정렬 순서가 같을 경우 먼저 등록한 순서대로 정렬됩니다.
        						</div>
        						
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		리워드 금액
        						 	</div>
        							해당 리워드의 가격이 얼마인지 입력하세요!
        						</div>
        						
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		리워드 제한 수량
        						 	</div>
        							해당 리워드의 제한 수량, 즉 최대 몇개까지 생산 가능한지 쓰시면 됩니다.
        						</div>
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		리워드 제목
        						 	</div>
        							해당 리워드의 이름을 입력하세요.
        						</div>
        						
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		리워드 설명
        						 	</div>
        							해당 리워드에 대해 추가적인 설명을 작성하세요.
        						</div>
        						
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		리워드 선택형 옵션
        						 	</div>
        							가격에는 영향을 미치지 않지만 선택적으로 옵션을 입력받아야 하는 경우에 추가해주세요!
        						</div>
        						
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		리워드 입력형 옵션
        						 	</div>
        							리워드에 새길 각인 등 사용자에게 입력받아야 하는 옵션이 있다면 추가해주세요!
        						</div>
        						
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		배송지 여부
        						 	</div>
        							사용자에게 리워드를 제공할 때 배송지 필요 여부를 체크하세요!
        						</div>
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		배송비
        						 	</div>
        							사용자가 추가적으로 부담할 배송비가 있다면 입력해주세요.
        						</div>
        						
        						<div style='margin:10px; color:gray;'>
        						 	<div style='display:inline-block; color:black; font-weight:bolder; font-size:1.2em;'>
        						 		예상 배송일
        						 	</div>
        							프로젝트 종료일 이후 며칠 이내에 배송이 가능한지 입력해주세요! 30~90일 이내에는 배송되어야 합니다!
        						</div>
        					</div>
                    </div>


                </div>
                
                <div class="reward-content-line"></div>
                
            	<div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">리워드 목록</p>
                    <p class="assist">프로젝트의 리워드 목록을 작성할 수 있습니다!</p>



                    <div class="reward-content-hide">
                        <div class="btn-area">
                            <button id="reward-content-reward-add-btn" class="reward-btn-ok">추가하기</button>
                        </div>
                    </div>


                </div>
            </div>
        

            <div class="reward-contents reward-subcontents">
            	
            
           		<c:forEach items="${reward.itemList }" var="item">
           		 <div class="reward-content-line"></div>
           		 <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <div style='vertical-align:top; width:28px; height:28px; margin-top:5px;'class="reward-menu-check-icon reward-menu-save"></div>
                    <p style='display:inline-block;'class="title">리워드 #1</p>
                    <br>
                    <p class="assist">리워드의 상세사항을 적어주세요!</p>

                    <div class="hidden-data-area">
                        <input type="hidden" value="0" class="data">
                        <input type="hidden" value="${item.no }" class="itemNo">
                    </div>

                    <div class="reward-content-hide">
                        <div class="reward-content-reward">


                            <div class="reward-sequence">
                                <p class="reward-title">리워드 정렬순서</p>
                                <input type="number" value="${item.index }"  max="2000000000" style="width:200px;" class="simple-text">
                                <p class="unit">번째</p>
                            </div>

                            <div class="reward-price-area">
                                <p class="reward-title">리워드 금액</p>
                                <input type="number" value="${item.price }" max="2000000000" class="simple-text">
                                <p class="unit">원</p>
                            </div>
                            <div class="reward-reward-limit-area">

                                <p class="reward-title">리워드 제한 수량</p>
                                <input type="number" value="${item.maxNum }" max="2000000000" class="simple-text">
                                <p class="unit">개</p>
                            </div>

                            <div class="reward-title-area">
                                <p class="reward-title">리워드 제목</p>
                                <input type="text" value="${item.name }" class="simple-text" style="text-align:left;" maxlength="20">
                                <p class="textLimit">${fn:length(item.name)}/20</p>
                            </div>

                            <div class="reward-detail-area">
                                <p class="reward-title" style="vertical-align: top;">리워드 설명</p>
                                <textarea contenteditable="true" class="reward-detail" maxlength="60">${item.introduce }</textarea>
                                <p class="textLimit" style="vertical-align: bottom;">${fn:length(item.introduce)}/60</p>
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
                                            	<c:forEach items="${item.selectOptionList }" var="selectOption">
                                                <li>
                                                	<input type="hidden" class="selectOptionNo" value="${selectOption.no }"/>
                                                    <p class="assist-inline">${selectOption.content }</p>
                                                    <button type="button"
                                                        style="vertical-align: middle; width:45px; height:20px;"
                                                        class="reward-btn-cancel reward-option-delete">삭제</button>
                                                </li>
                                                </c:forEach>
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
                                            	<c:forEach items="${item.inputOptionList }" var="inputOption">
                                                <li>
                                                	<input type="hidden" class="inputOptionNo" value="${inputOption.no }">
                                                    <p class="assist-inline">${inputOption.content }</p>
                                                    <button type="button"
                                                        style="vertical-align: middle; width:45px; height:20px;"
                                                        class="reward-btn-cancel reward-option-delete">삭제</button>
                                                </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="reward-delivery-address-area">
                                <p class="reward-title">배송지 여부</p>
                                <label for='need-delivery-address' class='reward-delivery <c:if test="${item.needAddress == 1 }">reward-delivery-active</c:if>'>필요함</label>
                                <label for='needless-delivery-address' class='reward-delivery <c:if test="${item.needAddress == 0 }">reward-delivery-active</c:if>'>필요없음</label>
                                <input type="hidden" name="needDelivery" value="${item.needAddress }">
                            </div>

                            <div class="reward-delivery-price-area">
                                <p class="reward-title">배송비</p>
                                <input type="number" max="2000000000" value="${item.deliveryPrice }" style="width:120px" class="simple-text">
                                <p class="unit">원</p>
                            </div>


                            <div class="reward-delivery-date-area">
                                <p class="reward-title">예상 배송일</p>
                                <p class="unit">프로젝트 시작 후</p>
                                <input type="number" max="30" value="${item.deliveryStart }"style="width:120px" class="simple-text">
                                <p class="unit">일 이후부터</p>
                                <input type="number" max="60" value="${item.deliveryEnd }" style="width:120px" class="simple-text">
                                <p class="unit">일 내에 배송됩니다.</p>
                            </div>

                        </div>

                        <div class="btn-area">
                            <button class="reward-content-reward-btn-ok reward-btn-ok">저장</button>
                            <button class="reward-content-reward-btn-delete reward-btn-cancel">삭제</button>
                        </div>
                    </div>
                </div>
           			
           		</c:forEach>
            	
               
            </div>



        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">오픈예정</p>
                    <p class="assist">프로젝트를 시작하기 전에 얼마간의 대기기간을 가질 수 있습니다!</p>

                    <div class="reward-content-hide" style='font-family:NanumSquareRound;'>
						<br><br><br>
						
						<form id="rewardPreOpenForm" method="post" action="${pageContext.request.contextPath }/project/reward/preOpen">
						<div class="pre-open-area" onclick="onClickPreOpenArea()">
           					<label class="radiolabel"><span class='<c:if test="${reward.preOpen == 1 }">checked</c:if><c:if test="${reward.preOpen == 0 }">unchecked</c:if>'>　　</span>오픈 예정을 신청하겠습니다.</label>

            				<br>
            				<label class="radiolabel"><span class='<c:if test="${reward.preOpen == 0 }">checked</c:if><c:if test="${reward.preOpen == 1 }">unchecked</c:if>'>　　</span>대기기간을 가지지 않고 바로 오픈하겠습니다!</label>
            				<input type="hidden" name="rewardPreOpen" value="0">
            			</div>
            			</form>
            			
                      
                    </div>
                </div>
            </div>


        </div>
        <div class="reward-content-wrapper">
            <div class="reward-contents">
            	<form id="rewardAccountForm" method="post" action="${pageContext.request.contextPath }/project/reward/account">
            	<input type="hidden" value="0" class="isModified">
                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">정산</p>
                    <p class="assist">프로젝트가 성공하면 돈을 지불받을 계좌를 설정합니다!</p>

                    <div class="reward-content-hide">

							<div class="btn-area">
							<input type="hidden" name="user_token" id="user_token" value="${rewardAccount[0].ACCESS_TOKEN }"/>
							<input type="hidden" name="user_refresh_token" id="user_refresh_token" value="${rewardAccount[0].REFRESH_TOKEN }"/>
							<input type="hidden" name="user_seq_no" id="user_seq_no" value="${rewardAccount[0].USER_SERIAL_NO }"/>
							<input type="hidden" name="account_alias" id="account_alias" value="${rewardAccount[0].ACCOUNT_NAME }"/>
							<input type="hidden" name="account_holder_name" id="account_holder_name" value="${rewardAccount[0].ACCOUNT_USER_NAME }"/>
							<input type="hidden" name="fintech_use_num" id="fintech_use_num" value="${rewardAccount[0].FIN_NO }"/>
							<input type="hidden" name="account_num_masked" id="account_num_masked" value="${rewardAccount[0].ACCOUNT_NO }"/>
							<input type="hidden" name="bank_name" id="bank_name" value="${rewardAccount[0].BANK_NAME }"/>
							<input type="hidden" name="bank_code_std" id="bank_code_std" value="${rewardAccount[0].BANK_NO }"/>
                            <button type="button" onclick="clickRegisterAcctount();" class="reward-btn-ok">설정</button>
                        </div>
                       
                    </div>
                </div>

                <div class="reward-content-line"></div>

                <div class="reward-content reward-content-active">
                    <div class="icon-upper-arrow"></div>
                    <p class="title">통장 사본</p>
                    <p class="assist">지불받을 계좌의 통장 사본을 업로드 해주세요!</p>


                    <div class="reward-content-hide">
                        <label for="reward-project-photo4" class="reward-img-upload-label" style='background-image:url("${pageContext.request.contextPath }/${reward.bankbookPhoto }"); width:600px; height:250px;'
                            ></label>
                        <input type="file" name="file" id="reward-project-photo4" style="display:none;">

                  
                    </div>
                </div>
                
                </form>
                
               
            </div>

        </div>
<!--  사용자 통장 등록 창 만들기 form -->
                <form id="authCodeReqFrm" class="auth-form">
					
						<!-- <div>Client ID:</div> -->
						<div><input type="hidden" class="input-sm" id="client_id" name="client_id" value="l7xx6d3f293ff0434fe688e43049b3b0b0a8"></input></div>
					
						<!-- <div>Client Secret:</div> -->
						<div><input type="hidden" class="input-sm" id="client_secret" name="client_secret" value="cde4c721f31040f4a98e7f44ca4613d7"></input><!-- <span> (토큰발급시 필요)</span> --></div>

						<!-- <div style="width:120px; float:left; margin-left:0px">Response Type:</div> -->
						<input type="hidden" class="input-sm" id="response_type" name="response_type" style="width:55px"  value="code" readonly="readonly" />						
						
						<!-- <div>Scope:</div> -->
						<div><input type="hidden" class="input-sm" id="scope" name="scope" style="width:150px" value="transfer login inquiry" /> <!-- 공백문자(" ")를 구분자로 하여 multi scope 요청 가능 (예: login transfer) --></div>
									
						<!-- <div>Redirect URI:</div> -->
						<div><input type="hidden" class="input-sm" id="redirect_uri" name="redirect_uri" style="width:392px" value="http://localhost:9090/test/callback" /></div>
					
						<!-- <div>Client Info:</div> -->
						<div><input type="hidden" class="input-sm" id="client_info" name="client_info" style="width:392px" value="test whatever you want" /></div>
											
						<!-- <div style="width:60px; float:left; margin-left:145px">BG color:</div> -->
						<div style="float:left; margin-left:10px"><input type="hidden" class="input-sm" id="bg_color" name="bg_color" style="width:85px" value="#FAFAFA"/></div>
						<!-- <div style="width:70px; float:left; margin-left:15px">TXT color:</div> -->
						<div style="float:left"><input type="hidden" class="input-sm" id="txt_color" name="txt_color" style="width:85px" value="#050505"/></div>						
						<!-- <div style="width:75px; float:left; margin-left:15px">BTN1 color:</div> -->
						<div style="float:left"><input type="hidden" class="input-sm" id="btn1_color" name="btn1_color" style="width:85px" value="#006DB8"/></div>						
						<!-- <div style="width:75px; float:left; margin-left:15px">BTN2 color:</div> -->
						<div style="float:left"><input type="hidden" class="input-sm" id="btn2_color" name="btn2_color" style="width:85px" value="#818487"/></div>						
					
				</form>
				
				<!-- 실명인증 -->
				<input type="hidden" class="input-sm" id="code" name="code" style="margin-left:4px"></input>
				
				<!-- 사용자일련번호 -->
				<input type="hidden" class="input-sm" id="user_seq_no" name="user_seq_no" style="width:110px"></input>					
									
				<!-- Access Token: -->
				<input type="hidden" class="input-sm" id="token" name="token"></input>
				
				<input type="hidden" class="input-sm" id="refresh_token" name="refresh_token"></input>
				
				<textarea id="inquiryUserInformResult" class="form-control" style="display:none; width:100%; height:150px; margin-left:3px" ></textarea>
					
		<div style='width:100%; text-align:center'>
        <button type="button" onclick='saveReward("${pageContext.request.contextPath }")' style="display:inline-block; margin:20px auto; width:150px; height:50px; font-size:1.1em;"
            class="reward-btn-ok">저장하기</button>
            
                    <button style="display:inline-block; margin:20px auto; width:150px; height:50px; font-size:1.1em;"
            class="reward-btn-ok" onClick="onClickRewardWriteNext(this)">다음 단계로</button>
           </div>

    </div>
	</div>    
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>


