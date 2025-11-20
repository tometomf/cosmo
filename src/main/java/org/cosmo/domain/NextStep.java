package org.cosmo.domain;

public class NextStep {

    // 다음으로 이동할 화면
    private final NextScreen firstScreen;

    // 自ら申請 패턴④일 때 true (통근경로는 반드시 변함)
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
