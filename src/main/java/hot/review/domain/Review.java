package hot.review.domain;

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
import org.hibernate.annotations.Type;

import hot.channel.domain.Channel;
import hot.member.domain.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "review")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@DynamicUpdate
@ToString
public class Review {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "review_no")
	private Integer reviewNo;
	
	@ManyToOne
	@JoinColumn(name = "ch_no")
	private Channel channel;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	@Column(name = "review_grade")
	private int reviewGrade;
	
	@Column(name = "review_regdate")
	private Timestamp reviewRegdate;
	
	@Column(name = "review_status")   //인터페이스에는 리뷰상태가 없고 mysql eer다이어그램에는 리뷰상태가 있어요
	private Integer reviewStatus;
	
	@Column(name = "review_description")
	@Type(type = "text")
	private String reviewDescription;

}
