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

public class Linoleum{
	
	@Column(name = "linoleum_thick", table = "linoleum")
	private Integer linoleumThick;
	@Column(name = "linoleum_area", table = "linoleum")
	private Integer linoleumArea;
	@Column(name = "linoleum_number_of_rooms", table = "linoleum")
	private Integer linoleumNumberOfRooms;
	@Column(name = "linoleum_veranda", table = "linoleum")
	private Integer linoleumVeranda;
	@Column(name = "linoleum_current_floor", table = "linoleum")
	private Integer linoleumCurrentFloor;
	@Column(name = "linoleum_burdon", table = "linoleum")
	private Integer linoleumBurdon;

}
