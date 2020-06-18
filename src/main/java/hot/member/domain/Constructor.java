package hot.member.domain;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/*@Entity
@Table(name = "constructor")
@Setter
@Getter*/
public class Constructor {
	
	@Id
	@JoinColumn(name = "member_no")
	private Member member;
	
	@Column(name = "con_name")
	private String conName;
	@Column(name = "con_phone")
	private String conPhone;
	@Column(name = "con_career")
	private String conCareer;
	@Column(name = "con_addr")
	private String conAddr;
	@Column(name = "is_company")
	private int isCompany;
	@Column(name = "con_certification")
	private String conCertification;
	
	
}
