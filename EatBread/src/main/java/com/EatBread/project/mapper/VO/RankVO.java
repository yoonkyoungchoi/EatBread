package com.EatBread.project.mapper.VO;

public class RankVO {
	
	private String ranking;
	private Long id;
	private String nickname;
	private float timeTaken;
	
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
	public float getTimeTaken() {
		return timeTaken;
	}
	public void setTimeTaken(float timeTaken) {
		this.timeTaken = timeTaken;
	}
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RankVO [ranking=").append(ranking).append(", id=").append(id).append(", nickname=")
				.append(nickname).append(", timeTaken=").append(timeTaken).append("]");
		return builder.toString();
	}

	


}
