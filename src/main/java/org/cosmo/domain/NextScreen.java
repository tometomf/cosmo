package org.cosmo.domain;

public enum NextScreen {
    WORK_INPUT,        // (3) 勤務地入力画面 (근무지 입력)
    ADDRESS_INPUT,     // (4) 住所入力画面 (주소 입력)
    COMMUTE_INFO,      // (5) 通勤経路情報画面 (통근 경로)
    APPLICATION_ERROR  // (19) 申請エラー画面 (신청 에러 - 경고창 혹은 화면 이동)
}