package entity;

public class Vwork {
	private String name;
	private String uid;
	private String time;
	public Vwork() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param name
	 * @param uid
	 * @param time
	 */
	public Vwork(String name, String uid, String time) {
		super();
		this.name = name;
		this.uid = uid;
		this.time = time;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
