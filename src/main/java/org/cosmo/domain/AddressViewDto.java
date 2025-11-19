package org.cosmo.domain;

public class AddressViewDto {

    // 현 우편번호
    private String currZip1;
    private String currZip2;

    // 현 주소 (都道府県, 市区町村～番地, 建物名～号室)
    private String currPref;
    private String currCityStreet;
    private String currBuilding;

    public String getCurrZip1() {
        return currZip1;
    }

    public void setCurrZip1(String currZip1) {
        this.currZip1 = currZip1;
    }

    public String getCurrZip2() {
        return currZip2;
    }

    public void setCurrZip2(String currZip2) {
        this.currZip2 = currZip2;
    }

    public String getCurrPref() {
        return currPref;
    }

    public void setCurrPref(String currPref) {
        this.currPref = currPref;
    }

    public String getCurrCityStreet() {
        return currCityStreet;
    }

    public void setCurrCityStreet(String currCityStreet) {
        this.currCityStreet = currCityStreet;
    }

    public String getCurrBuilding() {
        return currBuilding;
    }

    public void setCurrBuilding(String currBuilding) {
        this.currBuilding = currBuilding;
    }

    // 화면 상단의 "住所" 한 줄짜리 문구용 (편의 메서드)
    public String getCurrFullAddress() {
        StringBuilder sb = new StringBuilder();
        if (currPref != null) {
            sb.append(currPref);
        }
        if (currCityStreet != null) {
            sb.append(currCityStreet);
        }
        if (currBuilding != null) {
            sb.append(currBuilding);
        }
        return sb.toString();
    }
}
