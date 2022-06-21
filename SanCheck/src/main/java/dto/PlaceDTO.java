package dto;

public class PlaceDTO {
	private int place_no;
	private String place_name;
	private String place_addr;
	private String place_tel;
	private String place_business_hours;
	private String place_other;
	private String place_photo;
	
	public PlaceDTO() {
		
	}

	public int getPlace_no() {
		return place_no;
	}

	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getPlace_addr() {
		return place_addr;
	}

	public void setPlace_addr(String place_addr) {
		this.place_addr = place_addr;
	}

	public String getPlace_tel() {
		return place_tel;
	}

	public void setPlace_tel(String place_tel) {
		this.place_tel = place_tel;
	}

	public String getPlace_business_hours() {
		return place_business_hours;
	}

	public void setPlace_business_hours(String place_business_hours) {
		this.place_business_hours = place_business_hours;
	}

	public String getPlace_other() {
		return place_other;
	}

	public void setPlace_other(String place_other) {
		this.place_other = place_other;
	}

	public String getPlace_photo() {
		return place_photo;
	}

	public void setPlace_photo(String place_photo) {
		this.place_photo = place_photo;
	}
}
