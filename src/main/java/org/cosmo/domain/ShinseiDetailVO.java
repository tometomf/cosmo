package org.cosmo.domain;

public class ShinseiDetailVO {
    private int shinseiNo;
    private String shinseiYmd;
    private String shinseiKbnName;
    private String shinchokuName;
    private String shudanName;
    private String startPlace;
    private String endPlace;
    private int shinseiKin;

    public int getShinseiNo() { return shinseiNo; }
    public void setShinseiNo(int shinseiNo) { this.shinseiNo = shinseiNo; }

    public String getShinseiYmd() { return shinseiYmd; }
    public void setShinseiYmd(String shinseiYmd) { this.shinseiYmd = shinseiYmd; }

    public String getShinseiKbnName() { return shinseiKbnName; }
    public void setShinseiKbnName(String shinseiKbnName) { this.shinseiKbnName = shinseiKbnName; }

    public String getShinchokuName() { return shinchokuName; }
    public void setShinchokuName(String shinchokuName) { this.shinchokuName = shinchokuName; }

    public String getShudanName() { return shudanName; }
    public void setShudanName(String shudanName) { this.shudanName = shudanName; }

    public String getStartPlace() { return startPlace; }
    public void setStartPlace(String startPlace) { this.startPlace = startPlace; }

    public String getEndPlace() { return endPlace; }
    public void setEndPlace(String endPlace) { this.endPlace = endPlace; }

    public int getShinseiKin() { return shinseiKin; }
    public void setShinseiKin(int shinseiKin) { this.shinseiKin = shinseiKin; }
}
