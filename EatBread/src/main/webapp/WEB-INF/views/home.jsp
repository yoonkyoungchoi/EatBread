<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>너 빵 몇개 먹었어 ?!</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/breadIcon.ico">
    <style>
        /* 팝업 배경 오버레이 */
        #popupOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 900;
        }

        /* 팝업 컨테이너 */
        #settingPopupContainer {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: 1000;
        }

        /* 팝업 내부 스타일 */
        .settings-modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            z-index: 1001;
            width: 300px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }

        .modal-close {
            float: right;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            background: none;
            border: none;
        }

        .setting-option {
            margin-top: 20px;
        }

        .setting-option label {
            display: block;
            margin-bottom: 5px;
        }

        .setting-option input[type="range"] {
            width: 100%;
        }

        .apply-button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #ffc107;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        .apply-button:hover {
            background-color: #ffb300;
        }
    </style>
</head>
<body>

    <!-- 배경 음악 -->
    <audio id="bgm" src="${pageContext.request.contextPath}/resources/audio/background.mp3" autoplay loop></audio>

    <!-- 팝업 오버레이 및 팝업 컨테이너 -->
    <div id="popupOverlay"></div>
    <div id="settingPopupContainer"></div>

    <div class="fullscreen-bg">

        <!-- 음악 재생 버튼 -->
        <button id="play-bgm-btn">음악 재생이 안될 때 클릭!</button>

        <!-- 로고 및 버튼 -->
        <div class="center-container">
            <img src="${pageContext.request.contextPath}/resources/img/EatBreadLogo.png" alt="EatBread 로고" />

            <!-- 하단 버튼 -->
            <div class="button-group">
                <button class="menu-button" onclick="location.href='/rule'">게임방법</button>
                <button class="menu-button" onclick="location.href='/game'">게임시작</button>
                <button class="menu-button" onclick="location.href='/rank'">랭킹</button>
                <button class="menu-button" onclick="openSettingPopup()">설정</button>
            </div>

            <div class="creator">
                제작자 : 최윤경 <br>
                (C) 2025. 최윤경 all rights reserved.
            </div>
        </div>
    </div>

    <!-- 공통 BGM 설정 스크립트 -->
    <script src="${pageContext.request.contextPath}/resources/js/bgm-settings.js"></script>

    <!-- 음악 재생 버튼 로직 -->
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

        // 설정 팝업 열기
        function openSettingPopup() {
            const overlay = document.getElementById("popupOverlay");
            const container = document.getElementById("settingPopupContainer");

            container.innerHTML = `
                <div class="settings-modal">
                    <button class="modal-close" onclick="closePopup()">X</button>
                    <h2>설정</h2>

                    <div class="setting-option">
                        <label for="volumeControl">BGM 볼륨</label>
                        <input type="range" id="volumeControl" min="0" max="1" step="0.01">
                    </div>

                    <div class="setting-option">
                        <label>
                            <input type="checkbox" id="muteToggle"> BGM 끄기
                        </label>
                    </div>

                    <button class="apply-button" onclick="applySettings()">설정 적용</button>
                </div>
            `;

            container.style.display = "block";
            overlay.style.display = "block";

            // 초기 설정값 반영
            const savedVolume = localStorage.getItem('volume');
            const savedMuted = localStorage.getItem('bgmMuted') === 'true';

            const volumeControl = container.querySelector("#volumeControl");
            const muteToggle = container.querySelector("#muteToggle");

            if (savedVolume !== null) {
                volumeControl.value = savedVolume;
                bgm.volume = parseFloat(savedVolume);
            }

            muteToggle.checked = savedMuted;
            bgm.muted = savedMuted;
        }

        function applySettings() {
            const container = document.getElementById("settingPopupContainer");
            const volume = container.querySelector("#volumeControl").value;
            const muted = container.querySelector("#muteToggle").checked;

            localStorage.setItem("volume", volume);
            localStorage.setItem("bgmMuted", muted);

            bgm.volume = parseFloat(volume);
            bgm.muted = muted;

            closePopup();
        }

        function closePopup() {
            document.getElementById("settingPopupContainer").style.display = "none";
            document.getElementById("settingPopupContainer").innerHTML = "";
            document.getElementById("popupOverlay").style.display = "none";
        }
    </script>

</body>
</html>
