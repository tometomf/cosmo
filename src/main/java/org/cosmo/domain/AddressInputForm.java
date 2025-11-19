package org.cosmo.domain;

public class AddressInputForm {

    // 신규 우편번호
    private String newZip1;
    private String newZip2;

    // 신규 주소
    private String newPref;
    private String newCityStreet;
    private String newBuilding;

    // 전입일(yyyy/MM/dd)
    private String moveInDate;

    public String getNewZip1() {
        return newZip1;
    }

    public void setNewZip1(String newZip1) {
        this.newZip1 = newZip1;
    }

    public String getNewZip2() {
        return newZip2;
    }

    public void setNewZip2(String newZip2) {
        this.newZip2 = newZip2;
    }

    public String getNewPref() {
        return newPref;
    }

    public void setNewPref(String newPref) {
        this.newPref = newPref;
    }

    public String getNewCityStreet() {
        return newCityStreet;
    }

    public void setNewCityStreet(String newCityStreet) {
        this.newCityStreet = newCityStreet;
    }

    public String getNewBuilding() {
        return newBuilding;
    }

    public void setNewBuilding(String newBuilding) {
        this.newBuilding = newBuilding;
    }

    public String getMoveInDate() {
        return moveInDate;
    }

    public void setMoveInDate(String moveInDate) {
        this.moveInDate = moveInDate;
    }
}
