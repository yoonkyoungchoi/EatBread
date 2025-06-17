<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
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

<script>
    const bgm = document.getElementById('bgm');

    window.addEventListener("DOMContentLoaded", () => {
        const volumeControl = document.getElementById('volumeControl');
        const muteToggle = document.getElementById('muteToggle');

        const savedVolume = localStorage.getItem('volume');
        const savedMuted = localStorage.getItem('bgmMuted') === 'true';

        if (savedVolume !== null) {
            volumeControl.value = savedVolume;
            if (bgm) bgm.volume = parseFloat(savedVolume);
        }

        muteToggle.checked = savedMuted;
        if (bgm) bgm.muted = savedMuted;
    });

    function applySettings() {
        const volume = document.getElementById('volumeControl').value;
        const muted = document.getElementById('muteToggle').checked;

        localStorage.setItem('volume', volume);
        localStorage.setItem('bgmMuted', muted);

        if (bgm) {
            bgm.volume = parseFloat(volume);
            bgm.muted = muted;
        }

        closePopup();
    }

    function closePopup() {
        window.parent.document.getElementById("settingPopupContainer").style.display = "none";
        window.parent.document.getElementById("settingPopupContainer").innerHTML = "";
        window.parent.document.getElementById("popupOverlay").style.display = "none";
    }
</script>
