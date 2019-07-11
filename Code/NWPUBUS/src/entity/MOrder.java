package entity;

public class MOrder {

	private String license;
	private String uid;
	private String utype;
	private String otime;
	private String priority;
	private String start;
	private String day;
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public MOrder(String license, String uid, String utype, String otime, String priority, String start, String day,
			String status) {
		super();
		this.license = license;
		this.uid = uid;
		this.utype = utype;
		this.otime = otime;
		this.priority = priority;
		this.start = start;
		this.day = day;
		this.status = status;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}

	public MOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

}
