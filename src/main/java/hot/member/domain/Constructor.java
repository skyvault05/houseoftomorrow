package hot.member.domain;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "constructor")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Constructor {
	
	@Id
	@OneToOne
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
