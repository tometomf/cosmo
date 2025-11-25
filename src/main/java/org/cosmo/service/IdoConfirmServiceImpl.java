package org.cosmo.service;

import java.util.ArrayList;
import java.util.List;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.KeiroDetailDto;
import org.cosmo.domain.KeiroInfoForm;
import org.cosmo.domain.KeiroRouteDto;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.mapper.IdoConfirmMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class IdoConfirmServiceImpl implements IdoConfirmService {

    private final IdoConfirmMapper idoConfirmMapper;

    @Override
    public NextStep judge(AlertType alertType, boolean kinmu, boolean jusho) {

        if (alertType == AlertType.IDOU_ITEN) {
            if (kinmu && jusho) {
                return new NextStep(NextScreen.WORK_INPUT, false);
            }
            if (kinmu && !jusho) {
                return new NextStep(NextScreen.WORK_INPUT, false);
            }
            if (!kinmu) {
                return new NextStep(NextScreen.APPLICATION_ERROR, false);
            }
        }

        if (alertType == AlertType.SONOHOKA) {
            if (kinmu) {
                return new NextStep(NextScreen.WORK_INPUT, false);
            }
            
            if (!kinmu && jusho) {
                return new NextStep(NextScreen.ADDRESS_INPUT, false);
            }

            if (!kinmu && !jusho) {
                return new NextStep(NextScreen.COMMUTE_INFO, false);
            }
        }

        if (alertType == AlertType.JISHIN) {
            if (kinmu) {
                return new NextStep(NextScreen.APPLICATION_ERROR, false);
            }

            if (!kinmu && jusho) {
                return new NextStep(NextScreen.ADDRESS_INPUT, false);
            }

            if (!kinmu && !jusho) {
                return new NextStep(NextScreen.COMMUTE_INFO, true);
            }
        }
        return new NextStep(NextScreen.APPLICATION_ERROR, false);//에러
    }
    @Override
    public KeiroInfoForm loadKeiroInfo(String shainUid) {
        KeiroInfoForm form = new KeiroInfoForm();
        form.setShainUid(shainUid);

        List<KeiroRouteDto> list = new ArrayList<KeiroRouteDto>();
        
        KeiroRouteDto route1 = new KeiroRouteDto();
        route1.setRouteNo(1);
        route1.setTransportType("自動車");
        route1.setStartPoint("神奈川県川崎市中原区新丸子 1-2-3");
        route1.setEndPoint("東京都中野区本町 3-30-4");
        list.add(route1);

        KeiroRouteDto route2 = new KeiroRouteDto();
        route2.setRouteNo(2);
        route2.setTransportType("電車");
        
        List<KeiroDetailDto> details = new ArrayList<KeiroDetailDto>();
        
        KeiroDetailDto d1 = new KeiroDetailDto(); d1.setStationName("宮崎台駅"); d1.setLineName("東急田園都市線"); details.add(d1);
        KeiroDetailDto d2 = new KeiroDetailDto(); d2.setStationName("渋谷駅"); d2.setLineName("東京メトロ半蔵門線"); details.add(d2);
        KeiroDetailDto d3 = new KeiroDetailDto(); d3.setStationName("大手町"); d3.setLineName("東京メトロ丸の内線"); details.add(d3);
        KeiroDetailDto d4 = new KeiroDetailDto(); d4.setStationName("東京駅"); details.add(d4); // 마지막 역
        
        route2.setDetailList(details);
        list.add(route2);

        form.setRouteList(list);
        return form;
    }

    @Override
    @Transactional
    public void saveKeiroInfo(KeiroInfoForm form) {
    }
}
