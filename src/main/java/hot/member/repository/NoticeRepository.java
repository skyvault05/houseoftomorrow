package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Integer> {

}
