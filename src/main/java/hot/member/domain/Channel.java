//package hot.member.domain;
//
//import java.sql.Timestamp;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//@Entity
//@Table(name = "channel")
//@Setter
//@Getter
//@NoArgsConstructor
//@AllArgsConstructor
//public class Channel {
//	
//	@Id
//	@GeneratedValue()
//	@Column(name = "ch_no")
//	private Long chNo;
//	
//	@Column(name = "ch_img")
//	private String chImg;
//	
//	@Column(name = "ch_description")
//	private String chDescription;
//	
//	@Column(name = "ch_regdate")
//	private Timestamp chRegdate;
//	
//	@Column(name = "member_no")
//	private Constructor constructor;
//	
//	@Column(name = "ch_status")
//	private int chStatus;
//	
//	@Column(name = "ch_grades")
//	private double chGrades;
//	
//	
//	
//	
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
//
//	@Column(name = "")	
//	private List<Portfolio> portList;
//	
//	@Column(name = "")
//	private List<chCategory> chList;
//
//}
