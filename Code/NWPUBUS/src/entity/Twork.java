package entity;

public class Twork {

	private String name;
	private String uid;
	private String day;
	private String ttime;

	public Twork(String name, String uid, String day, String ttime) {
		super();
		this.name = name;
		this.uid = uid;
		this.day = day;
		this.ttime = ttime;
	}

	public Twork() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTtime() {
		return ttime;
	}

	public void setTtime(String ttime) {
		this.ttime = ttime;
	}

}
