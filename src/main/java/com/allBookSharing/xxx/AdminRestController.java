package com.allBookSharing.xxx;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.service.AdminManagement;
import com.allBookSharing.xxx.service.LibrarianManagement;

@RestController
public class AdminRestController {
	@Autowired
	private LibrarianManagement la;
	
	@Autowired
	private AdminManagement am;
	
	ModelAndView mav;

	@RequestMapping(value = "/getlibraryinfo", produces = "application/json;charset=UTF-8")
	public List<Library> getLibraryInfo() {
		List<Library> lib = la.getlibraryinfo();
		return lib;
	}
	

	@RequestMapping(value = "/librarynextcode", produces = "application/json;charset=UTF-8")
	public Integer getLibraryNextCode() {
		Integer code = am.getLibraryNextCode();
		
		return code;
	}
	
	
}
