package hot.notice.service;

import java.util.List;

import hot.member.domain.Notice;

public interface NoticeService {
	
	/**
	 * 공지사항 등록하기
	 * */
	public int insertNotice(Notice notice);
	
	/**
	 * 공지사항 수정하기
	 * */
	public int updateNotice(Notice notice);
	
	/**
	 * 공지사항 삭제하기
	 * */
	public int deleteNotice(int noticeNo);
	
	/**
	 * 공지사항 조회하기
	 * */
	public Notice selectNotice(Integer noticeNo);  //noticeNo이 null이면 전체 조회

	/**
	 * 전체 조회하기
	 * */
	public  List<Notice> selectAll();


}
