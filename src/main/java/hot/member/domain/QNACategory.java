package hot.member.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "qna_category")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class QNACategory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "qna_category_no")
	private Integer qnaCategoryNo;
	@Column(name = "qna_category_name")
	private String qnaCategoryName;

}
