package kh.com.finalProject.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {

	@Autowired
	private FollowDAO dao;

	public FollowService() {
		System.out.println("FollowService 인스턴스 생성");
	}

	// 팔로우 체크
	public FollowDTO findFollow(String follow_id, String follower_id) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("follow_id", follow_id);
		map.put("follower_id", follower_id);
		return dao.findFollow(map);
	}

	// 팔로우
	public int insertFollow(FollowDTO dto) throws Exception {
		// 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		int rs = 0;
		// 좋아요가 이미 있는지 확인하는 코드
		FollowDTO checkFollow = dao.checkFollow(dto);

		// find가 null이면 좋아요가 없는 상태이므로 정보 저장
		// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
		if (checkFollow == null) {
			// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
			rs = dao.insertFollow(dto);
		} else {
			dao.deleteFollow(dto);
		}
		// 0 or 1이 담겨져서 @Controller에 보냄.
		return rs;
	}

	// 로그인된 id 팔로워 조회
	public List<FollowDTO> follower(String follower_id) throws Exception {
		return dao.follower(follower_id);
	}

	// 로그인된 id 팔로잉 조회
	public List<FollowDTO> follow(String follow_id) throws Exception {
		return dao.follow(follow_id);
	}

	public int plusFollow(FollowDTO dto) throws Exception {
		int rs = dao.insertFollow(dto);
		return rs;
	}

	public int deleteFollow(FollowDTO dto) throws Exception {
		int rs = dao.deleteFollow(dto);
		return rs;
	}

}
