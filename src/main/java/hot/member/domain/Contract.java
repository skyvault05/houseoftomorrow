package hot.member.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name =  "contract")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Contract {
	
	@Id
	private Integer consulNo;
	
	@MapsId
	@OneToOne
	@JoinColumn(name = "consul_no")
	private Consulting consulting;
	
	@Column(name = "contract_img")
	private String contractImg;
	
	@Column(name = "contract_update_date")
	private Timestamp contractUpdateDate;
	

	@Column(name = "consul_user_decide")
	private int consulUserDecide;
	
	@Column(name = "consul_con_decide")
	private int consulConDecide;
	
}
