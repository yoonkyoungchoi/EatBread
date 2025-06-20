<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>너 빵 몇개 먹었어 ?!</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/breadIcon.ico">
    <style>
        .ranking-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: -200px;
        }

        .rank-entry {
            font-weight: bold;
            margin: 10px 0;
        }

        .rank-1 {
            font-size: 40px;
            color: gold;
        }

        .rank-2 {
            font-size: 34px;
            color: gold;
        }

        .rank-3 {
            font-size: 28px;
            color: gold;
        }

        .rank-4 {
            font-size: 24px;
            color: #444;
        }

        .rank-5 {
            font-size: 22px;
            color: #444;
        }

        .rank-6 {
            font-size: 20px;
            color: #444;
        }

        .rank-7 {
            font-size: 18px;
            color: #444;
        }

        .rank-8 {
            font-size: 16px;
            color: #444;
        }

        .rank-9 {
            font-size: 15px;
            color: #444;
        }

        .rank-10 {
            font-size: 14px;
            color: #444;
        }
        
        .ranking-title {
		    font-size: 48px;
		    font-weight: bold;
		    color: #333;
		    margin-bottom: 40px;
		    text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
		}
		        
    </style>
</head>
<body>

    <!-- 배경 음악 -->
    <audio id="bgm" src="${pageContext.request.contextPath}/resources/audio/background.mp3" autoplay loop></audio>

    <div class="fullscreen-bg">

        <button class="back-button" onclick="location.href='/'">홈화면</button>
        <button id="play-bgm-btn">음악 재생이 안될 때 클릭!</button>
        
        <div class="ranking-container">
		    <h1 class="ranking-title">🏆 랭킹</h1> 
		    <c:forEach var="rank" items="${rankList}" varStatus="status">
		        <c:if test="${not empty rank.ranking and rank.ranking <= 10}">
		            <div class="rank-entry rank-${rank.ranking}">
		                ${rank.ranking}등 - ${rank.nickname}님 (${rank.timeTaken}초)
		            </div>
		        </c:if>
		    </c:forEach>
		</div>
    </div>
    
   <script>
    
        const bgm = document.getElementById('bgm');
        const playBgmBtn = document.getElementById('play-bgm-btn');

        playBgmBtn.addEventListener('click', () => {
            bgm.play().then(() => {
                playBgmBtn.style.display = 'none';
            }).catch((e) => {
                alert('음악 재생에 실패했습니다. 다시 시도해주세요.');
                console.error(e);
            });
        });
    </script>

</body>
<script src="${pageContext.request.contextPath}/resources/js/bgm-settings.js"></script>
</html>
