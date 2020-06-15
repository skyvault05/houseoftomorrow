package hot.member.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
}
