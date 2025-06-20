package com.EatBread.project.mapper.VO;

public class NoticeVO {
	
	private Integer id;
    private String username;
    private String message;
    private String password;
    private String createdAt;
    private String updatedAt;
    

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NoticeVO [id=").append(id).append(", username=").append(username).append(", message=")
				.append(message).append(", password=").append(password).append(", createdAt=").append(createdAt)
				.append(", updatedAt=").append(updatedAt).append("]");
		return builder.toString();
	}
    
    

}
