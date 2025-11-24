package org.cosmo.domain;

/**
 * 0200 �빊�땿�쐣�꽒閻븃첀 �겗�닩�뼪永먩옖
 * - firstScreen    : 轝▲겓烏①ㅊ�븷 1踰덉㎏ �솕硫�
 * - mustChangeRoute: �싧떎永뚩러�뒗 諛섎뱶�떆 蹂��븳�떎怨� �뙋�떒�릺�뒗 寃쎌슦
 */
public class NextStep {
    private final NextScreen firstScreen;

    private final boolean mustChangeRoute;

    public NextStep(NextScreen firstScreen, boolean mustChangeRoute) {
        this.firstScreen = firstScreen;
        this.mustChangeRoute = mustChangeRoute;
    }

    public NextScreen getFirstScreen() {
        return firstScreen;
    }

    public boolean isMustChangeRoute() {
        return mustChangeRoute;
    }
}
