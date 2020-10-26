package entity;

public class FeedBack {

	private String uid;
	private String content;

	private String time;
	private String title;

	public FeedBack(String uid, String content, String time, String title) {
		super();
		this.uid = uid;
		this.content = content;
		this.time = time;
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public FeedBack() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FeedBack(String uid, String content, String time) {
		// TODO Auto-generated constructor stub
		this.content = content;
		this.uid = uid;
		this.time = time;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
