package hot.member.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="estimate")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "dtype")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Estimate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "est_no")
	private Long estNo;
	
	@ManyToOne
	@JoinColumn(name="member_no")
	private Member member;
	
	@Column(name = "est_description")
	private String estDescription;
	@Column(name = "est_regdate")
	private Timestamp estRegdate;
	@Column(name="est_status")
	private int estStatus;
	

	private Kitchen kitchen;
	private Linoleum linoleum;
	private Tile tile;
	private Floor floor;
	private Bathroom bathroom;
	private Papering papering;


}
