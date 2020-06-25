package hot.member.domain;

import java.sql.Timestamp;
import java.util.Date;

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
@Table(name = "portfolio")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class Portfolio {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "port_no")
	private Integer portNo;
	
	@ManyToOne
	@JoinColumn(name = "ch_no")
	private Channel channel;
	@Column(name = "port_title")
	private String portTitle;
	@Column(name = "port_img")
	private String portImg;
	@Column(name = "port_dsecription")
	private String portDescription;
	@Column(name = "port_regdate")
	private Timestamp portRegdate;
	@Column(name = "port_startdate")
	private Timestamp portStartDate;
	@Column(name = "port_enddate")
	private Timestamp portEndDate;
	@Column(name = "port_status")
	private int portStatus;

	
}