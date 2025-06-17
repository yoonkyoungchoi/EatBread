window.addEventListener("DOMContentLoaded", () => {
  const bgm = document.getElementById('bgm');
  if (bgm) {
    const volume = localStorage.getItem("volume");
    const muted = localStorage.getItem("bgmMuted") === "true";

    bgm.volume = volume ? parseFloat(volume) : 1.0;
    bgm.muted = muted;
  }
});
