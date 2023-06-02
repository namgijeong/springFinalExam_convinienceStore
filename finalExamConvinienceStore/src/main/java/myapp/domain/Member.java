package myapp.domain;



	public class Member {
		private int primaryId;
		private String memberId;
		private int memberType;
		private int memberActive;
		private String name;
		private String password;
		public String getMemberId() {
			return memberId;
		}
		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}
		public int getMemberType() {
			return memberType;
		}
		public void setMemberType(int memberType) {
			this.memberType = memberType;
		}
		public int getMemberActive() {
			return memberActive;
		}
		public void setMemberActive(int memberActive) {
			this.memberActive = memberActive;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public int getPrimaryId() {
			return primaryId;
		}
		public void setPrimaryId(int primaryId) {
			this.primaryId = primaryId;
		}
		
		
		
		
	}


