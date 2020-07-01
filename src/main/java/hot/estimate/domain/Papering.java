package hot.estimate.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Embeddable
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate

public class Papering implements EstimateSecondaryTable {

	
	@Column(name = "papering_type", table = "papering")
	private Integer paperingType;
	@Column(name = "papering_area", table = "papering")
	private Integer paperingArea;
	@Column(name = "papering_number_of_rooms", table = "papering")
	private Integer paperingNumberOfRooms;
	@Column(name = "papering_ceiling", table = "papering")
	private Integer paperingCeiling;
	@Column(name = "papering_veranda", table = "papering")
	private Integer paperingVeranda;
	@Column(name = "papering_burdon", table = "papering")
	private Integer paperingBurdon;

}
