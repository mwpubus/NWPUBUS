package entity;

public class User {

	private String name;
	private String uid;
	private String password;
	private String tel;
	private String utype;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String name, String uid, String password, String tel, String utype) {
		super();
		this.name = name;
		this.uid = uid;
		this.password = password;
		this.tel = tel;
		this.utype = utype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}
}
