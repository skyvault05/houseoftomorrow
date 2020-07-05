package hot.constructor.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.channel.domain.Channel;
import hot.member.domain.Constructor;
import hot.member.domain.Member;

public interface ConstructorRepository extends JpaRepository<Constructor, Integer>{
	
	Constructor findByMember(Member member);
}
