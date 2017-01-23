package kr.or.com.schedule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

@Controller
public class Schedule {

	@Autowired
	private ScheduleService scheduleService;

	@Scheduled(cron = "0 0 03 * * ?")
	public void scheduleRun() {
		dbUpdate();
	}

	public void dbUpdate(){
		List<PaliamentList_DTO> data = new ArrayList<PaliamentList_DTO>();

		String html = "http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberCurrStateList?numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D";
		org.jsoup.nodes.Document doc = null;
		try {
			doc = Jsoup.connect(html).parser(Parser.xmlParser()).timeout(50000).get();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		Elements elements = doc.select("item");

		int count = 0;
		for (org.jsoup.nodes.Element e : elements) {
			PaliamentList_DTO dto = new PaliamentList_DTO(e.select("deptCd").text(), e.select("num").text(),
					e.select("jpgLink").text(), e.select("empNm").text(), e.select("origNm").text(),
					e.select("reeleGbnNm").text());
			data.add(dto);
			count++;
		}

		try {
			data = JungDang(data);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		int result = scheduleService.update(data);
		if(result < 0){
			scheduleRun();
		}
	}
	
	
	public List<PaliamentList_DTO> JungDang(List<PaliamentList_DTO> data) throws Exception {


		System.out.println("함수 data 싸이즈 : " + data.size());
		for (int i = 0; i < data.size(); i++) {

			String dept_cd = data.get(i).getDeptCd();
			String num = data.get(i).getNum2();

			String html = "http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd="
					+ dept_cd + "&num=" + num
					+ "&numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D";
			org.jsoup.nodes.Document doc = Jsoup.connect(html).parser(Parser.xmlParser()).timeout(50000).get();
			Elements elements = doc.select("item");
			String polyNm = "";
			String shrtNm = "";
			String memTitle = "";  //학력
			String assemEmail = "";
			String assemHomep = "";
			String assemTel = "";
			for (org.jsoup.nodes.Element element : elements) {
				polyNm = element.select("polyNm").text();
				shrtNm = element.select("shrtNm").text();
				memTitle = element.select("memTitle").text();
				assemEmail = element.select("assemEmail").text();
				assemHomep = element.select("assemHomep").text();
				assemTel = element.select("assemTel").text();
			}

			System.out.println("뽑아온 정보 polyNm : " + polyNm + " /  shrtNm : " + shrtNm);
			data.get(i).setPolyNm(polyNm);
			data.get(i).setShrtNm(shrtNm);
			data.get(i).setMemTitle(memTitle);

			data.get(i).setAssemEmail(assemEmail);
			data.get(i).setAssemHomep(assemHomep);
			data.get(i).setAssemTel(assemTel);
		}
		return data;
	}

}
