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
@Table(name = "order")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@DynamicUpdate
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_no")
	private Integer orderNo;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Constructor constructor;
	
	@ManyToOne
	@JoinColumn(name = "port_no")
	private Portfolio Portfolio;
	
	@ManyToOne
	@JoinColumn(name = "price_no")
	private Price price;
	
	@Column(name = "order_regdate")
	private Timestamp orderRegdate;
	
	@Column(name = "order_payment")
	private int orderPayment;
	
	@Column(name = "order_method")
	private String orderMethod;
	
	@Column(name = "order_status")
	private int oderStatus;

}
