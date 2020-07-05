package hot.consulting.dto;

import java.sql.Timestamp;

import hot.consulting.domain.Consulting;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ContractDTO {
	private Timestamp contractTime;
	private Consulting consulting;
	private String memberName;
	private String constructorName;
}
