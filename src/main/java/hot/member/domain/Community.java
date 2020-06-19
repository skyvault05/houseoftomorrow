package hot.member.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.type.TrueFalseType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "community")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Community {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comm_no")
	private Integer commNo;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	@Column(name = "comm_title")
	private String commTitle;
	@Column(name = "comm_img")
	private String commImg;
	@Column(name = "comm_description")
	private String commDescription;
	@Column(name = "comm_regdate")
	private Timestamp commRegdate;
	
	@ManyToOne
	@JoinColumn(name = "comm_category_no")
	private CommCategory commCategory;
	@Column(name = "comm_readnum")
	private int commReadnum;
	
	
	
	@ManyToOne(optional = true)
	@JoinColumn(name="comm_parentNo", referencedColumnName = "comm_no", nullable = true)
	private Community commParentNo;
	
	@Column(name = "comm_status")
	private int commStatus;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "commParentNo")
	private List<Community> commChildNo;

}







