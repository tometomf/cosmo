/*
 * package org.cosmo.service;
 * 
 * import org.cosmo.domain.AddressInputForm; import
 * org.cosmo.domain.AddressViewDto; import
 * org.springframework.stereotype.Service;
 * 
 * @Service public class AddressInputServiceImpl implements AddressInputService
 * {
 * 
 * public AddressViewDto loadCurrentAddress(String kigyoCd, String shainUid) {
 * 
 * // TODO: 나중에 DB에서 현재 주소 조회하도록 수정 AddressViewDto dto = new AddressViewDto();
 * 
 * // 임시 더미 데이터 (지금 JSP에 보이는 값이랑 맞춰 둠) dto.setCurZip("213");
 * dto.setCurZip("0001"); dto.setCurPref("神奈川県");
 * dto.setCurStreet("川崎市高津区上作延1-2-3"); dto.setCurBuilding("レオパレス溝の口103");
 * 
 * return dto; }
 * 
 * public AddressInputForm initForm() { // 화면 첫 진입 시 비어 있는 폼 생성 return new
 * AddressInputForm(); }
 * 
 * public void saveTemporary(AddressInputForm form, String kigyoCd, String
 * shainUid) { // TODO: 이 메서드는 “一時保存” 버튼 눌렀을 때 DB에 저장하는 로직 자리
 * System.out.println("[AddressInputService] 一時保存 (임시저장) 호출됨"); }
 * 
 * public void reflectAddress(AddressInputForm form, String kigyoCd, String
 * shainUid) { // TODO: 이 메서드는 “この住所を反映” / “次へ” 등으로 실제 주소 반영하는 로직 자리
 * System.out.println("[AddressInputService] 住所反映 (실반영) 호출됨"); } }
 */