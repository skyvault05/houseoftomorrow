package hot.temp;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Member;
import hot.member.repository.MemberRepository;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberRepository memberRepository;

	@Override
	public int memberUpdate(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberDelete(int memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String findId(String phoneNumber, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findPwd(Member member) {
		
		return null;
	}

	@Override
	public int memberInsert(Member member) throws RuntimeException {
		memberRepository.save(member);
		return 0;
	}

}
