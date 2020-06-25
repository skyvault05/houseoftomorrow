package hot.member.domain;

import java.sql.Timestamp;

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
import lombok.ToString;

@Entity
@Table(name = "notice")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "notice_no")
	private Integer noticeNo;
	
	@Column(name = "notice_title")
	private String noticeTitle;
	
	@Column(name = "notice_description")
	private String noticeDescription;
	
	@Column(name = "notice_regdate")
	private Timestamp noticeRegdate;


}
