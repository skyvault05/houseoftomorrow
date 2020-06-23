package hot.temp;

import hot.member.domain.Notification;

public interface NotificationService {
	
	int notifictionInsert(Notification notification);
	int notificationDelete(Integer notificationNo);
	
}
