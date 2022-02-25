package kh.com.finalProject.board;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import kh.com.finalProject.files.FileDAO;
import kh.com.finalProject.files.FileDTO;
import kh.com.finalProject.report.ReportDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;

	@Autowired
	private FileDAO fdao;

	@Autowired
	private HttpSession session;

	public BoardService() {
	}

	private int recordCntPerPage = 10;
	private int naviCntPerPage = 10;

	// 전체 게시판 조회
	public List<BoardDTO> selectAll(int currentPage) throws Exception {
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;

		// 전체 게시판 조회
		List<BoardDTO> list = dao.selectAll(startRange, endRange);

		return list;
	}

	// 전체 게시판 게시글 갯수
	public int selectAllBoardCount() throws Exception {
		return dao.selectAllBoardCount();
	}

	// 게시판 조건별로 가져오기
	public List<BoardDTO> selectAllOption(String selectOption, int currentPage) throws Exception {
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;
		List<BoardDTO> list = dao.selectAllOption(selectOption, startRange, endRange);
		return list;
	}

	// 게시글 상세조회
	public BoardDTO selectOne(int board_seq) throws Exception {
		// 조회수 +1
		dao.updateView_count(board_seq);
		return dao.selectOne(board_seq);
	}

	// 게시판 페이징
	public HashMap<String, Object> getPageNavi(int recordTotalCnt, int currentPage) throws Exception {

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

	// 게시글 조회수+1
	public int updateView_count(int board_seq) throws Exception {
		return dao.updateView_count(board_seq);
	}

	// 게시판 검색
	public List<BoardDTO> searchBoard(String select, String keyword, int currentPage) throws Exception {
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;
		List<BoardDTO> list = dao.searchBoard(select, keyword, startRange, endRange);
		return list;
	}

	// 게시판 검색 후 select, keyword 로 게시글 카운트
	public int countAllOption(String select, String keyword) throws Exception {
		return dao.countAllOption(select, keyword);
	}

	// 게시글 등록
	public int insertBoard(BoardDTO dto, FileDTO fdto) throws Exception {
		int board_seq = dao.selectSeq();

		// 게시글 등록
		dto.setBoard_seq(board_seq); // 게시글에 게시글 번호 셋팅
		int rs = dao.insertBoard(dto);

		// 파일 등록
		ArrayList<JsonObject> fileList = ((ArrayList<JsonObject>) session.getAttribute("fileList"));

		if (fdto.getOri_name() == null && fdto.getSys_name() == null) {
			for (JsonObject obj : fileList) {
				fdto.setBoard_seq(board_seq);
				fdto.setOri_name(obj.get("ori_name").getAsString());
				fdto.setSys_name(obj.get("sys_name").getAsString());
				fdao.insertFile(fdto);
			}
		}

		return 0;

	}

	// 게시글 seq 연동
	public int selectSeq() throws Exception {
		return dao.selectSeq();
	}

	// 게시글 신고
	public int report(ReportDTO dto) throws Exception {
		if (dao.report(dto) == 1) {
			return 1;
		} else {
			return 0;
		}
	}

	// 게시글 삭제
	public int deleteBySeq(int board_seq) throws Exception {
		return dao.deleteBySeq(board_seq);
	}

	// 게시글 수정
	public int modifyBySeq(int board_seq, BoardDTO dto, FileDTO fdto, String[] sys_name) throws Exception {
		// 파일 등록
		String realPath = session.getServletContext().getRealPath("/upload");

		// 게시글 수정
		dao.modifyBySeq(dto);

		// 추가 파일 등록
		ArrayList<JsonObject> fileList = ((ArrayList<JsonObject>) session.getAttribute("fileList"));
		if (fileList != null) {
			for (JsonObject obj : fileList) {
				fdto.setBoard_seq(board_seq);
				fdto.setOri_name(obj.get("ori_name").getAsString());
				fdto.setSys_name(obj.get("sys_name").getAsString());
				fdao.insertFile(fdto);
			}
		} else {
			// 파일 삭제
			dto.setBoard_seq(board_seq);
			List<String> notMatch = fdao.notMatchSys_name(board_seq, sys_name);

			// DB에서 삭제
			fdao.deleteFromSys_name(notMatch);
			for (int i = 0; i < notMatch.size(); i++) {
				File file = new File(realPath, notMatch.get(i));
				file.delete();
			}

		}
		return 0;
	}

	// 비밀글 비밀번호 찾기
	public boolean secretBoard(String secretPw, int board_seq) throws Exception {
		if (dao.secretBoard(secretPw, board_seq) == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 조건으로 리스트 가져오기
	public List<BoardDTO> selectCondition(String category, int currentPage) throws Exception {
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;
		List<BoardDTO> list = dao.selectCondition(category, startRange, endRange);
		return list;
	}

	// 조건 게시글 갯수
	public int countCondition(String category) throws Exception {
		return dao.countCondition(category);
	}

	// 당일 신규 게시글 조회
	public List<BoardDTO> dayBoard(int currentPage) throws Exception {
		int recordCntPerPage = 5;
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;
		System.out.println("startRange : " + startRange);
		System.out.println("endRange : " + endRange);
		return dao.dayBoard(startRange, endRange);
	}

	// 마이페이지 게시글
	public List<BoardDTO> myBoardList(String writer_id, int currentPage) throws Exception {
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;

		// 전체 게시판 조회
		List<BoardDTO> list = dao.myBoardList(writer_id, startRange, endRange);

		return list;
	}

	// 마이페이지 게시글 갯수
	public int countMyBoardList(String writer_id) throws Exception {
		return dao.countMyBoardList(writer_id);
	}
}