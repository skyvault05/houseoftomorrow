package hot.member.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "member")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class Member{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_no")
	private Integer memberNo;
	@Column(name = "member_id")
	private String memberId;
	@Column(name = "member_pwd")
	private String memberPwd;
	@Column(name = "member_name")
	private String memberName;
	@Column(name = "member_phone")
	private String memberPhone;
	@Column(name = "member_regdate")
	private Timestamp memberRegdate;
	
	@ManyToOne
	@JoinColumn(name = "member_role_no")
	private MemberRole memberRole;
	
	@Column(name = "member_status")
	private Integer memberStatus;
	public Member(Integer memberNo, String memberId, String memberPwd, String memberName, String memberPhone,
			Timestamp memberRegdate, MemberRole memberRole) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberRegdate = memberRegdate;
		this.memberRole = memberRole;
	}
	
	@OneToMany
	@JoinColumn(name = "member_no")
	@Transient
	private List<Notification> list = new ArrayList<Notification>();
	
}
