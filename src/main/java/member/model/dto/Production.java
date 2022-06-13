package member.model.dto;

public class Production {
	private String memberId;
	private String productionName;
	private String casterName;
	private String casterPhone;
	private String casterEmail;
	private String isPhoneOpen;
	private String isPhoneClose;
	
	public Production() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Production(String memberId, String productionName, String casterName, String casterPhone, String casterEmail,
			String isPhoneOpen, String isPhoneClose) {
		super();
		this.memberId = memberId;
		this.productionName = productionName;
		this.casterName = casterName;
		this.casterPhone = casterPhone;
		this.casterEmail = casterEmail;
		this.isPhoneOpen = isPhoneOpen;
		this.isPhoneClose = isPhoneClose;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getProductionName() {
		return productionName;
	}

	public void setProductionName(String productionName) {
		this.productionName = productionName;
	}

	public String getCasterName() {
		return casterName;
	}

	public void setCasterName(String casterName) {
		this.casterName = casterName;
	}

	public String getCasterPhone() {
		return casterPhone;
	}

	public void setCasterPhone(String casterPhone) {
		this.casterPhone = casterPhone;
	}

	public String getCasterEmail() {
		return casterEmail;
	}

	public void setCasterEmail(String casterEmail) {
		this.casterEmail = casterEmail;
	}

	public String getIsPhoneOpen() {
		return isPhoneOpen;
	}

	public void setIsPhoneOpen(String isPhoneOpen) {
		this.isPhoneOpen = isPhoneOpen;
	}

	public String getIsPhoneClose() {
		return isPhoneClose;
	}

	public void setIsPhoneClose(String isPhoneClose) {
		this.isPhoneClose = isPhoneClose;
	}

	@Override
	public String toString() {
		return "Production [memberId=" + memberId + ", productionName=" + productionName + ", casterName=" + casterName
				+ ", casterPhone=" + casterPhone + ", casterEmail=" + casterEmail + ", isPhoneOpen=" + isPhoneOpen
				+ ", isPhoneClose=" + isPhoneClose + "]";
	}
	
	
	
}
