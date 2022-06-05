package co.kkw.prj.board.service;

import java.util.List;

import co.kkw.prj.board.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> boardSelectList();// 전체 리스트 출력
	BoardVO boardSelect(BoardVO vo);// 한건 상세 보기
	int boardInsert(BoardVO vo);//게시글입력
	int boardUpdate(BoardVO vo);//게시글 수정
	int boardDelete(BoardVO vo);//게시글 삭제
	
	int boardHitUpdate(int id);//조회수 업데이트
}
