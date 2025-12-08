package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/terakoya")
public class TerakoyaController {

	@GetMapping("/upload")
	public String viewUploadPage() {

		return "terakoya/k_24_terakoyaUpload";

	}
	
	@GetMapping("/send")
	public String viewSendPage() {

		return "terakoya/k_26_massageSend";

	}
	
	
	@GetMapping("/history")
	public String viewHistoryPage() {

		return "terakoya/k_27_messageHistory";

	}

}
