package com.fpoly.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.helper.MailerHelper;
import com.fpoly.model.MailInfo;
import com.fpoly.service.MailerService;

import jakarta.mail.MessagingException;

@Controller
public class MailerController {
	@Autowired
	MailerService mailer;

	@GetMapping("/")
	public String index() {
		return "mail/index";
	}

	@ResponseBody
	@GetMapping("/demo")
	public String demo() {
		try {
			mailer.send("contactunmuzik@gmail.com", "Title Demo", "Body Demo");
			return "Send Mail Success";
		} catch (MessagingException e) {
			return "Send Mail Fail: " + e.getMessage();
		}
	}

	@ResponseBody
	@PostMapping("/send")
	public String send(Model model, @RequestParam String txtTo, @RequestParam String txtCC, @RequestParam String txtBCC,
			@RequestParam String txtSubject, @RequestParam String txtContent,
			@RequestParam("file") MultipartFile multipartFile)
			throws IOException {
		MailerHelper helper = new MailerHelper();
		List<File> files = new ArrayList<>();
		String[] emailCC = helper.parseStringEmailToArray(txtCC);
		String[] emailBCC = helper.parseStringEmailToArray(txtBCC);
		MailInfo mail = new MailInfo();
		mail.setTo(txtTo);
		mail.setCc(emailCC);
		mail.setBcc(emailBCC);
		mail.setSubject(txtSubject);
		mail.setBody(txtContent);
		// covert MultipartFile to File
		if (!multipartFile.isEmpty()) {
			File file = helper.convertMultipartFileToFile(multipartFile);
			files.add(file);
			// Set cho MailInfo
			mail.setFiles(files);
		}
		// Gửi mail
		mailer.queue(mail);

		return "<h1>Mail của bạn đã được gửi đi</h1>";
	}
}
