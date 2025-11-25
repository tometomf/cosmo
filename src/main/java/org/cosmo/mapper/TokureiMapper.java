package org.cosmo.mapper;

import org.apache.ibatis.annotations.Param;

public interface TokureiMapper {
	
	int updateTokurei(
	        @Param("kigyoCd") int kigyoCd,
	        @Param("shinseiNo") int shinseiNo,
	        @Param("reason") String reason
	    );

}
