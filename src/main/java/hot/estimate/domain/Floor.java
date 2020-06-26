package hot.estimate.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Embeddable
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate

public class Floor{	
	@Column(name = "floor_type", table = "floor")
	private Integer floorType;
	@Column(name = "floor_area", table = "floor")
	private Integer floorArea;
	@Column(name = "floor_number_of_rooms", table = "floor")
	private Integer floorNumberOfRooms;
	@Column(name = "floor_veranda", table = "floor")
	private Integer floorVeranda;
	@Column(name = "floor_current_floor", table = "floor")
	private Integer floorCurrentFloor;
	@Column(name = "floor_burdon", table = "floor")
	private Integer floorBurdon;

}