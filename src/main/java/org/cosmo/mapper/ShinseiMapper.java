package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;

@Mapper
public interface ShinseiMapper {

	ShinseiJyohouVO getShinseiJyohou(@Param("shinseiNo") Long shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(@Param("shinseiNo") Long shinseiNo);
	
	ShainVO getShainByShinseiNo(@Param("shinseiNo") String shinseiNo);

	ShinseiDetailVO selectShinseiDetail(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo);

	void updateShinseiToIchijihozon(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("updUserId") String updUserId);

	void updateAlertForHikimodoshi(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("loginUserId") String loginUserId);

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

	void insertOshirase(@Param("loginUser") ShainVO loginUser, @Param("shinseiUser") ShainVO shinseiUser, @Param("shinseiNo") String shinseiNo);

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

	void clearHenkoFlags(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo);

	void updateForResubmit(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("shinseiRiyu") String shinseiRiyu, @Param("updUserId") String updUserId);

	void updateShinseiForReapply(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("shinseiRiyu") String shinseiRiyu, @Param("newZipCd") String newZipCd,
			@Param("newAddress1") String newAddress1, @Param("newAddress2") String newAddress2,
			@Param("newAddress3") String newAddress3, @Param("addressIdoKeido") String addressIdoKeido,
			@Param("addressChgKbn") String addressChgKbn, @Param("updUserId") Integer updUserId);

	void updateStartKeiroForReapply(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("jitsuKinmuNissu") Integer jitsuKinmuNissu, @Param("updUserId") Integer updUserId);

}