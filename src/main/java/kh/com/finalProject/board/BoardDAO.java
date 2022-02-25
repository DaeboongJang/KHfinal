package kh.com.finalProject.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.finalProject.report.ReportDTO;

@Repository
public class BoardDAO {

	public BoardDAO() {
		System.out.println("BoardDAO 인스턴스 생성");
	}

	@Autowired
	private SqlSession session;

	// 전체 게시판 조회
	public List<BoardDTO> selectAll(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("boardMapper.selectAll", map);
	}

	// 전체 게시판 게시글 갯수
	public int selectAllBoardCount() throws Exception {
		return session.selectOne("boardMapper.selectAllBoardCount");
	}

	// 게시판 리스트 조건별로 가져오기
	public List<BoardDTO> selectAllOption(String selectOption, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("selectOption", selectOption);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("boardMapper.selectAllOption", map);
	}

	// 게시글 조회수 +1
	public int updateView_count(int board_seq) throws Exception {
		return session.update("boardMapper.updateView_count", board_seq);
	}

	// 검색글 전체 데이터 수 검색별로 가져오기
	public int countAllOption(String select, String keyword) throws Exception {
		HashMap<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		return session.selectOne("boardMapper.countAllOption", map);
	}

	// 게시판 검색
	public List<BoardDTO> searchBoard(String select, String keywrod, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keywrod);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("boardMapper.searchBoard", map);
	}

	// 게시글 신고
	public int report(ReportDTO dto) throws Exception {
		return session.insert("boardMapper.report", dto);
	}

	// 게시글 상세조회
	public BoardDTO selectOne(int board_seq) throws Exception {
		return session.selectOne("boardMapper.selectOne", board_seq);
	}

	// 게시글 수 조회
	public int countAll() throws Exception {
		return session.selectOne("boardMapper.countAll");
	}

	// 게시글 등록
	public int insertBoard(BoardDTO dto) throws Exception {
		return session.insert("boardMapper.insertBoard", dto);
	}

	// 게시글 seq 연동
	public int selectSeq() throws Exception {
		return session.selectOne("boardMapper.selectSeq");
	}

	// 게시글 삭제
	public int deleteBySeq(int board_seq) throws Exception {
		return session.delete("boardMapper.deleteBySeq", board_seq);
	}

	// 게시글 수정
	public int modifyBySeq(BoardDTO dto) throws Exception {
		return session.update("boardMapper.modifyBySeq", dto);
	}

	// 게시글 content 가져오기
	public String selectContent(int board_seq) throws Exception {
		return session.selectOne("boardMapper.selectContent", board_seq);
	}

	// 비밀글 비밀번호 찾기
	public int secretBoard(String secretPw, int board_seq) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("secretPw", secretPw);
		map.put("board_seq", board_seq);
		return session.selectOne("boardMapper.secretBoard", map);
	}

	// 조건으로 리스트 불러오기
	public List<BoardDTO> selectCondition(String category, int startRange, int endRange) throws Exception {
		Map<String, Object> map = getCategory(category, startRange, endRange);
		return session.selectList("boardMapper.selectCondition", map);
	}

	// 조건 게시글 갯수
	public int countCondition(String category) throws Exception {
		return session.selectOne("boardMapper.countCondition", category);
	}

	// 중복 코드 메서드화
	public Map<String, Object> getCategory(String category, int startRange, int endRange) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return map;
	}

	// 당일 게시글 조회
	public List<BoardDTO> dayBoard(int startRange, int endRange) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("boardMapper.dayBoard", map);
	}

	// 당일 게시글 수
	public int dayBoardCount() throws Exception {
		return session.selectOne("boardMapper.dayBoardCount");
	}

	// 마이페이지 게시판 조회
	public List<BoardDTO> myBoardList(String writer_id, int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("writer_id", writer_id);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("boardMapper.myBoardList", map);
	}

	// 마이페이지 게시글 갯수
	public int countMyBoardList(String writer_id) throws Exception {
		return session.selectOne("boardMapper.countMyBoardList", writer_id);
	}

}