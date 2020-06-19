package hot.member.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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
public class Portfolio {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "port_no")
	private int portNo;
	
	@ManyToOne
	@JoinColumn(name = "ch_no")
	//private Channel channel;
	@Column(name = "port_title")
	private String portTitle;
	@Column(name = "port_img")
	private String portImg;
	@Column(name = "port_dsecription")
	private String portDescription;
	@Column(name = "port_regdate")
	private Date portRegdate;
	@Column(name = "port_startDate")
	private Date portStartDate;
	@Column(name = "port_endDate")
	private Date portEndDate;
	@Column(name = "port_status")
	private int portStatus;

	
}
