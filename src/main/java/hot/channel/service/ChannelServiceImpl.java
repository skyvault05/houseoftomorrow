package hot.channel.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import hot.aws.S3Manager;
import hot.member.domain.Channel;
import hot.member.domain.Review;
import hot.member.repository.ChannelRepository;
import hot.member.repository.ConstructorRepository;
import hot.member.repository.ReviewRepository;
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
	/**
	 * 채널들록
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
	@Override
	public void updateGrade(Integer chNo) {
		//평균 구하기
		List<Review> list = reviewService.selectReview(chNo);
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
	
	

}
