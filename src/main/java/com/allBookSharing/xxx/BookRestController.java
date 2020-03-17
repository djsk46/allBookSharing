package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.validator.constraints.ISBN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Liked;
import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.service.BookManagement;
import com.allBookSharing.xxx.service.MemberManagement;

@RestController

public class BookRestController {
	@Autowired
	private BookManagement bm;
	ModelAndView mav;
	@Autowired
	private MemberManagement mm;
	
	@GetMapping(value="/totalbooksearch",produces="application/json;charset=UTF-8")
	public List<Books> bookSearch(String bk_search,String selectval) {
		
		List<Books> bList=bm.bookSearch(bk_search,selectval);
		return bList;
	} 
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/reservation",produces="application/json;charset=UTF-8")
	public String reservationInsert(Reservation r,Principal p) {
		r.setRv_id(p.getName());
		Boolean result= bm.reservationInsert(r);
		if(result) {
			return "성공";
		}else{
		
		return "실패";}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/reservationconfirm",produces="application/json;charset=UTF-8")
	public String reservationConfirm(Reservation r,Principal p) {
		r.setRv_id(p.getName());
		Integer result=bm.reservationConfirm(r);
		if(result==1) {
			return "성공";
		}else {
			return "실패";
			}
		
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/reservationcancel",produces="application/json;charset=UTF-8")
	public Boolean reservationCancel(Reservation r,Principal p) {
		r.setRv_id(p.getName());
		System.out.println("cc r="+r.toString());
		Boolean result=bm.reservationCancel(r);

		return result;
	}
	
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/likedconfirm",produces="application/json;charset=UTF-8")
	public String likedConfirm(Liked lk,Principal p) {
		lk.setLk_id(p.getName());
		Integer result=bm.likedConfirm(lk);
		if(result==1) {
			return "성공";
		}else {
			return "실패";
			}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/likeinsert",produces="application/json;charset=UTF-8")
	public Boolean likeInsert(Liked lk,Principal p) {
		lk.setLk_id(p.getName());
		
		System.out.println("찜추가lk-tostring="+lk.toString());
		Boolean result=bm.likeInsert(lk);

		return result;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/likecancel",produces="application/json;charset=UTF-8")
	public Boolean likeCancel(Liked lk,Principal p) {
		lk.setLk_id(p.getName());
		
		Boolean result=bm.likeCancel(lk);
		return result;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/likecount",produces="application/json;charset=UTF-8")
	public Integer likeCount(Liked lk) {
		Integer result=bm.likeCount(lk);
		return result;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/delicount",produces="application/json;charset=UTF-8")
	public Integer deliCount(DeliveryReq dr,Principal p) {
		dr.setDe_id(p.getName());
		Integer result=bm.deliCount(dr);
		return result;
		
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/deliinsert",produces="application/json;charset=UTF-8")
	public Boolean deliInsert(DeliveryReq dr,Principal p) {
		dr.setDe_id(p.getName());
		Boolean result=bm.deliInsert(dr);
		return result;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/myregionsearch",produces="application/json;charset=UTF-8")
	public List<Books> myRegionSearch(String bk_search,String selectval,Principal p) {
		String region=mm.myRegion(p);
		System.out.println("region="+region);
		List<Books> bList=bm.myRegionSearch(bk_search,selectval,region);
		
		return bList;
	}
	@Secured("ROLE_USER")
	@RequestMapping(value="/myregionlib",produces="application/json;charset=UTF-8")
	public List<Library> myRegionLib(String bk_search,String selectval,Principal p) {
		System.out.println("지역1");
		String region=mm.myRegion(p);
		System.out.println("region="+region);
		List<Library> lbList=bm.myRegionLib(bk_search,selectval,region);
		
		return lbList;
	}
	
	
	

}
