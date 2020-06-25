package hot.member.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "comm_comment")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@DynamicUpdate
public class CommComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comm_comment_no")
	private Integer commCommentNo;
	
	@JoinColumn(name = "comm_no")
	@ManyToOne
	private Community community;
	
	@JoinColumn(name = "member_no")
	@ManyToOne
	private Member member;
	
	@Column(name = "comm_comment_description")
	private String commCommentDescription;
	
	@Column(name = "comm_comment_regdate")
	private Timestamp commCommentRegdate;
	
	@Column(name = "comm_comment_status")
	private Integer commCommentStatus;
	
	

}
