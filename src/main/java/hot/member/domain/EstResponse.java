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
@Table(name = "est_response")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@DynamicUpdate
public class EstResponse {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "est_resp_no")
	private Integer estRespNo;
	
	
	@ManyToOne
	@JoinColumn(name = "est_no")
	private Estimate estNo;
	
	@ManyToOne
	@JoinColumn(name = "ch_no")
	private Channel channel;
	
	@Column(name = "est_resp_description")
	private String estRespDescription;
	
	@Column(name = "est_resp_regdate")
	private Timestamp estRespRegdate;


}
