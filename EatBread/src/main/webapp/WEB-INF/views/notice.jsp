<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>너 빵 몇개 먹었어 ?!</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/breadIcon.ico">
</head>
<style>
.fullscreen-bg {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 20px;
	padding: 30px;
	min-height: 100vh;
	box-sizing: border-box;
}

/* 방명록 목록 전체 박스 스타일 */
.guestbook-container {
	width: 80%;
	background-color: #fff;
	border-radius: 16px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	padding: 20px;
	box-sizing: border-box;
}

/* 목록이 많아질 때 스크롤 */
.table-wrapper {
	max-height: 400px;
	overflow-y: auto;
	margin-top: 10px;
	border-radius: 8px;
}

/* 테이블 스타일 */
.guestbook-table {
	width: 100%;
	border-collapse: collapse;
}

.guestbook-table th, .guestbook-table td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fafafa;
}

/* 방명록 폼 전체 박스 */
.guestbook-form-container {
	width: 80%;
	margin-top: auto;
	background-color: #fff;
	border-radius: 16px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	padding: 20px;
	box-sizing: border-box;
}

/* 폼 내부를 가로 정렬 */
.guestbook-form {
	display: flex;
	align-items: center;
	gap: 10px;
	flex-wrap: nowrap;
}

/* 입력 요소 공통 스타일 */
.guestbook-form input, .guestbook-form textarea {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

/* 이름, 비밀번호 고정 너비 */
.guestbook-form input[name="username"] {
	width: 120px;
}

.guestbook-form input[name="password"] {
	width: 140px;
}

/* 메시지 입력란: 남은 공간 전부 차지 */
.guestbook-form textarea {
	flex-grow: 1;
	height: 40px;
	resize: none;
	min-width: 150px;
}

/* 버튼 스타일 */
.guestbook-form button {
	padding: 8px 16px;
	background-color: #4caf50;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	white-space: nowrap;
}

.guestbook-form button:hover {
	background-color: #45a049;
}
</style>

<body>
  <!-- JavaScript에서 사용할 contextPath 선언 -->
  <script>
    const contextPath = "${pageContext.request.contextPath}";
  </script>

  <div class="fullscreen-bg">
    <button class="back-button" onclick="location.href='/'">홈화면</button>
    <button id="play-bgm-btn">음악 재생이 안될 때 클릭!</button>
    
	<audio id="bgm" src="${pageContext.request.contextPath}/resources/audio/background.mp3" loop></audio>
  	
    <div class="guestbook-container">
      <h2>📜 방명록 목록</h2>
      <div class="table-wrapper">
        <table class="guestbook-table">
          <thead>
            <tr>
              <th>작성자</th>
              <th>메시지</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="notice" items="${noticeList}" varStatus="status">
              <c:if test="${status.index < 30}">
                <tr data-id="${notice.id}" data-password="${notice.password}">
                  <td>${notice.username}</td>
                  <td class="message-cell">
                    <span class="message-text">${notice.message}</span>
                  </td>
                  <td>
                    <input type="password" class="pw-input" placeholder="비밀번호" maxlength="4"
                           style="width: 100px;" />
                    <button class="pw-check-btn">비밀번호 확인</button>
                    <button class="edit-btn" style="display: none;">수정</button>
                    <button class="delete-btn" style="display: none;">삭제</button>
                  </td>
                </tr>
              </c:if>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <div class="guestbook-form-container">
      <h3>✏️ 방명록 남기기</h3>
      <form id="guestbook-form"
            action="${pageContext.request.contextPath}/notice/insert"
            method="post" class="guestbook-form">
        <input type="text" name="username" placeholder="이름" required maxlength="50" />
        <input type="password" name="password" placeholder="비밀번호 (숫자 4자리)"
               pattern="\d{4}" maxlength="4" inputmode="numeric" required />
        <textarea name="message" placeholder="한 줄 메시지를 남겨보세요! (100자 이내)"
                  maxlength="100" required></textarea>
        <button type="submit">등록</button>
      </form>
    </div>
  </div>

  <!-- JavaScript 기능 -->
  <script>
  
    document.addEventListener("DOMContentLoaded", function () {
      // 비밀번호 확인
      document.querySelectorAll(".pw-check-btn").forEach((btn) => {
        btn.addEventListener("click", function () {
          const row = btn.closest("tr");
          const id = row.dataset.id;
          const inputPw = row.querySelector(".pw-input").value;

          if (!inputPw) {
            alert("비밀번호를 입력하세요.");
            return;
          }

          fetch(contextPath + "/notice/pwCheck?id=" + encodeURIComponent(id) + "&password=" + encodeURIComponent(inputPw))
            .then((res) => res.text())
            .then((result) => {
              if (result === "1") {
                row.querySelector(".edit-btn").style.display = "inline-block";
                row.querySelector(".delete-btn").style.display = "inline-block";
                row.querySelector(".pw-input").style.display = "none";

                const messageCell = row.querySelector(".message-cell");
                const messageText = messageCell.querySelector(".message-text").textContent;
                messageCell.innerHTML = `<input type="text" class="edit-input" value="${messageText}" maxlength="100" style="width: 95%;" />`;
                
                row.querySelector(".pw-check-btn").style.display = "none"; // ← 비밀번호 확인 버튼 숨기기

              } else {
                alert("비밀번호가 틀렸습니다.");
              }
            })
            .catch((err) => {
              console.error("비밀번호 확인 오류:", err);
              alert("비밀번호 확인 중 오류 발생");
            });
        });
      });

      // 수정
      document.querySelectorAll(".edit-btn").forEach((btn) => {
        btn.addEventListener("click", function () {
          const row = btn.closest("tr");
          const id = row.dataset.id;
          const newMessage = row.querySelector(".edit-input").value;
          const pw = row.querySelector(".pw-input").value;

          fetch(contextPath + "/notice/update", {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ id, message: newMessage, password: pw })
          })
            .then((res) => res.text())
            .then((result) => {
              if (result === "1") {
                alert("수정되었습니다.");
                location.reload();
              } else {
                alert("수정 실패");
              }
            });
        });
      });

      // 삭제
      document.querySelectorAll(".delete-btn").forEach((btn) => {
        btn.addEventListener("click", function () {
          const row = btn.closest("tr");
          const id = row.dataset.id;
          const pw = row.querySelector(".pw-input").value;

          if (!confirm("정말 삭제하시겠습니까?")) return;

          fetch(contextPath + "/notice/delete?id=" + encodeURIComponent(id) + "&password=" + encodeURIComponent(pw), {
            method: "DELETE"
          })
            .then((res) => res.text())
            .then((result) => {
              if (result === "1") {
                alert("삭제되었습니다.");
                location.reload();
              } else {
                alert("비밀번호가 틀렸습니다.");
              }
            });
        });
      });
    });   
    
  </script>
  
<script src="${pageContext.request.contextPath}/resources/js/bgm-settings.js"></script>

  
</body>
</html>