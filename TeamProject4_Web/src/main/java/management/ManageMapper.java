package management;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ManageMapper {
	// 관리자와 차단된 회원 제외한 가입 회원 목록 조회
	@Select("select user_id, user_name, user_gender, user_birth, user_phone, user_address, user_grade from lp.user where user_block != 1 and user_id != 'admin'")
	List<JoinUser> getAllUser();
	
	// 관리자와 차단된 회원 제외한 가입 회원 수 조회
	@Select("select count(*) from lp.user where user_block != 1 and user_id != 'admin'")
	int getJoinUserCount();
	
	// 차단된 회원 목록 조회
	@Select("select user_id, user_name, user_gender, user_birth, user_phone, user_address, user_grade from lp.user where user_block = 1")
	List<JoinUser> getBlockUser();
	
	// 차단된 회원 수 조회
	@Select("select count(*) from lp.user where user_block = 1")
	int getBlockUserCount();
	
	// 탈퇴 회원 목록 조회
	@Select("select user_id, user_pw, user_phone from lp.deleteuser")
	List<JoinUser> getLeaveUser();
	
	// 탈퇴 회원 수 조회
	@Select("select count(*) from lp.deleteuser")
	int getLeaveUserCount();
	
	// 총 매출 조회
	@Select("SELECT sum(a.order_count * c.cloth_price) FROM lp.order as a\r\n"
			+ "join lp.user as b on a.user_ID = b.user_ID\r\n"
			+ "join lp.cloth as c on a.cloth_num = c.cloth_num where a.order_complete = 1")
	int getAllSales();
}