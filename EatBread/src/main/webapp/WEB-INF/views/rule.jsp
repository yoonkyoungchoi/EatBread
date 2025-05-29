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
		
		<div class="center-container2">
			<h1> ★ 게임 방법 ★ </h1> <br>
			<h2> 1. 게임 모드를 선택한다. (쉬운모드 / 어려운 모드)</h2> <br>
			<h2> 2. 닉네임을 입력한다. (중복 안됨)</h2> <br>
			<h2> 3. 화면에 짱구가 빵을 몇 번 먹었는지 세어 답을 클릭한다. </h2> <br>
			
			<div class="two-sided-image-section">
			    <div class="image-group">
			        <div class="image-item">
			            <img src="${pageContext.request.contextPath}/resources/img/eat1.png" alt="먹는 예시1">
			            <p class="image-caption">먹었다 !</p>
			        </div>
			        			        
			        <div class="image-item">
			            <img src="${pageContext.request.contextPath}/resources/img/noeat3.png" alt="안먹는 예시 1">
			            <p class="image-caption">안먹었다 !</p>
			        </div>
			    </div>
			    
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			    <div class="image-group">
					<div class="image-item">
			            <img src="${pageContext.request.contextPath}/resources/img/eat2.png" alt="먹는 예시2">
			            <p class="image-caption">먹었다 !</p>
			        </div>
			        
			        <div class="image-item">
			            <img src="${pageContext.request.contextPath}/resources/img/noeat2.png" alt="안먹는 예시 2">
			            <p class="image-caption">멋지다 !</p>
			        </div>
			    </div>
			</div>
			
			<h2> ♡ 꿀팁 빵이 입에 들어가있어야 먹은 것으로 인정함 !  ♡ </h2> <br>
			<button class="menu-button" onclick="location.href='/game'">게임 하기</button>
		</div>
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