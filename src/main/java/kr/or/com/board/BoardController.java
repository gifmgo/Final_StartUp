package kr.or.com.board;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.FreeBoard.FreeBoardService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class BoardController {

	@Autowired
	private FreeBoardService free_Service;

	@Autowired
	private View jsonView;

	// 게시판 커뮤니티 메인 페이지
	@RequestMapping("/CommunityIndex.do")
	public String Community(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		List<FreeBoardDTO> free = free_Service.selectBestBoard("자유게시판", 5);
		List<FreeBoardDTO> issue = free_Service.selectBestBoard("오늘의 이슈", 5);
		List<FreeBoardDTO> politics = free_Service.selectBestBoard("정치게시판", 5);
		List<FreeBoardDTO> gif = free_Service.selectBestBoard("이미지 갤러리", 5);
		List<FreeBoardDTO> chat = free_Service.selectBestBoard("토론방", 5);
		List<FreeBoardDTO> entertainment = free_Service.selectBestBoard("연예게시판", 5);
		List<FreeBoardDTO> society = free_Service.selectBestBoard("사회게시판", 5);
		List<FreeBoardDTO> qa = free_Service.selectBestBoard("공지사항/QnA", 5);

		String favorit = "";
		if (id != null) {
			favorit = free_Service.selectFavorit(id);
			JSONArray array = (JSONArray) JSONSerializer.toJSON(favorit);
			model.addAttribute("favorit", array);
		} else {
			favorit = null;
			model.addAttribute("favorit", favorit);
		}
		model.addAttribute("id", id);

		model.addAttribute("free", free);
		model.addAttribute("issue", issue);
		model.addAttribute("politics", politics);
		model.addAttribute("gif", gif);
		model.addAttribute("chat", chat);
		model.addAttribute("entertainment", entertainment);
		model.addAttribute("society", society);
		model.addAttribute("qa", qa);

		return "community.CommunityIndex";
	}
	
	// 고용 노동부
	@RequestMapping("/CommunityNews_1.do")
	public View News1(Model model) {

		List<DashBoard_Goyoung_DTO> dto_list = new ArrayList<DashBoard_Goyoung_DTO>();

		try {

			SAXBuilder builder = new SAXBuilder();

			Document jdomdoc = builder.build(new java.net.URL("http://www.korea.go.kr/rss/040000"));

			Element root = jdomdoc.getRootElement();
			Element peresons_E1 = root.getChild("channel");

			List<Element> list = peresons_E1.getChildren("item");
				
			for (int i = 0; i < list.size(); i++) {
				Element person_E = list.get(i);
				
				Element dd = list.get(i).getChild("dc");
				
				DashBoard_Goyoung_DTO dto = new DashBoard_Goyoung_DTO(person_E.getChild("title").getValue(),
						person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
				dto_list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("예외 발생 !!");
			dto_list = null;
			e.printStackTrace();
		}

		model.addAttribute("goyoung", dto_list);
		return jsonView;

	}

	// 교육부
	@RequestMapping("/education.do")
	public View education(Model model) {

		List<DashBoard_education_DTO> dto_list = new ArrayList<DashBoard_education_DTO>();

		try {

			SAXBuilder builder = new SAXBuilder();

			Document jdomdoc = builder.build(new java.net.URL("http://www.korea.go.kr/rss/030000"));

			Element root = jdomdoc.getRootElement();
			Element peresons_E1 = root.getChild("channel");

			List<Element> list = peresons_E1.getChildren("item");

			for (int i = 0; i < list.size(); i++) {
				Element person_E = list.get(i);
				DashBoard_education_DTO dto = new DashBoard_education_DTO(person_E.getChild("title").getValue(),
						person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
				dto_list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("예외 발생 !!");
			dto_list = null;
			e.printStackTrace();
		} finally {
			model.addAttribute("education", dto_list);
		}
		return jsonView;
	}
}
