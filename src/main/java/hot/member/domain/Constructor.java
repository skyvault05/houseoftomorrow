package hot.member.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "constructor")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
@ToString
public class Constructor {
	@Id
	private Integer memberNo;
	
	@MapsId
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
	@Column(name = "con_iscompany")
	private Integer conIsCompany;
	@Column(name = "con_certification")
	private String conCertification;
	
}
