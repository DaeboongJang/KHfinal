package kh.com.finalProject.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {

	@Autowired
	private ReportDAO dao;

	public ReportService() {
		System.out.println("ReportService 인스턴스 생성");
	}

	// 전체 신고 내용 조회
	public List<ReportDTO> dayReport(int currentPage) throws Exception {
		int recordCntPerPage = 5;
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;
		return dao.dayReport(startRange, endRange);
	}
}
