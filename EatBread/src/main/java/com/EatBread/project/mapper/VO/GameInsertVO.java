package com.EatBread.project.mapper.VO;

import java.time.LocalDateTime;

public class GameInsertVO {
	
	private Long id;
    private String nickname;
    private int guessCount;
    private int actualCount;
    private float timeTaken;
    
    private LocalDateTime playedAt = LocalDateTime.now();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getGuessCount() {
		return guessCount;
	}

	public void setGuessCount(int guessCount) {
		this.guessCount = guessCount;
	}

	public int getActualCount() {
		return actualCount;
	}

	public void setActualCount(int actualCount) {
		this.actualCount = actualCount;
	}

	public float getTimeTaken() {
		return timeTaken;
	}

	public void setTimeTaken(float timeTaken) {
		this.timeTaken = timeTaken;
	}

	public LocalDateTime getPlayedAt() {
		return playedAt;
	}

	public void setPlayedAt(LocalDateTime playedAt) {
		this.playedAt = playedAt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GameInsertVO [id=").append(id).append(", nickname=").append(nickname).append(", guessCount=")
				.append(guessCount).append(", actualCount=").append(actualCount).append(", timeTaken=")
				.append(timeTaken).append(", playedAt=").append(playedAt).append("]");
		return builder.toString();
	}
}
