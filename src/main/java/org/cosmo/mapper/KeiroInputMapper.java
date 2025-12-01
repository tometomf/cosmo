package org.cosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.CodeVO;
import org.cosmo.domain.KeiroInputDenshaDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;

public interface KeiroInputMapper {

	//�옱�솚
    ShainKeiroDTO selectShainKeiroWithCode(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("keiroSeq") Integer keiroSeq);

  //吏��썕
    ShinseiDTO selectAddressWithFallback(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Integer shinseiNo,
            @Param("keiroSeq") Integer keiroSeq);
    //吏��썕
    ShinseiDTO selectKinmuAddressWithFallback(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Integer shinseiNo,
            @Param("keiroSeq") Integer keiroSeq);
    
    //�옱�솚
    ShainLocationVO selectShainLocationByUid(
        @Param("kigyoCd") Long kigyoCd,
        @Param("shainUid") Long shainUid
    );
    
    //�븯�젙
    KeiroInputDenshaDTO selectDenshaKeiroDetail(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Integer shinseiNo,
            @Param("keiroSeq") Integer keiroSeq);
    
    //吏��썕
    ShinseiStartKeiroVO selectCarRouteDetail(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Integer shinseiNo,
            @Param("keiroSeq") Integer keiroSeq);
    
    
    //�븯�젙
    ShinseiStartKeiroVO selectStartKeiro(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Integer shainUid,
            @Param("shinseiNo") Integer shinseiNo,
            @Param("keiroSeq") Integer keiroSeq
    );
    
    int insertProcessLog(ProcessLogDTO log);
    
    CodeVO selectCodeName(
            @Param("codeSybtsu") String codeSybtsu,
            @Param("code") String code );
    
    List<CodeVO> selectCodeListBySybtsu(String codeSybtsu);
}
