package com.spring.model;

import java.util.HashMap;
import java.util.List;

public interface InterBoardDAO {

	List<FaqVO> faqList(HashMap<String, String> paraMap); // FAQ 리스트(검색어 있음)

	int getTotalNoticeCount(HashMap<String, String> paraMap); // 총 공지글 개수

	List<NoticeVO> noticeListWithPaging(HashMap<String, String> paraMap); // 페이징처리한 공지글 리스트

	NoticeVO getView(String seq); // 공지사항 글 1개 보기 페이지로 이동(조회수 증가 없음)

	void setAddReadCount(String seq); // 공지사항 글 1개 보기 조회수 증가

	int getTotalFaqCount(HashMap<String, String> paraMap); // 총 faq 개수

	int qnaAdd(HashMap<String, String> paraMap); // Qna 문의 등록하기

	List<HashMap<String, String>> reserveTitleList(int idx); // 로그인한 회원의 예매공연목록과 예매공연코드 가져오기

	List<QnaVO> qnaList(HashMap<String, String> paraMap); // qna 글목록 보여주기

	int getTotalQnaCount(HashMap<String, String> paraMap); // 총 qna 개수

	int getGroupnoMax(); // qna 테이블에서 groupno 컬럼의 최대값 구하기

	QnaVO getQnaView(String seq); // qna 글 1개 보기 페이지로 이동(조회수 증가 없음)

	int qnaAddAdmin(QnaVO qvo); // Qna 답변 등록하기
}