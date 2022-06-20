package dto;

public class BoardDTO {
	private int board_no;
	private String board_nickname;
	private String board_title;
	private String board_content;
	private int board_nice;
	private String board_photo;
	private String board_reg_date;
	private String board_ip;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	public String getBoard_nickname() {
		return board_nickname;
	}
	public void setBoard_nickname(String board_nickname) {
		this.board_nickname = board_nickname;
	}
	
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	
	public int getBoard_nice() {
		return board_nice;
	}
	public void setBoard_nice(int board_nice) {
		this.board_nice = board_nice;
	}
	
	public String getBoard_photo() {
		return board_photo;
	}
	public void setBoard_photo(String board_photo) {
		this.board_photo = board_photo;
	}
	
	public String getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(String board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	
	public String getBoard_ip() {
		return board_ip;
	}
	public void setBoard_ip(String board_ip) {
		this.board_ip = board_ip;
	}
}
