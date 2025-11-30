package org.cosmo.domain;

    //조우진

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
