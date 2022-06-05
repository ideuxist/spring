package co.kkw.prj.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kkw.prj.board.service.BoardService;
import co.kkw.prj.board.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardDAO;
	
	@Autowired
	private String saveDir;
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		model.addAttribute("boards",boardDAO.boardSelectList());
		return "board/boardList";
	}
	@RequestMapping("/boardSelect.do")
	public String boardSelect(BoardVO vo,Model model) {
		System.out.println(vo.getBoardId()); 
		boardDAO.boardHitUpdate(vo.getBoardId());
		model.addAttribute("content",boardDAO.boardSelect(vo));
		return "board/boardContent";
	}
	@RequestMapping("/boardInsertForm.do") 
	public String boardInsertForm() {
		return "board/boardInsertForm";
	}
	@RequestMapping("/boardInsert.do")
	public String boardInsert(BoardVO vo) {
		boardDAO.boardInsert(vo);
		return "redirect:boardList.do";
	}
	
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(BoardVO vo,Model model) {
		model.addAttribute("content",boardDAO.boardSelect(vo));
		return "board/boardUpdateForm";
	}
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo) {
		boardDAO.boardUpdate(vo);
		return "redirect:boardList.do";
	}
	@RequestMapping("/boardDelete.do")
	public String boardDelete(BoardVO vo) {
		boardDAO.boardDelete(vo);
		return "redirect:boardList.do";
	}
	@RequestMapping("/ajaxList.do")
	@ResponseBody
	public List<BoardVO> ajaxList() {
		return boardDAO.boardSelectList();
	}
}
