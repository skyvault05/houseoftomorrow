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
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate

public class Tile implements EstimateSecondaryTable{
	
	@Column(name = "tile_type", table = "tile")
	private Integer tileType;
	@Column(name = "tile_area", table = "tile")
	private Integer tileArea;

}
