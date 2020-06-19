package hot.member.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Embeddable
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Kitchen{	
	@Column(name="kitchen_type", table = "kitchen")
	private int kitchenType;
	@Column(name="kitchen_max_width", table = "kitchen")
	private int kitchenMaxWidth;
	@Column(name="kitchen_countertop", table = "kitchen")
	private int kitchenCountertop;
	@Column(name="kitchen_door", table = "kitchen")
	private int kitchenDoor;
	@Column(name="kitchen_tile", table = "kitchen")
	private int kitchenTile;

}
