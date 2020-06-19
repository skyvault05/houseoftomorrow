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
public class Tile{
	
	
	@Column(name = "tile_type", table = "tile")
	private int tileType;
	@Column(name = "tile_area", table = "tile")
	private int tileArea;

}
