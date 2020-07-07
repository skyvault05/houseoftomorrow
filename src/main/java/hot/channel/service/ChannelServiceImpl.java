package hot.channel.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import hot.aws.S3Manager;
import hot.channel.domain.Channel;
import hot.channel.domain.FavoriteChannel;
import hot.channel.domain.FavoritePortfolio;
import hot.channel.repository.ChannelRepository;
import hot.channel.repository.FavoriteChannelRepository;
import hot.channel.repository.FavoritePortfolioRepository;
import hot.constructor.repository.ConstructorRepository;
import hot.constructor.repository.PortfolioRepository;
import hot.member.domain.Constructor;
import hot.member.domain.ConstructorRegisterRequest;
import hot.member.domain.Member;
import hot.member.domain.Portfolio;
import hot.member.repository.ConstructorRegisterRequestRepository;
import hot.member.repository.MemberRepository;
import hot.review.domain.Review;
import hot.review.repository.ReviewRepository;
import hot.review.service.ReviewService;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelRepository channelRepository;
	@Autowired
	private ConstructorRepository constructorRepository;
	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	private S3Manager s3Manager;
	@Autowired
	private ReviewService reviewService;	
	@Autowired
	private MemberRepository memberRep;
	@Autowired
	private FavoriteChannelRepository fcRep;
	@Autowired
	private FavoritePortfolioRepository fpRep;
	@Autowired
	private PortfolioRepository portRep;
	@Autowired
	ConstructorRegisterRequestRepository conRegiRequestRep;

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
			ConstructorRegisterRequest conRegiRequest = new ConstructorRegisterRequest();
			conRegiRequest.setChannel(channel);
			constructorRepository.save(channel.getConstructor());
			channelRepository.save(channel);
			conRegiRequestRep.save(conRegiRequest);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateGrade(Integer chNo) {
		//평균 구하기
		List<Review> list = reviewService.selectReviewChNo(chNo);
		Double avg = 0D;
		for(Review re : list) {
			avg += re.getReviewGrade();
		}
		avg = avg/list.size();
		
		//채널 가져오기		
		Channel channel = channelRepository.findById(chNo).orElse(null);
		
		//채널에 평균 넣기
		channel.setChGrades(avg);
		
		//채널 업데이트하기
		channelRepository.save(channel);
		
	}
	
	/**
	 * 관심채널 추가
	 * */
	@Override
	public void insertFavoriteChannel(Integer membNo, Integer chaNo) {
		System.out.println("membNo: " + membNo);
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
	public void deleteFavoriteChannel(Integer membNo, Integer chaNo) {
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
	 * 채널상세 조회
	 */
	@Override
	public Channel selectChannel(int ChNo) {		
		return channelRepository.findById(ChNo).orElse(null);
	}

	/**
	 * 채널 목록 조회
	 * */
	@Override
	public List<Channel> channelList() {
		System.out.println("서비스");
		List<Channel> list = channelRepository.findByChStatus(0); // 기본값이 1이 아닌 0인가봄.
		return list;
	}

	/**
	 * 로그인한 유저가 자기 페이지를 볼 수 있게
	 * */
	@Override
	public Channel myChannel(Integer memberNo) {
		Channel channel = channelRepository.selectByMemberNo(memberNo);
		return channel;
	}

	/**
	 * 채널 수정
	 * @throws IOException 
	 * */
	@Override
	@Transactional // 절대 까먹지마.....
	public void updateChannel(Constructor constructor, Channel channel, Integer chaNo, MultipartFile file) throws IOException {
		
		Channel channelDB = channelRepository.findById(chaNo).orElse(null);		
		int memberNo = channelDB.getConstructor().getMemberNo();
		Constructor conDB = constructorRepository.findById(memberNo).orElse(null);

		conDB.setConName(constructor.getConName());
		conDB.setConPhone(constructor.getConPhone());
		conDB.setConIsCompany(constructor.getConIsCompany());
		conDB.setConCareer(constructor.getConCareer());
		conDB.setConCertification(constructor.getConCertification());
		conDB.setConAddr(constructor.getConAddr());
		channelDB.setChDescription(channel.getChDescription());
		channelDB.setChRegdate(channel.getChRegdate());
		channelDB.setChDescription(channel.getChDescription());
		
		String imgPath = s3Manager.saveUploadedFiles(file);
		channelDB.setChImg(imgPath);
	}
	
	
	@Override
	public String findConName(int chNo) {
		Channel channel = channelRepository.findById(chNo).orElse(null);
		String conName = null;
		if(channel != null) {
			conName = channel.getConstructor().getConName();
		}
		return conName;
	}
	
	
	/***
	 * index page 시공사 
	 */
	@Override
	public List<Channel> selectChannelByChstatusAndchGrades(Integer chStatus) {
				
		return channelRepository.findAllOrderBychGradesDesc(chStatus);
	}
	
	
	@Override
	public Page<Channel> selectAllChannel(Pageable pageable) {
		
		return channelRepository.findByChStatus(pageable, 1);
	}
	
}
