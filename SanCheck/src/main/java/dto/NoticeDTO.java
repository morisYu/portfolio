package dto;

public class NoticeDTO {
	private int notice_no;
	private String notice_nickname;
	private String notice_title;
	private String notice_content;
	private String notice_reg_date;
	
	public NoticeDTO() {
		
	}
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	
	public String getNotice_nickname() {
		return notice_nickname;
	}
	public void setNotice_nickname(String notice_nickname) {
		this.notice_nickname = notice_nickname;
	}
	
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	public String getNotice_reg_date() {
		return notice_reg_date;
	}
	public void setNotice_reg_date(String notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}
}
