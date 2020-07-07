package hot.channel.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;

import hot.member.domain.Constructor;
import hot.review.domain.Review;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "channel")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@DynamicUpdate
@ToString
public class Channel {	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ch_no")
	private Integer chNo;
	
	@Column(name = "ch_img")
	private String chImg;
	
	@Column(name = "ch_description")
	@Type(type = "text")
	private String chDescription;
	
	@Column(name = "ch_regdate")
	private Timestamp chRegdate;
	
	@OneToOne   //(fetch = FetchType.LAZY)	
	@JoinColumn(name = "member_no")
	private Constructor constructor;
	
	@Column(name = "ch_status")
	private Integer chStatus;
	
	@Column(name = "ch_grades")
	private Double chGrades;
	
	@OneToMany(mappedBy = "channel")
	private List<Review> reviews = new ArrayList<Review>();
	
	
//	public Channel(Long chNo, String chImg, String chDescription, Timestamp chRegdate, Constructor constructor,
//			int chStatus, double chGrades) {
//		super();
//		this.chNo = chNo;
//		this.chImg = chImg;
//		this.chDescription = chDescription;
//		this.chRegdate = chRegdate;
//		this.constructor = constructor;
//		this.chStatus = chStatus;
//		this.chGrades = chGrades;
//	}
	
	

//	@JoinColumn(name = "")	
//	private List<Portfolio> portList;
	
//	@JoinColumn(name = "")
//	private List<ChCategory> chList;

}
