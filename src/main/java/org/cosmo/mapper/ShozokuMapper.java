// 作成者 : 권예성

package org.cosmo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.cosmo.domain.ShozokuVO;

@Mapper
public interface ShozokuMapper {

    @Select(
        "SELECT " +
        "   KIGYO_CD AS kigyoCd, " +
        "   JIGYOSHO_CD AS jigyoshoCd, " +
        "   SHOZOKU_CD AS shozokuCd, " +
        "   SHOZOKU_NM AS shozokuNm, " +
        "   SHOZOKU_ZIP_CD AS shozokuZipCd, " +
        "   SHOZOKU_ADDRESS AS shozokuAddress " +
        "FROM SHOZOKU " +
        "WHERE KIGYO_CD = #{kigyoCd} " +
        "ORDER BY SHOZOKU_CD"
    )
    List<ShozokuVO> findShozokuList(@Param("kigyoCd") int kigyoCd);

}


