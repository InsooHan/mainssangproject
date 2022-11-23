package fpro.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.AdminDto;
import fpro.data.service.AdminService;





@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@GetMapping("/admin/list")
	public ModelAndView adminlist(@RequestParam(defaultValue = "1")int currentPage, //얘는 default값 1
			@RequestParam(value = "searchcolumn",required =false) String sc,//searchcolumn은 boardlist에선언한 name
			@RequestParam(value = "searchword",required =false) String sw //serachword도 리스트에선언 requier false는 값이없을때 null값표시
			) {
		
		ModelAndView mview=new ModelAndView();
		
		//페이징에 필요한 변수
				int totalCount=service.getTotalCount(sc, sw);
				int totalPage; //총페이지수
				int startPage; //각블럭의 시작페이지
				int endPage; //각블럭의 끝페이지
				int start; //각페이지의 시작번호
				int perPage=5; //한페이지에 보여질 글의 갯수
				int perBlock=5; //한블럭당 보여지는 페이지개수
				
				
				int otherCount=service.getOtherCount(sc, sw);
				int systemCount=service.getSystemCount(sc, sw);
				int theaterCount=service.getTheaterCount(sc, sw);
				int systemPage;
				int systemendPage; //각블럭의 끝페이지
				int systemstart; //각페이지의 시작번호
				int systemperPage=5; //한페이지에 보여질 글의 갯수
				int systemperBlock=5; //한블럭당 보여지는 페이지개수

				//총갯수:
				//총페이지갯수 구하기
					totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
				
				/*추가*/
					

				//각블럭의 시작페이지(현재페이지 3: 시작:1 끝:5)
				//각블럭의 시작페이지(현재페이지 6: 시작:6 끝:10)
					startPage=(currentPage-1)/perBlock*perBlock+1;
					endPage=startPage+perBlock-1;

				//총페이지수가 8 ..2번재 블럭은 startpage6 endpage 10...endpage 8로수정
					if(endPage>totalPage)
						endPage=totalPage;

				//각페이지에서 불러올 시작번호
				//현재페이지가 1일경우 strt 1, 2일경우 6
					start=(currentPage-1)*perPage;

				//각페이지에서 필요한 게시글불러오기
					List<AdminDto>list=service.getList(sc, sw, start, perPage);
				
				
				//list의 각글에 대한 댓글개수 추가하기
				/*for(BoardDto d:list)
				{
					d.setAcount(adao.getAnswerList(d.getNum()).size());
				}*/

				//각글앞에 붙힐 시작번호
				//총글이 만약에 20..1페이지는 20부터 2페이지는 15부터
				//출력해서 1씩 감소하면서 출력
					int	no=totalCount-(currentPage-1)*perPage;
				
				
				//출력에 필요한 변수들을 request에 저장
					mview.addObject("list", list);  //댓글이 포함된후 전달
					mview.addObject("startPage", startPage);
					mview.addObject("totalPage", totalPage);
					mview.addObject("endPage", endPage);
					mview.addObject("no", no);
					mview.addObject("currentPage", currentPage);
					mview.addObject("otherCount", otherCount);
					mview.addObject("systemCount", systemCount);
					mview.addObject("theaterCount", theaterCount);
					mview.addObject("totalCount", totalCount);

					
					mview.setViewName("/admin/adminlist");
					
					return mview;
				
	}
	
	@GetMapping("/admin/form")
	public String form() {
		
	
		return "/admin/writeform";
	}

	
	@PostMapping("/admin/insert")
	public String insert(AdminDto dto, List<MultipartFile> upload,HttpSession session) {
		//경로
		String path=session.getServletContext().getRealPath("/save");
		//업로드안했을때 0번지 파일이 ""이된다
		//업로드 안해도 upload size()는1
		System.out.println(upload.size());
		
		if(upload.get(0).getOriginalFilename().equals(""))
			dto.setPhoto("no");
		else {
			String photo="";
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			for(MultipartFile multi:upload) {
				
				String newName="f_"+sdf.format(new Date())+multi.getOriginalFilename();
				photo+=newName+",";
				
				//업로드
				try {
					multi.transferTo(new File(path+"/"+newName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			//마지막 그림,제거
			photo=photo.substring(0,photo.length()-1);
			//dto에 포토저장
			dto.setPhoto(photo);
		}
		//db insert
		service.insertAdmin(dto);
		
		return "redirect:list";
		//return "redirect:content?num="+service.getMaxNum();
		//return "redirect:list?currentPage="+currentPage;
	}
	@GetMapping("/admin/detail")
	public ModelAndView detail(int num,int currentPage) {
		ModelAndView mview=new ModelAndView();
		//조회수 증가 갖고오기
		service.updateReadcount(num);
		
		//num에 해당하는 dto
		AdminDto dto=service.getData(num);
		
		//저장
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		//포워드
		mview.setViewName("/admin/detail");
		
		return mview;
	}
	@GetMapping("/admin/updateform") //requestmapping해서 짧아진거
	public String uform(int num,Model model //Model은 저장하기위해 num은 값을가져와야되니 parameter써도됨
			) {
		AdminDto dto=service.getData(num);
		
		model.addAttribute("dto", dto); //"dto"인이유는 updateform에서 value값을 dto로받았기때문에
		
		return "/admin/updateform";
	}
	
	@PostMapping("/admin/update")
	public String update(AdminDto dto, List<MultipartFile> upload,HttpSession session) {
		//경로
		String path=session.getServletContext().getRealPath("/save");
		//업로드안했을때 0번지 파일이 ""이된다
		//업로드 안해도 upload size()는1
		System.out.println(upload.size());
		
		if(upload.get(0).getOriginalFilename().equals(""))
			dto.setPhoto("no");
		else {
			String photo="";
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			for(MultipartFile multi:upload) {
				
				String newName="f_"+sdf.format(new Date())+multi.getOriginalFilename();
				photo+=newName+",";
				
				//업로드
				try {
					multi.transferTo(new File(path+"/"+newName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			//마지막 그림,제거
			photo=photo.substring(0,photo.length()-1);
			//dto에 포토저장
			dto.setPhoto(photo);
		}
		//db insert
		service.updateAdmin(dto);
		
		return "redirect:list";
		//return "redirect:content?num="+service.getMaxNum();
		//return "redirect:list?currentPage="+currentPage;
	}
	
	@GetMapping("/admin/delete")
	public String delete(int num, List<MultipartFile> upload,HttpSession session){
		

		String path=session.getServletContext().getRealPath("/save");//폴더
		String uploadfile=service.getData(num).getPhoto();
		
		File file=new File(path+"\\"+uploadfile);
		file.delete();
		
		service.deleteAdmin(num);
		
		return "redirect:list";
		//return "redirect:list?currentPage="+currentPage;
	
	}
}


