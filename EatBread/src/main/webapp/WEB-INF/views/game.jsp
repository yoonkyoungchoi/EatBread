<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>너 빵 몇개 먹었어 ?! - 게임</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/breadIcon.ico">
	<audio id="bgm" src="${pageContext.request.contextPath}/resources/audio/background.mp3" autoplay loop></audio>
</head>
<body>

	<div class="fullscreen-bg">
		<button id="play-bgm-btn">음악 재생이 안될 때 클릭!</button>
		<button class="back-button" onclick="location.href='/'">홈화면</button>
	
		<div id="countdown" class="countdown-text"></div>
		
		<div class="game-container">
		
			<div class="image-wrapper">
			  <img id="breadImage" src="${pageContext.request.contextPath}/resources/img/main.png" alt="빵 먹기 이미지" class="bread-animation" />
			</div>

			<div class="input-container" style="display: none;">
			  <input type="number" id="userGuess" min="0" placeholder="몇 개 먹었게?" class="guess-input" />
			  <input type="text" id="nickname" placeholder="닉네임" class="nickname-input" />
			  <button onclick="submitGuess()" class="submit-button">제출</button>
			</div>

			<p id="gameMessage"></p>
		</div>
	</div>

</body>
<script>

	const contextPath = "${pageContext.request.contextPath}";
	
	const bgm = document.getElementById('bgm');
	const playBgmBtn = document.getElementById('play-bgm-btn');
	const imgElem = document.getElementById("breadImage");
	
	let mixedImages = [];
	let actualCount = 0;
	let startTime = 0;
	let currentIndex = 0;
	 
	playBgmBtn.addEventListener('click', () => {
		bgm.play().then(() => {
			playBgmBtn.style.display = 'none';
		}).catch((e) => {
			alert('음악 재생에 실패했습니다.');
			console.error(e);
		});
	});

	function loadImagesAndStart() {
		fetch(contextPath + "/api/getImageList", {
			headers: {
				"Accept": "application/json"
			}
		})
		.then(res => {
			if (!res.ok) {
				throw new Error("서버 응답 오류: " + res.status);
			}
			return res.json();
		})
		.then(images => {
			if (!Array.isArray(images)) {
				throw new Error("이미지 데이터가 배열이 아닙니다");
			}

			mixedImages = images; 

			actualCount = mixedImages.filter(name => name.startsWith("eat")).length;

			startTime = Date.now();
			setTimeout(showImages, 1000);
		})
		.catch(err => {
			console.error("이미지를 불러오는 데 실패했습니다", err);
		});
	}
	
	function showImages() {
		  if (currentIndex >= mixedImages.length) {
		    document.querySelector(".image-wrapper").style.display = "none";
		    document.querySelector(".input-container").style.display = "flex"; // 정답 입력창 나타남
		    
		    return;
		  }

		  imgElem.classList.remove("bread-animation");
		  void imgElem.offsetWidth;
		  imgElem.classList.add("bread-animation");

		  imgElem.src = contextPath + "/resources/img/" + mixedImages[currentIndex];
		  currentIndex++;

		  setTimeout(showImages, Math.random() * 200 + 150);
		}


	window.onload = () => {
		  startCountdown();
		};

	   function startCountdown() {
		  const countdownElem = document.getElementById("countdown");
		  let count = 3;
	
		  const interval = setInterval(() => {
		    if (count > 0) {
		      countdownElem.textContent = count;
		      countdownElem.classList.remove("countdown-text"); // 애니메이션 리셋
		      void countdownElem.offsetWidth;
		      countdownElem.classList.add("countdown-text");
		      count--;
		    } else {
		      clearInterval(interval);
		      countdownElem.style.display = "none";
		      loadImagesAndStart(); // 카운트 끝나고 이미지 시작
		    }
		  }, 1000);
	    }


		function submitGuess() {
		    const userInput = parseInt(document.getElementById('userGuess').value);
		    const nickname = document.getElementById('nickname').value.trim();
		    const timeTaken = (Date.now() - startTime) / 1000;
		    const gameMessage = document.getElementById('gameMessage');

		    if (!nickname || isNaN(userInput)) {
		        gameMessage.innerText = '닉네임과 숫자를 정확히 입력해주세요';
		        return;
		    }

		    // 서버에 저장 요청
		    fetch(contextPath + '/api/saveGameResult', {
		        method: 'POST',
		        headers: { 'Content-Type': 'application/json' },
		        body: JSON.stringify({
		            nickname: nickname,
		            guessCount: userInput,
		            actualCount: actualCount,
		            timeTaken: timeTaken
		        })
		    })
		    .then(res => res.text())
		    .then(data => {
		        // 입력창, 버튼 숨기기
		        document.getElementById('userGuess').style.display = 'none';
		        document.getElementById('nickname').style.display = 'none';
		        document.querySelector('.submit-button').style.display = 'none';
		        
		        if (data === "success") {
		        	if (userInput === actualCount) {
		        	    gameMessage.innerHTML = `✅ 정답입니다! 결과가 저장되었습니다.<br>3초 뒤 메인 화면으로 이동합니다.`;
		        	} else {
		        	    gameMessage.innerHTML = `❌ 틀렸어요. 정답은 `+ actualCount +`개입니다.<br>결과가 저장되었습니다. 3초 뒤 메인 화면으로 이동합니다.`;
		        	}


		            // 3초 후 메인으로 이동
		            setTimeout(() => {
		                window.location.href = contextPath + "/";
		            }, 4000);
		        } else {
		            gameMessage.innerText = "결과 저장에 실패했습니다.";
		        }
		    })
		    .catch(err => {
		        gameMessage.innerText = "서버 오류가 발생했습니다.";
		        console.error(err);
		    });
		}


</script>

</html>