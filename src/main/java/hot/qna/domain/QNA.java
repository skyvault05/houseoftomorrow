package hot.qna.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;

import hot.member.domain.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "QNA")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@DynamicUpdate
public class QNA {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "qna_no")
	private Integer qnaNo;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	@Column(name = "qna_title")
	private String qnaTitle;
	@Column(name = "qna_description")
//	@Type(type = "text")
	private String qnaDescription;
	@Column(name = "qna_regdate")
	private Timestamp qnaRegdate;
	
	
	
	@ManyToOne(optional = true)
	@JoinColumn(name = "qna_parent_no", referencedColumnName = "qna_no", nullable = true)
	private QNA qnaParentNo;
	
	@ManyToOne
	@JoinColumn(name = "qna_category_no")
	private QNACategory qnaCategory;
	
	@Column(name = "qna_status")
	private Integer qnaStatus;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "qnaParentNo")
	private List<QNA> qnaChildNo;
	


}



