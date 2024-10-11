package management;

import java.util.List;

public interface ManageService {

	// 회원 등급 수정
	JoinUser updateUserGrade(JoinUser joinUser);

	// 회원 차단
	JoinUser updateUserBlock(JoinUser joinUser);

	// 컬러 카테고리 다들고 오기
	List<Category_color> selectColor();

	// s 카테고리 다들고 오기
	List<Category_s> selectS();

	// 시즌 카테고리 다들고 오기
	List<Category_season> selectSeason();

	// usage 카테고리 다들고 오기
	List<Category_usage> selectUsage();

	// 옷 테이블 삽임
	int insertCloth(Cloth cloth);

	// 옷 수량 삽입
	int insertInventory(Cloth cloth);

	// 카테고리 삽입
	int insertCategorys1(int clothNum, Categorys categorys);

	int insertCategorys2(int clothNum, Categorys categorys);

	int insertCategorys3(int clothNum, Categorys categorys);

	int insertCategorys4(int clothNum, Categorys categorys);

	// 카테고리 삽입하면 pk값 넣기
	int SelectLastPk();

	// 카테고리 만들어 질때 옷 테이블의 카테고리 수정
	int insertUpdateCloth(int clothPk, int categoryPk);

	// 옷 수정
	int updateInfoCloth(Cloth cloth);

	// 옷 갯수 수정
	int updateInfoInventory(Cloth cloth);

	// 옷 논리적 삭제
	int logicalClothDelete(int cloth_num);
}