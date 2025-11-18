package org.cosmo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.KigyoKiteiDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;

@Mapper
public interface FuzuiShoruiMapper {

	// 1. [화면 로딩용] 신청 기본 정보 조회 (SHINSEI 테이블)
	// 매개변수는 신청 번호와 기업 코드를 포함하는 DTO (예: ShinseiKeyDTO)를 사용하거나 Map을 사용할 수 있습니다.
	ShinseiDTO selectShinseiDetail(int kigyoCd, int shinseiNo);

	// 2. [화면 로딩용] 경로별 부수 서류 정보 조회 (SHINSEI_FUZUI_SHORUI 테이블)
	List<ShinseiFuzuiShoruiDTO> selectFuzuiShoruiList(int kigyoCd, int shinseiNo);

	// 3. [화면 로딩용] 마스터/설정값 조회 (KIGYO_KITEI 테이블)
	// 예: 정기 기간 선택 옵션 (1ヶ月, 3ヶ月, 6ヶ月) 등을 가져오기 위해 사용
	List<KigyoKiteiDTO> selectKiteiMasterList(String komokuSybtsu);

	// ----------------------------------------------------------------------
	// 4. [데이터 저장/갱신] 신청 기본 정보 갱신 (SHINSEI 테이블)
	// 이 화면에서 기타 코멘트(ETC_COMMENT_x) 등을 갱신합니다.
	int updateShinsei(ShinseiDTO dto);

	// 5. [데이터 저장/갱신] 경로별 부수 서류 정보 저장/갱신 (SHINSEI_FUZUI_SHORUI 테이블)
	// 경로 수만큼 INSERT/UPDATE가 발생할 수 있습니다.
	// PK가 중복되면 UPDATE, 아니면 INSERT 하는 SQL (MERGE INTO) 또는 별도 메서드 사용
	int insertFuzuiShorui(ShinseiFuzuiShoruiDTO dto);
	int updateFuzuiShorui(ShinseiFuzuiShoruiDTO dto); 

	// 6. [보조 기능] 임시 저장 (ICHIJI_HOZON 테이블)
	// BLOB 데이터를 포함하므로 특별히 다뤄질 수 있습니다.
	int insertIchijiHozon(IchijiHozonDTO dto);

	// 7. [보조 기능] 프로세스 로그 기록 (PROCESS_LOG 테이블)
	int insertProcessLog(ProcessLogDTO dto);

	// 8. [보조 기능] 알림 등록 (OSHIRASE 테이블)
	int insertOshirase(OshiraseDTO dto);
}