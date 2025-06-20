window.addEventListener("DOMContentLoaded", () => {
  const bgm = document.getElementById('bgm');
  const btn = document.getElementById('play-bgm-btn');

  if (!bgm) return;

  const savedVolume = localStorage.getItem("volume");
  bgm.volume = savedVolume ? parseFloat(savedVolume) : 1.0;

  const muted = localStorage.getItem("bgmMuted") === "true";
  bgm.muted = muted;

  if (localStorage.getItem("bgmPlaying") === "true") {
    bgm.play().catch(() => {
      // 자동 재생 실패 시 버튼 보이기
      if (btn) btn.style.display = "inline-block";
    });
  }

  if (btn) {
    btn.addEventListener("click", () => {
      bgm.play();
      localStorage.setItem("bgmPlaying", "true");
      btn.style.display = "none";
    });
  }

  // 볼륨이 변경됐을 때 저장 (볼륨 직접 변경하는 UI 없으면 생략 가능)
  bgm.addEventListener("volumechange", () => {
    localStorage.setItem("volume", bgm.volume);
    localStorage.setItem("bgmMuted", bgm.muted);
  });
});
