package entity;

public class Leave {
	private String name;
	private String day;
	private String  content;
	private String time;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Leave(String name, String day, String content, String time) {
		super();
		this.name = name;
		this.day = day;
		this.content = content;
		this.time = time;
	}
	

}
