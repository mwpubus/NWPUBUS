package entity;

public class Bbus {
	private String name;
	private String license;
	private String dispatch;
	
	public Bbus(String name, String license, String dispatch) {
		super();
		this.name = name;
		this.license = license;
		this.dispatch = dispatch;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getDispatch() {
		return dispatch;
	}
	public void setDispatch(String dispatch) {
		this.dispatch = dispatch;
	}
	
}
