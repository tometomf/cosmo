package org.cosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.KigyoKiteiDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;

// 윤종운
@Mapper
public interface FuzuiShoruiMapper {

	// 1. [조회] 신청 기본 정보 조회 (SHINSEI 테이블)
	List<ShinseiDTO> selectShinseiList(
		@Param("kigyoCd") int kigyoCd,
		@Param("shinseiNo")long shinseiNo
	);

	// 2. [조회] 경로별 부수 서류 정보 조회 (SHINSEI_FUZUI_SHORUI 테이블)
	List<ShinseiFuzuiShoruiDTO> selectShinseiFuzuiShoruiList(
		@Param("kigyoCd") int kigyoCd,
		@Param("shinseiNo") long shinseiNo,
		@Param("keiroSeq") int keiroSeq
	);

	// 3. [조회] 마스터/설정값 조회 (KIGYO_KITEI 테이블)
	List<KigyoKiteiDTO> selectKigyoKiteiList(
		@Param("kigyoCd") int kigyoCd,
		@Param("komokuSybtsu") String komokuSybtsu,
		@Param("code") String code,
		@Param("nengetsu") int nengetsu,
		@Param("shinseiYmd") String shinseiYmd
	);

	// 4. [갱신] 신청 기본 정보 갱신 (SHINSEI 테이블)
	int updateShinsei(List<ShinseiDTO> shinseiList);

	// 5. [저장/갱신] 경로별 부수 서류 정보 저장/갱신 (SHINSEI_FUZUI_SHORUI 테이블)
	// 경로 수만큼 INSERT/UPDATE가 발생할 수 있습니다.
	// PK가 중복되면 UPDATE, 아니면 INSERT 하는 SQL (MERGE INTO) 또는 별도 메서드 사용
	int insertShinseiFuzuiShorui(ShinseiFuzuiShoruiDTO dto);
	int updateShinseiFuzuiShorui(ShinseiFuzuiShoruiDTO dto); 
	int insertShainFuzuiShorui(ShainFuzuiShoruiDTO dto);
	int updateShainFuzuiShorui(ShainFuzuiShoruiDTO dto);

	// 6. [저장] 임시 저장 (ICHIJI_HOZON 테이블)
	int insertIchijiHozon(IchijiHozonDTO dto);

	// 7. [저장] 프로세스 로그 기록 (PROCESS_LOG 테이블)
	int insertProcessLog(ProcessLogDTO dto);

	// 8. [저장] 알림 등록 (OSHIRASE 테이블)
	int insertOshirase(OshiraseDTO dto);

	// 수정중
	String selectCurrentTsukinShudanKbn(Integer shainUid);
}