package hot.member.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Embeddable
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class Kitchen{	
	@Column(name="kitchen_type", table = "kitchen")
	private Integer kitchenType;
	@Column(name="kitchen_max_width", table = "kitchen")
	private Integer kitchenMaxWidth;
	@Column(name="kitchen_countertop", table = "kitchen")
	private Integer kitchenCountertop;
	@Column(name="kitchen_door", table = "kitchen")
	private Integer kitchenDoor;
	@Column(name="kitchen_tile", table = "kitchen")
	private Integer kitchenTile;

}
