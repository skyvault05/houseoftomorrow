package hot.channel.domain;

import java.io.Serializable;

import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode
@NoArgsConstructor
public class FavoriteChannelId implements Serializable{
	private Integer member;
	private Integer channel;
}
