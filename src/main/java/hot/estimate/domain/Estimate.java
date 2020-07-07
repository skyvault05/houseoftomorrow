package hot.estimate.domain;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.SecondaryTables;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;

import hot.member.domain.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name="estimate")
@SecondaryTables({
	@SecondaryTable(name = "kitchen", pkJoinColumns = @PrimaryKeyJoinColumn(name = "est_no")),
	@SecondaryTable(name = "floor", pkJoinColumns = @PrimaryKeyJoinColumn(name = "est_no")),
	@SecondaryTable(name = "linoleum", pkJoinColumns = @PrimaryKeyJoinColumn(name = "est_no")),
	@SecondaryTable(name = "papering", pkJoinColumns = @PrimaryKeyJoinColumn(name = "est_no")),
	@SecondaryTable(name = "tile", pkJoinColumns = @PrimaryKeyJoinColumn(name = "est_no")),
	@SecondaryTable(name = "bathroom", pkJoinColumns = @PrimaryKeyJoinColumn(name = "est_no"))
})
@Getter
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class Estimate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "est_no")
	private Integer estNo;
	
	@ManyToOne
	@JoinColumn(name="member_no")
	private Member member;
	
	@Column(name = "est_description")
//	@Type(type = "text")
	private String estDescription;
	@Column(name = "est_regdate")
	private Timestamp estRegdate;
	@Column(name="est_status")
	private Integer estStatus;
	
	@Embedded
	private Kitchen kitchen;
	@Embedded
	private Floor floor;
	@Embedded
	private Linoleum linoleum;
	@Embedded
	private Papering papering;
	@Embedded
	private Tile tile;
	@Embedded
	private Bathroom bathroom;
	
	@Transient
	private Map<String, String> estDetails = new HashMap<>();
	
	public void setEstimateDetails() {
		try {
			this.estDetails = EstimateDetails.getDetail(this);
		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	public void setEstNo(Integer estNo) {
		this.estNo = estNo;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public void setEstDescription(String estDescription) {
		this.estDescription = estDescription;
	}

	public void setEstRegdate(Timestamp estRegdate) {
		this.estRegdate = estRegdate;
	}

	public void setEstStatus(Integer estStatus) {
		this.estStatus = estStatus;
	}

	public void setKitchen(Kitchen kitchen) {
		this.kitchen = kitchen;
		this.setEstimateDetails();
	}

	public void setFloor(Floor floor) {
		this.floor = floor;
		this.setEstimateDetails();
	}

	public void setLinoleum(Linoleum linoleum) {
		this.linoleum = linoleum;
		this.setEstimateDetails();
	}

	public void setPapering(Papering papering) {
		this.papering = papering;
		this.setEstimateDetails();
	}

	public void setTile(Tile tile) {
		this.tile = tile;
		this.setEstimateDetails();
	}

	public void setBathroom(Bathroom bathroom) {
		this.bathroom = bathroom;
		this.setEstimateDetails();
	}

	public void setEstDetails(Map<String, String> estDetails) {
		this.estDetails = estDetails;
	}
	
	

}
