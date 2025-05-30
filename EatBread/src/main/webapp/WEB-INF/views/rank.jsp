<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>너 빵 몇개 먹었어 ?!</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/breadIcon.ico">
	<audio id="bgm" src="${pageContext.request.contextPath}/resources/audio/background.mp3" autoplay loop></audio>
</head>
<body>
	
	<div class="fullscreen-bg">
		
		<button class="back-button" onclick="location.href='/'">홈화면</button>
		<button id="play-bgm-btn">음악 재생이 안될 때 클릭!</button>
		
		
	</div>
	
</body>

<script>

	const bgm = document.getElementById('bgm');
	const playBgmBtn = document.getElementById('play-bgm-btn');
	
	playBgmBtn.addEventListener('click', () => {
	    bgm.play().then(() => {
	        playBgmBtn.style.display = 'none';  // 성공하면 버튼 숨기기
	    }).catch((e) => {
	        alert('음악 재생에 실패했습니다. 다시 시도해주세요.');
	        console.error(e);
	    });
	});
	
</script>
</html>