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
public class Linoleum{
	
	@Column(name = "linoleum_thick", table = "linoleum")
	private int linoleumThick;
	@Column(name = "linoleum_area", table = "linoleum")
	private int linoleumArea;
	@Column(name = "linoleum_number_of_rooms", table = "linoleum")
	private int linoleumNumberOfRooms;
	@Column(name = "linoleum_veranda", table = "linoleum")
	private int linoleumVeranda;
	@Column(name = "linoleum_current_floor", table = "linoleum")
	private int linoleumCurrentFloor;
	@Column(name = "linoleum_burdon", table = "linoleum")
	private int linoleumBurdon;

}
