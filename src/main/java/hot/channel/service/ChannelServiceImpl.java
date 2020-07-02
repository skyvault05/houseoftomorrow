package hot.channel.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import hot.aws.S3Manager;
import hot.channel.domain.Channel;
import hot.channel.domain.FavoriteChannel;
import hot.channel.domain.FavoritePortfolio;
import hot.channel.repository.ChannelRepository;
import hot.channel.repository.FavoriteChannelRepository;
import hot.channel.repository.FavoritePortfolioRepository;
import hot.constructor.repository.PortfolioRepository;
import hot.member.domain.Member;
import hot.member.domain.Portfolio;
import hot.constructor.repository.ConstructorRepository;
import hot.member.repository.MemberRepository;


@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelRepository channelRepository;
	@Autowired
	private ConstructorRepository constructorRepository;
	@Autowired
	private S3Manager s3Manager;
	@Autowired
	private MemberRepository memberRep;
	@Autowired
	private FavoriteChannelRepository fcRep;
	@Autowired
	private FavoritePortfolioRepository fpRep;
	@Autowired
	private PortfolioRepository portRep;
	/**
	 * 채널등록
	 */
	@Override
	@Transactional
	public void insertChannel(Channel channel, MultipartFile chImg) {
		try {
			if (chImg.isEmpty())throw new RuntimeException("파일이 없습니다.");
			String fileName = s3Manager.saveUploadedFiles(chImg);
			channel.setChImg(fileName);
			constructorRepository.save(channel.getConstructor());
			channelRepository.save(channel);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 관심채널 추가
	 * */
	@Override
	public void insertFavoriteChannel(Integer membNo, Integer chaNo) {
		Member member = memberRep.findById(membNo).orElse(null);
		Channel channel = channelRepository.findById(chaNo).orElse(null);
		FavoriteChannel fc = new FavoriteChannel();
		fc.setMember(member);
		fc.setChannel(channel);
		fcRep.save(fc);		
	}
	
	/**
	 * 관심채널 삭제
	 * */
	@Transactional(dontRollbackOn=Exception.class)
	@Override
	public void deleteFavoriteChannel(int membNo, int chaNo) {
		Member member = memberRep.findById(membNo).orElse(null);
		Channel channel = channelRepository.findById(chaNo).orElse(null);
		
		fcRep.deleteByMemberAndChannel(member, channel);
	}

	/**
	 * 로그인한 회원의 관심 채널 목록
	 * */
	@Override
	public List<FavoriteChannel> myFavoriteChannel(int membNo) {
		Member member = memberRep.findById(membNo).orElse(null);
		
		List<FavoriteChannel> fvChannel = fcRep.findByMember(member);
//		for(FavoriteChannel channel : fvChannel) {
//			System.out.println("채널번호: " + channel.getChannel().getChNo());
//		}
		return fvChannel;
	}

	@Override
	public void insertFavoritePortfolio(Integer membNo, Integer portNo) {
		Member member = memberRep.findById(membNo).orElse(null);
		Portfolio portfolio = portRep.findById(portNo).orElse(null);
		
		FavoritePortfolio favoritePortfolio = new FavoritePortfolio();
		
		favoritePortfolio.setMember(member);
		favoritePortfolio.setPortfolio(portfolio);
		fpRep.save(favoritePortfolio);
		
	}

	@Transactional(dontRollbackOn=Exception.class) // 오류 없애려고 추가한 코드
	@Override
	public void deleteFavoritePortfolio(int membNo, int portNo) {
		Member member = memberRep.findById(membNo).orElse(null);
		Portfolio portfolio = portRep.findById(portNo).orElse(null);
		
		fpRep.deleteByMemberAndPortfolio(member, portfolio);		
	}

	@Override
	public List<FavoritePortfolio> myFavoritePortfolio(int membNo) {
		
		Member member = memberRep.findById(membNo).orElse(null);
		
		List<FavoritePortfolio> favoritePort = fpRep.findByMember(member);
		
		return favoritePort;
	}

	/**
	 * 채널조회
	 */
	@Override
	public Channel selectChannel(int ChNo) {
		
		
		return channelRepository.findById(ChNo).orElse(null);
		
	}
}
