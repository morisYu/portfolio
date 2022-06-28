package dto;

public class PlanDTO {
	private int plan_no;
	private String plan_id;
	private String plan_kind;
	private String plan_color;
	private String plan_content;
	private String plan_reg_date;
	
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(String plan_id) {
		this.plan_id = plan_id;
	}
	public String getPlan_kind() {
		return plan_kind;
	}
	public void setPlan_kind(String plan_kind) {
		this.plan_kind = plan_kind;
	}
	public String getPlan_color() {
		return plan_color;
	}
	public void setPlan_color(String plan_color) {
		this.plan_color = plan_color;
	}
	public String getPlan_content() {
		return plan_content;
	}
	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}
	public String getPlan_reg_date() {
		return plan_reg_date;
	}
	public void setPlan_reg_date(String reg_date) {
		String newDate = reg_date;
		if(reg_date.indexOf("/") == -1) {
			String[] dates = reg_date.split("-");
			newDate = dates[0] + "/" + dates[1] + "/" + dates[2];
		}
		this.plan_reg_date = newDate;
	}
}
