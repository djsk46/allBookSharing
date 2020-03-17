package com.allBookSharing.xxx;



import java.security.Principal;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.allBookSharing.xxx.service.BookManagement;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.service.librayBookManagement;

@Controller

public class librayBookController {


	@Autowired
	private librayBookManagement lmm;
	
	@Autowired
	private BookManagement bm;
	
	ModelAndView mav;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/librarymain")
	public String libraryMain(Principal principal,HttpServletRequest req) { //사서 메인페이지 이동
		Map<String, Object> map=lmm.getLibrayCodeName(principal);
		
		req.getSession().setAttribute("LB_CODE", map.get("LB_CODE"));
		req.getSession().setAttribute("LB_NAME", map.get("LB_NAME"));
		
		
		return "librarian/librarymain";
	}
<<<<<<< HEAD

=======
  
>>>>>>> 7c0d3862f92e68d9801d08786e696a97a1126f37
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybooklistmove")
	public ModelAndView bookListMove() { //책 목록 페이지 이동
		
		return new ModelAndView("librarian/bookslist");
	}
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybookinsertmove")
	public ModelAndView bookInsertMove() { //책 등록 페이지 이동
		
		return new ModelAndView("librarian/bookinsert");
	 } 

<<<<<<< HEAD

=======
>>>>>>> 7c0d3862f92e68d9801d08786e696a97a1126f37
	@GetMapping(value="/bookdetailpage")
	public ModelAndView bookDetailPage(String bk_code) { 
		mav=bm.bookDetailPage(bk_code);
		
		return mav;
		
	}
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybookinsert")
	public ModelAndView bookInsert(Books book) { //책 등록하는 메소드

		mav=lmm.bookInsert(book);
		
		return mav;
	}
	
	
}
