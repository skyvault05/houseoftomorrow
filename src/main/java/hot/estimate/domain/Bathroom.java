package hot.estimate.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Embeddable
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class Bathroom{
	
	
	@Column(name = "bathroom_number_of_rooms", table = "bathroom")
	private Integer bathroomNumberOfRooms;
	@Column(name = "bathroom_type", table = "bathroom")
	private Integer bathroomType;
	@Column(name = "bathroom_ceiling", table = "bathroom")
	private Integer bathroomCeiling;
	@Column(name = "bathroom_tile", table = "bathroom")
	private Integer bathroomTile;

}
