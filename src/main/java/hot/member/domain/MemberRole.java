package hot.member.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "member_role")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberRole {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_role_no")
	private Long memberRoleNo;
	@Column(name = "member_role_name")
	private String memberRoleName;
	
	@OneToMany(mappedBy = "memberRole", fetch = FetchType.EAGER)
	private List<Member> list = new ArrayList<Member>();
}
