package co.kkw.prj.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kkw.prj.board.service.BoardMapper;
import co.kkw.prj.board.service.BoardService;
import co.kkw.prj.board.vo.BoardVO;

@Repository("boardDAO")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper map;
	
	@Override
	public List<BoardVO> boardSelectList() {
		return map.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return map.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return map.boardUpdate(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return map.boardDelete(vo);
	}

	@Override
	public int boardHitUpdate(int id) {
		return map.boardHitUpdate(id);
	}

}
