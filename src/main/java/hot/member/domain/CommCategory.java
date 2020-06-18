package hot.member.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "comm_category")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommCategory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comm_category_no")
	private Long commCategoryNo;
	@Column(name = "comm_category_name")
	private String commCategoryName;


}
