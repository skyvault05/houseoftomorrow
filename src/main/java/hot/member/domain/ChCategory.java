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
@Table(name = "ch_category")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ChCategory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ch_cate_no")
	private Integer chCateNo;
	
	@Column(name = "ch_cate_name")
	private String chCateName;


}
