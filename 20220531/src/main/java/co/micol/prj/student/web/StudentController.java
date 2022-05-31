package co.micol.prj.student.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.micol.prj.student.service.StudentService;
import co.micol.prj.student.vo.StudentVO;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentDao;
	
	@RequestMapping("/studentList.do")//전체회원 목록 보기
	public String studentList(Model model) {
		model.addAttribute("students",studentDao.studentSelectList());
		return "student/studentList";
	}
	
	@RequestMapping("/studentJoinForm.do")
	public String studentJoinForm() {
		return "student/studentJoinForm";
	}
	
	@PostMapping("studentJoin.do")
	public String studentJoin(StudentVO vo,Model model) {
		int n = studentDao.studentInsert(vo);
		if(n !=0) {
			model.addAttribute("message","회원가입이 성공적으로 처리되었습니다");
		}else {
			model.addAttribute("message","회원가입 실패!!!");
		}
		return "student/studentJoin";
	}
	@GetMapping("/ajaxIdCheck.do")
	@ResponseBody
	public String ajaxIdCheck(String id) {
		boolean b = studentDao.idCheck(id);
		String data="N"; //존재하는 아이디
		if (!b) {
			data = "Y"; //사용할 수 있는 아이디
		}
		return data;
	}
	@RequestMapping("/studentLoginForm.do")
	public String studentLoginForm() {
		return "student/studentLoginForm";
	}
	
	@PostMapping("/studentLogin.do")
	public String studentLogin(StudentVO vo,Model model,HttpSession session) {
//		System.out.println(request.getParameter("id"));
//		System.out.println(request.getParameter("name"));
//		System.out.println("=======================");
		
		vo=studentDao.studentSelect(vo);
		if(vo !=null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			model.addAttribute("message","님 환영합니다");
		}else {
			model.addAttribute("message","아이디 또는 패스워드가 틀립니다");
		}
		
		return "student/studentLogin";
	}
	@RequestMapping("/studentLogout.do")
	public String studentLogout(HttpSession session,Model model) {
		session.invalidate();
		model.addAttribute("message","정상적으로 로그아웃 되었습니다");
		return "student/studentLogout";
	}
}
