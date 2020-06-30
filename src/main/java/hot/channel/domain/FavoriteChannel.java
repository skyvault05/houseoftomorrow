package hot.channel.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import hot.member.domain.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@IdClass(FavoriteChannelId.class)
@Setter
@Getter
@NoArgsConstructor
public class FavoriteChannel {
	@Id
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "ch_no")
	private Channel channel;
}
