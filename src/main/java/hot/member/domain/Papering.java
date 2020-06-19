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
public class Papering {

	
	@Column(name = "papering_type", table = "papering")
	private int paperingType;
	@Column(name = "papering_area", table = "papering")
	private int paperingArea;
	@Column(name = "papering_number_of_rooms", table = "papering")
	private int paperingNumberOfRooms;
	@Column(name = "papering_ceiling", table = "papering")
	private int paperingCeiling;
	@Column(name = "papering_veranda", table = "papering")
	private int paperingVeranda;
	@Column(name = "papering_burdon", table = "papering")
	private int paperingBurdon;

}
