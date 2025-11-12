package org.cosmo.mapper;

import java.util.Map;

import org.cosmo.domain.ShinseiDetailVO;

public interface ShinseiMapper {
    ShinseiDetailVO selectShinseiDetail(Map<String, Object> param);
}
