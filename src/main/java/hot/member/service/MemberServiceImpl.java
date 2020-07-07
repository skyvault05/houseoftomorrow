package hot.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import hot.member.domain.Member;
import hot.member.repository.MemberRepository;
import hot.member.repository.MemberRoleRepository;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private MemberRoleRepository memberRoleRep;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private PasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Override
	public int memberInsert(Member member) {
		member.setMemberPwd(encoder.encode(member.getMemberPwd()));
		member.setMemberRole(memberRoleRep.getOne(member.getMemberRole().getMemberRoleNo()));
		memberRep.save(member);
		return 0;
	}
	
	@Override
	public Member selectMember(String memberId) {
		Member member = memberRep.findByMemberId(memberId);
		return member;
	}


	@Override
	public void memberUpdate(Member member, String currentPassword) {
		Member dbMember = memberRep.findById(member.getMemberNo()).orElse(null);
		if(!passwordEncoder.matches(currentPassword, dbMember.getMemberPwd())) {
			throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		dbMember.setMemberPwd(passwordEncoder.encode(member.getMemberPwd()));
		dbMember.setMemberName(member.getMemberName());
		dbMember.setMemberPhone(member.getMemberPhone());
		memberRep.save(dbMember);
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
		// TODO Auto-generated method stub
		return null;
	}
	
	

	
	@Override
	public Member selectMemberByPhone(String phone) {
		return memberRep.findByMemberPhone(phone);
	}

	@Override
	public String findMemberName(int memberNo) {
		Member member = memberRep.findById(memberNo).orElse(null);
		String name = null;
		if(member != null) {
			name = member.getMemberName();
		}
		return name;
	}

	@Override
	public Member findMemberByMemberNo(Integer memberNo) {		
		return memberRep.findById(memberNo).orElse(null);
	}
}
