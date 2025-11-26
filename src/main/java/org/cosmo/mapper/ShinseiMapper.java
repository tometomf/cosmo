package org.cosmo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroDetailVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;

@Mapper
public interface ShinseiMapper {

	// 하나
	ShinseiJyohouVO getShinseiJyohou(@Param("shinseiNo") Long shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(@Param("shinseiNo") Long shinseiNo);

	String getShainUidByShinseiNo(@Param("shinseiNo") String shinseiNo);

	ShainVO getShainByUid(@Param("shainUid") String shainUid);

	ShinseiShoruiVO getShinseiShorui(@Param("shinseiNo") Long shinseiNo);

	ShinseiIcHozonVO getIchijiHozon(String hozonUid);

	String getCodeNm(@Param("code") String code);

	String getShudanName(@Param("code") String code);

	String getShinseiName(@Param("code") String code);

	String getFileName(@Param("shinseiNo") Long shinseiNo);

	String getShinchokuKbn(@Param("shinseiNo") String shinseiNo);

	void updateTorikesu(@Param("shinseiNo") String shinseiNo, @Param("tkComment") String tkComment,
			@Param("shainUid") String shainUid);

	void deleteIchijiHozonByHozonUid(String hozonUid);

	void insertOshirase(@Param("loginUser") ShainVO loginUser, @Param("shinseiUser") ShainVO shinseiUser,
			@Param("shinseiNo") String shinseiNo);

	Long getNextLogSeq(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo);

	void insertShinseiLog(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo,
			@Param("logSeq") Long logSeq, @Param("syoriKbn") int syoriKbn, @Param("shinseiKbn") String shinseiKbn,
			@Param("shinseiYmd") String shinseiYmd, @Param("shainUid") String shainUid);

	int countStartKeiro(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo);

	void insertStartKeiroLog(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo,
			@Param("logSeq") Long logSeq, @Param("syoriKbn") int syoriKbn, @Param("shainUid") String shainUid);

	void insertEmptyStartKeiroLog(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo,
			@Param("logSeq") Long logSeq, @Param("syoriKbn") int syoriKbn, @Param("shainUid") String shainUid);

	int countEndKeiro(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo);

	void insertEndKeiroLog(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo,
			@Param("logSeq") Long logSeq, @Param("syoriKbn") int syoriKbn, @Param("shainUid") String shainUid);

	void insertEmptyEndKeiroLog(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo,
			@Param("logSeq") Long logSeq, @Param("syoriKbn") int syoriKbn, @Param("shainUid") String shainUid);

	int countFuzuiShorui(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo);

	void insertFuzuiShoruiLog(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo,
			@Param("logSeq") Long logSeq, @Param("syoriKbn") int syoriKbn, @Param("shainUid") String shainUid);

	void insertEmptyFuzuiShoruiLog(@Param("kigyoCd") String kigyoCd, @Param("shinseiNo") String shinseiNo,
			@Param("logSeq") Long logSeq, @Param("syoriKbn") int syoriKbn, @Param("shainUid") String shainUid);

	void insertProcessLog(@Param("shinseiNo") String shinseiNo, @Param("userUid") String userUid,
			@Param("type") String type);

	void deleteShinseiByShinseiNo(@Param("shinseiNo") String shinseiNo);

	String getEmailByShainUid(@Param("shainUid") String shainUid);

	// 제교

	void clearHenkoFlags(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo);

	void updateForResubmit(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("shinseiRiyu") String shinseiRiyu, @Param("updUserId") String updUserId);

	void updateShinseiForReapply(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("shinseiRiyu") String shinseiRiyu, @Param("newZipCd") String newZipCd,
			@Param("newAddress1") String newAddress1, @Param("newAddress2") String newAddress2,
			@Param("newAddress3") String newAddress3, @Param("addressIdoKeido") String addressIdoKeido,
			@Param("addressChgKbn") String addressChgKbn, @Param("kinmuAddressIdoKeido") String kinmuAddressIdoKeido,
			@Param("kinmuAddressChgKbn") String kinmuAddressChgKbn, @Param("updUserId") Integer updUserId);

	void updateStartKeiroForReapply(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("jitsuKinmuNissu") Integer jitsuKinmuNissu, @Param("updUserId") Integer updUserId);

	ShinseiDetailVO selectShinseiDetail(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo);

	ShinseiKeiroDetailVO getShinseiKeiroDetail(Map<String, Object> param);

	void updateShinseiToIchijihozon(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("updUserId") String updUserId);

	void updateAlertForHikimodoshi(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("loginUserId") String loginUserId);

	void insertOshiraseHikimodosu(@Param("loginUser") ShainVO loginUser, @Param("shinseiUser") ShainVO shinseiUser,
			@Param("shinseiNo") String shinseiNo);

	List<ShinseiKeiroDetailVO> getShinseiKeiroDetailList(Map<String, Object> param);

	void insertOshiraseReapply(@Param("loginUser") ShainVO loginUser, @Param("shinseiUser") ShainVO shinseiUser,
			@Param("shinseiNo") String shinseiNo);

}