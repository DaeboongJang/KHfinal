package kh.com.finalProject.publicdata;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataDAO {
	@Autowired
	private SqlSession session;

	private DataDTO dto = new DataDTO();
	private FestivalDTO festivalDto = new FestivalDTO();
	private LeportsDTO leportsDto = new LeportsDTO();

	// 전국 관광지 가져오기
	public List<DataDTO> selectAll(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.selectAll", map);
	}

	// 전국 관광지 데이터 수 가져오기
	public int countAll() throws Exception {
		return session.selectOne("dataMapper.countAll");
	}

	// 관광지 상세보기
	public DataDTO selectOne(String contentid) throws Exception {
		return session.selectOne("dataMapper.selectOne", contentid);
	}

	// 관광지 리스트(지역별로)
	public List<DataDTO> selectAllArea(String addr1, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("addr1", addr1);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.selectAllArea", map);
	}

	// 관광지 리스트(지역별로) 데이터 수 가져오기
	public int countAllArea(String addr1) throws Exception {
		return session.selectOne("dataMapper.countAllArea", addr1);
	}

	// 관광지 리스트 인기순
	public List<DataDTO> readcountList(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.readcountList", map);
	}

	// 관광지 리스트(지역별로) 인기순
	public List<DataDTO> readcountAreaList(String addr1, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("addr1", addr1);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.readcountAreaList", map);
	}

	// 축제 데이터 수 가져오기
	public int countAllFestival() throws Exception {
		return session.selectOne("dataMapper.countAllFestival");
	}

	// 축제 리스트 가져오기
	public List<FestivalDTO> selectAllFestival(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		List<FestivalDTO> list = session.selectList("dataMapper.selectAllFestival", map);
		System.out.println("dao에서출력");
		for (FestivalDTO dto : list) {
			System.out.println(dto);
		}
		return list;
	}

	// 축제 상세보기
	public FestivalDTO selectOneFestival(String contentid) throws Exception {
		return session.selectOne("dataMapper.selectOneFestival", contentid);
	}

	// 축제 리스트(지역별로)
	public List<FestivalDTO> selectAllFestivalArea(String addr1, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("addr1", addr1);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.selectAllFestivalArea", map);
	}

	// 축제 리스트 (지역별로) 데이터 수 가져오기
	public int countAllFestivalArea(String addr1) throws Exception {
		return session.selectOne("dataMapper.countAllFestivalArea", addr1);
	}

	// 축제 리스트 인기순
	public List<FestivalDTO> readcountFestivalList(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.readcountFestivalList", map);
	}

	// 축제 리스트(지역별로) 인기순
	public List<FestivalDTO> readcountAreaFestivalList(String addr1, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("addr1", addr1);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.readcountAreaFestivalList", map);
	}

	// 레포츠 리스트 가져오기
	public List<LeportsDTO> selectAllLeports(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.selectAllLeports", map);
	}

	// 레포츠 데이터 수 가져오기
	public int countAllLeports() throws Exception {
		return session.selectOne("dataMapper.countAllLeports");
	}

	// 레포츠 상세보기
	public LeportsDTO selectOneLeports(String contentid) throws Exception {
		return session.selectOne("dataMapper.selectOneLeports", contentid);
	}

	// 레포츠 리스트 가져오기(지역별로)
	public List<LeportsDTO> selectAllLeportsArea(String addr1, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("addr1", addr1);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.selectAllLeportsArea", map);
	}

	// 레포츠 데이터 수 가져오기(지역별로)
	public int countAllLeportsArea(String addr1) throws Exception {
		return session.selectOne("dataMapper.countAllLeportsArea", addr1);
	}

	// 레포츠 리스트 인기순
	public List<LeportsDTO> readcountLeportsList(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.readcountLeportsList", map);
	}

	// 레포츠 리스트(지역별로) 인기순
	public List<LeportsDTO> readcountAreaLeportsList(String addr1, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("addr1", addr1);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("dataMapper.readcountAreaLeportsList", map);
	}

	// 관광지 공공데이터 저장
	public void saveData(List<DataDTO> dataList) throws Exception {
		System.out.println("DAO : 관광지데이터");
		for (DataDTO dataDto : dataList) {
			System.out.println(dataDto);
			session.update("dataMapper.saveData", dataDto);
		}
	}

	// 축제 공공데이터 저장
	public void festival(List<FestivalDTO> dataList) throws Exception {
		System.out.println("DAO : 축제데이터");
		for (FestivalDTO dataDto : dataList) {
			System.out.println(dataDto);
			session.update("dataMapper.festival", dataDto);
		}
	}

	// 레포츠 공공데이터 저장
	public void leports(List<LeportsDTO> dataList) throws Exception {
		System.out.println("DAO : 레포츠데이터");
		for (LeportsDTO dto : dataList) {
			System.out.println(dto);
			session.update("dataMapper.leports", dto);
		}
	}

	// 관광지 공공데이터 삭제
	public void deleteTourist() throws Exception {
		session.delete("dataMapper.deleteTourist");
	}

	// 축제 공공데이터 삭제
	public void deleteFestival() throws Exception {
		session.delete("dataMapper.deleteFestival");
	}

	// 레포츠 공공데이터 삭제
	public void deleteLeports() throws Exception {
		session.delete("dataMapper.deleteLeports");
	}

}
