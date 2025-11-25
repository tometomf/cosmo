// 作成者 : 권예성

package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.ShozokuVO;
import org.cosmo.mapper.ShozokuMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShozokuService {

    private final ShozokuMapper shozokuMapper;

    public List<ShozokuVO> findShozokuList(int kigyoCd) {
        return shozokuMapper.findShozokuList(kigyoCd);
}
}
