package hot.channel.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import hot.member.domain.Member;
import hot.member.domain.Portfolio;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@IdClass(FavoritePortfolioId.class)
@Setter
@Getter
@NoArgsConstructor
public class FavoritePortfolio {
	@Id
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "port_no")
	private Portfolio portfolio;
}
