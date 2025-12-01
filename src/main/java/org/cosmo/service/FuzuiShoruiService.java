package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.FileViewDTO;
import org.cosmo.domain.FuzuiShoruiFormDTO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.SearchCriteriaDTO;
import org.cosmo.domain.ShainFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.springframework.web.multipart.MultipartFile;

// 윤종운
public interface FuzuiShoruiService {
	
	// 1. 화면 초기 로딩에 필요한 모든 데이터를 조회합니다.
	FuzuiShoruiFormDTO getInitialData(SearchCriteriaDTO criteria);

	// 2. 입력된 데이터를 검증하고 최종 저장합니다. (트랜잭션 필요)
	void saveFuzuiShoruiData(List<ShinseiDTO> shinseiList, List<ShinseiFuzuiShoruiDTO> shinseiFuzuiShoruiList, List<ShainFuzuiShoruiDTO> shainFuzuiShoruiList);

	// 3. 임시 저장 기능을 처리합니다. (트랜잭션 필요)
	void tempSave(IchijiHozonDTO hozonData);

	// 4. 파일 업로드
	String saveUploadedFile(MultipartFile uploadFile, Integer shainUid, Integer kigyoCd, String fileType);
	
	// 5. 파일 뷰어용 데이터 조회
	FileViewDTO getFileForView(String fileUid);
}