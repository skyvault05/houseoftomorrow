package hot.member.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "report")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "report_no")
	private Long reportNo;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;   //신고자
	@Column(name = "reported")
	private int reported;         //신고당하는 주체
	
	@ManyToOne
	@JoinColumn(name = "report_category_no")
	private ReportCategory reportCategory;
	
	@Column(name = "report_status")
	private int reportStatus;
	@Column(name = "report_regdate")
	private Timestamp reportRegdate;

}
