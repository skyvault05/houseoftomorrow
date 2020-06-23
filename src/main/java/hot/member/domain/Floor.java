package hot.member.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Embeddable
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Floor{	
	@Column(name = "floor_type", table = "floor")
	private int floorType;
	@Column(name = "floor_area", table = "floor")
	private int floorArea;
	@Column(name = "floor_number_of_rooms", table = "floor")
	private int floorNumberOfRooms;
	@Column(name = "floor_veranda", table = "floor")
	private int floorVeranda;
	@Column(name = "floor_current_floor", table = "floor")
	private int floorCurrentFloor;
	@Column(name = "floor_burdon", table = "floor")
	private int floorBurdon;

}