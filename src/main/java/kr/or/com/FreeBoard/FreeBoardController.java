package kr.or.com.FreeBoard;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.FreeBoard.FreeBoardService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService free_Service;
	
	@Autowired
	private View jsonView;
		
	//게시판 커뮤니티 메인 페이지
	@RequestMapping("/board.do")
	public String BoardList(Model model,HttpServletRequest request, String f, String q){
		
		String category = request.getParameter("category");
		String pagesize = request.getParameter("pagesize");
		String currentpage = request.getParameter("currentpage");
		
		if(category == null || category.trim().equals("")){
			category = "자유게시판"; 			// default 10건씩 
        }else{
        	if(category.equals("자유게시판")){
        	}else if(category.equals("오늘의 이슈")){
        	}else if(category.equals("정치게시판")){
        	}else if(category.equals("공지사항/QnA")){
        	}else{
        		category="자유게시판";
        		return null;
        	}
        }
		
		int totalcount = 0;
		int pagecount = 0;
		
		String field = "title";
		String query ="%%";
		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "15"; 			// default 10건씩 
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
            currentpage = "1";        //default 1 page
        }
        if(f != null && !f.equals("")){
			field = f;
		}
		if(q != null && !q.equals("")){
			query = q;
		}
        
		totalcount = free_Service.boardCount(field, query, category);
		
        int pgsize = Integer.parseInt(pagesize);  		// 10
        int cpage = Integer.parseInt(currentpage);     //1
                               
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
            pagecount = totalcount/pgsize;
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
		
		List<FreeBoardDTO> list = null;

		try{
			 list = free_Service.selectAllFreeBoard(cpage,pgsize,field,query,category);         
		}catch(Exception e){
			e.getMessage();
		}finally{
			model.addAttribute("title", category);
			model.addAttribute("list", list);
			model.addAttribute("cpage", cpage);
			model.addAttribute("pgsize", pgsize);
			model.addAttribute("pagecount", pagecount);
			model.addAttribute("totalcount", totalcount);
			
		}

		return "board.boardIndex";
	}
	
	//게시판 상세보기
	@RequestMapping("/boardDetail.do")
	public String BoardDetail(String no, String currentpage, Model model){
		
		FreeBoardDTO dto=free_Service.selectDetail(no);				 
		List<CommentDTO> list = free_Service.commentList(no);		
		List<CommentDTO> comment = free_Service.commSelect(no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentpage", currentpage);
		model.addAttribute("comment", comment);
		model.addAttribute("list", list);
		
		return "board.FreeBoardDetail";
	}
	
	//글쓰기
	@RequestMapping("/boardWriteView.do")
	public String FreeBoardWrite(String category, String currentpage, Model model){
		model.addAttribute("category", category);
		model.addAttribute("currentpage", currentpage);
		return "board.FreeBoardWrite";
	}
	
	//글쓰기 submit 할때
	@RequestMapping(value="/writeBoard.do", method=RequestMethod.POST)
	public String FreeBoardWriteResult(@RequestParam("uploadfile") MultipartFile file ,FreeBoardDTO dto, Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("id");
		if(logId == null || logId.equals("")){
			model.addAttribute("result", 2);
			return null;
		}
		dto.setId(logId);
		
		String s = request.getParameter("ckeditor");
		dto.setContent(s);
		
		try {
			if(file.getOriginalFilename()==null || file.getOriginalFilename().equals("")){
				dto.setFilename("");
				dto.setFilepath("");
			}else{
				String fileName = file.getOriginalFilename();
				String fileNameExt = fileName.substring(fileName.indexOf(".")+1);
				
				
				@SuppressWarnings("deprecation")
				String path = request.getRealPath("/upload/"+dto.getId());
				File destD = new File(path);
				if(!destD.exists()){
					destD.mkdirs();
				}
				dto.setFilename(fileName);
				File destination = File.createTempFile(fileName.substring(0, fileName.indexOf("."))+"_", "."+fileNameExt, destD);
				dto.setFilepath(destination.getName());
				file.transferTo(destination);
			}
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		int result = free_Service.writeBoard(dto);
		
		model.addAttribute("category", dto.getCategory());
		model.addAttribute("result", result);

		return "board.FreeBoardpointer";
	}
	
	//글 수정
	@RequestMapping(value="/boardModify.do", method=RequestMethod.POST)
	public String boardModify(HttpServletRequest request, @RequestParam("uploadfile") MultipartFile file, FreeBoardDTO dto, String oldfile, String oldfilepath, String currentpage, Model model){
		
		try {
			if(file.getOriginalFilename()==null || file.getOriginalFilename().equals("")){
				if(oldfile==null||oldfile.equals("")){
					dto.setFilename("");
					dto.setFilepath("");
				}else{
					dto.setFilename(oldfile);
					dto.setFilepath(oldfilepath);
				}
			}else{
				String fileName = file.getOriginalFilename();
				String fileNameExt = fileName.substring(fileName.indexOf(".")+1);
				
				
				@SuppressWarnings("deprecation")
				String path = request.getRealPath("/upload/"+dto.getId());
				File destD = new File(path);
				if(!destD.exists()){
					destD.mkdirs();
				}
				
				dto.setFilename(fileName);
				File destination = File.createTempFile(fileName.substring(0, fileName.indexOf("."))+"_", "."+fileNameExt, destD);
				file.transferTo(destination);
				dto.setFilepath(destination.getName());
			}
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		
		String s = request.getParameter("ckeditor");
		dto.setContent(s);
		int result = free_Service.updateContent(dto);
		
		model.addAttribute("category", dto.getCategory());
		model.addAttribute("result", result);
		
		return "board.FreeBoardpointer";
	}
	
	//글 수정 view
	@RequestMapping("boardModifyView.do")
	public String boardModifyView(String no, String currentpage, Model model){
		
		FreeBoardDTO dto=free_Service.selectDetail(no);

		model.addAttribute("dto", dto);
		model.addAttribute("currentpage", currentpage);
		return "board.FreeBoardModify";
		
	}

	//이미지 업로드
	@RequestMapping(value="/imageUpload.do", method=RequestMethod.POST)
	public String imageUpload(HttpServletRequest request, FileUploadDTO dto, Model model){
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("id");
		if(logId == null || logId.equals("")){
			model.addAttribute("result", 2);
			return "fileUploadfail";
		}

		@SuppressWarnings("deprecation")
		String fileUploadPath = request.getRealPath("/upload/"+logId+"/img");

		try{
			MultipartFile upload = dto.getUpload();
			
			if(upload != null){
				String fileName = upload.getOriginalFilename();
				String fileNameExt = fileName.substring(fileName.indexOf(".")+1);
				
				
				if(!"".equals(fileName)){
					File destD = new File(fileUploadPath);
					if(!destD.exists()){
						destD.mkdirs();
					}
					File destination = File.createTempFile("ckeditor_", "."+fileNameExt, destD);
					upload.transferTo(destination);
					
					dto.setNewFilename(destination.getName());
					dto.setImageUrl("upload/"+logId+"/img/"+destination.getName());
					
					model.addAttribute("dto", dto);
					return "fileUploadSuccess";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//글 삭제
	@RequestMapping("removeContent.do")
	public View deleteContent(String no,String category, Model model){
		
		int result = free_Service.deleteContent(no);

		model.addAttribute("result", result);
		model.addAttribute("category", category);
		return jsonView;
	}
	
	
	//코멘트 쓰기
	@RequestMapping("writeComment.do")
	public View commentWrite(CommentDTO cdto, String coNo, String currentpage , Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("id");
		cdto.setId(logId);
		
		if(logId == null || logId.equals("")){
			model.addAttribute("result", 0);
			return jsonView;
		} //임시
		
		if(cdto.getDepth()==1){
			cdto.setGrpno(Integer.parseInt(coNo));
		}else if(cdto.getDepth()==0){ //return을 안 하기 위해
		}else{
			model.addAttribute("result", 0);
			return jsonView;
		}
		
		int result = free_Service.writeComment(cdto);
		
		model.addAttribute("currentpage", currentpage);
		model.addAttribute("no", cdto.getNo());
		model.addAttribute("result", result);
		return jsonView;
	}
	
	//코멘트 삭제
	@RequestMapping("removeComment.do")
	public View removeComment(CommentDTO dto, String currentpage , Model model, HttpServletRequest request){
		
		free_Service.removeComment(dto.getCo_no(), dto.getDepth());
		
		model.addAttribute("currentpage", currentpage);
		model.addAttribute("no", dto.getNo());
		return jsonView;
	}
	
	//코멘트 수정
	@RequestMapping("modifyComment.do")
	public View modifyComment(CommentDTO dto, String currentpage , Model model, HttpServletRequest request){
		int result = free_Service.modifyComment(dto);
		
		model.addAttribute("currentpage", currentpage);
		model.addAttribute("no", dto.getNo());
		model.addAttribute("result", result);
		return jsonView;
	}
	
	//파일 다운로드
	@RequestMapping("/boardFileDown.do")
    public void download(String name, String id, String pathf, HttpServletResponse response, HttpServletRequest request) throws Exception {
       
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("id");
		
		if(logId == null || logId.equals("")){
			return;
		}
		
	   //파일 업로드 
       @SuppressWarnings("deprecation")
	String path = request.getRealPath("/upload/"+id);
       File f = new File(path + "/"+pathf);
       String fname = new String(name.getBytes("utf-8"), "8859_1");

       response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");
       FileInputStream fin = new FileInputStream(f);
       // 출력 도구 얻기 :response.getOutputStream()
       ServletOutputStream sout = response.getOutputStream();
       byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
       int size = 0;
       while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
       // 담고
       { // 마지막 남아있는 byte 담고 그다음 없으면 탈출
          sout.write(buf, 0, size); // 1kbyte씩 출력
       }
       fin.close();
       sout.close();
    }
}
