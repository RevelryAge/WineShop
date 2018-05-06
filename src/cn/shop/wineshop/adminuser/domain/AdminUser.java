package cn.shop.wineshop.adminuser.domain;

/**
 * 
 * 管理员实体类
 * 
 * @author zoushun
 *
 */
public class AdminUser {
	private Integer uid;
	private String username;
	private String password;
	private String realname;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
	
}
