package hot.member.domain;

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

@Entity
@Table(name =  "price")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Price {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "price_no")
	private Integer priceNo;
	
	@Column(name = "price_amount")
	private int priceAmount;
	
	@Column(name = "price_name")
	private String priceName;

}
