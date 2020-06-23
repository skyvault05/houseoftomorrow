package hot.temp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Notification;
import hot.member.repository.NotificationRepository;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	NotificationRepository notificationRepository;
	
	@Override
	public int notifictionInsert(Notification notification) {
		notificationRepository.save(notification);
		return 0;
	}

	@Override
	public int notificationDelete(Integer notificationNo) {
		notificationRepository.deleteById(notificationNo);
		return 0;
	}

}
