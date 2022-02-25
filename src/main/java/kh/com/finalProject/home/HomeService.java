package kh.com.finalProject.home;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.finalProject.publicdata.DataDTO;
import kh.com.finalProject.publicdata.FestivalDTO;
import kh.com.finalProject.publicdata.LeportsDTO;
import kh.com.finalProject.publicdata.SearchDTO;

@Service
public class HomeService {
	@Autowired
	private HomeDAO dao;
	
	private int recordCntPerPage = 10;
	private int naviCntPerPage = 10;
	
	// 메인페이지 검색
	public List<SearchDTO> mainSearch(String main_search, int currentPage) throws Exception{
		System.out.println("메인페이지 검색(서비스)");
		System.out.println("서비스 : " + main_search);
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;
		List<SearchDTO> list = dao.mainSearch(main_search, startRange, endRange);
		return list;
	}
	
	// 검색 결과 데이터 수
	public int countAll(String main_search) throws Exception{
		return dao.countAll(main_search);
	}
	
	// Top 관광지 리스트
	public List<DataDTO> getDataList() throws Exception{
		return dao.getDataList();
	}
	
	// Top 축제 리스트
	public List<FestivalDTO> getFestivalList() throws Exception{
		return dao.getFestivalList();
	}
	
	// 최신순 관광지 리스트
	public List<DataDTO> getModifiedtimeDataList() throws Exception{
		return dao.getModifiedtimeDataList();
	}
	
	// 최신순 축제 리스트
	public List<FestivalDTO> getModifiedtimeFestivalList() throws Exception{
		return dao.getModifiedtimeFestivalList();
	}
	
	// 캐러셀 레포츠 리스트
	public List<LeportsDTO> getCarouselLeports() throws Exception{
		return dao.getCarouselLeports();
	}
	
	// select 지역별 레포츠
	public List<LeportsDTO> getAreaLeports(String areaType) throws Exception{
		return dao.getAreaLeports(areaType);
	}
	
	// 페이징
	public HashMap<String, Object> getPageNavi(int currentPage, int recordTotalCnt1) throws Exception {
		int recordTotalCnt = recordTotalCnt1;

		int pageTotalCnt = 0;
		if (recordTotalCnt % recordCntPerPage > 0) {
			pageTotalCnt = (recordTotalCnt / recordCntPerPage) + 1;
		} else {
			pageTotalCnt = recordTotalCnt / recordCntPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCnt) {
			currentPage = pageTotalCnt;
		}

		int startNavi = ((currentPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage - 1;

		if (endNavi > pageTotalCnt) {
			endNavi = pageTotalCnt;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if (startNavi == 1)
			needPrev = false;
		if (endNavi == pageTotalCnt)
			needNext = false;

		HashMap<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		map.put("currentPage", currentPage);

		return map;
	}
}
