package hot.member.domain;

import java.security.acl.NotOwnerException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "notification")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class Notification {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "notification_no")
	private Integer notificationNo;
	
	
	@JoinColumn(name = "member_no")
	@ManyToOne
	private Member memberNo;
	
	@Column(name = "notification_category")
	private Integer notificationCategory;
	
	@Column(name = "notification_count")
	private Integer notificationCount;
	
	
}
