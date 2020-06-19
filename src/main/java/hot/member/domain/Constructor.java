//package hot.member.domain;
//
//
//
//import java.io.Serializable;
//
//import javax.persistence.Column;
//import javax.persistence.DiscriminatorValue;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.Id;
//import javax.persistence.IdClass;
//import javax.persistence.JoinColumn;
//import javax.persistence.OneToOne;
//import javax.persistence.Table;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//@Entity
//@Table(name = "constructor")
//@Setter
//@Getter
//@AllArgsConstructor
//@NoArgsConstructor
//@IdClass(Member.class)
//public class Constructor  implements Serializable{
//	
//	@Id
//	@OneToOne
//	@JoinColumn(name = "member_no")
//	private Member member;
//	
//	@Column(name = "con_name")
//	private String conName;
//	@Column(name = "con_phone")
//	private String conPhone;
//	@Column(name = "con_career")
//	private String conCareer;
//	@Column(name = "con_addr")
//	private String conAddr;
//	@Column(name = "con_isCompany")
//	private int isCompany;
//	@Column(name = "con_certification")
//	private String conCertification;
//	
//	
//}
