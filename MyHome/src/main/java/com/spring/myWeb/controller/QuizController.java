package com.spring.myWeb.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myWeb.command.QuizVO;
import com.spring.myWeb.quiz.service.IQuizService;
import com.spring.myWeb.quiz.util.QuizPageCreator;
import com.spring.myWeb.quiz.util.QuizPageVO;

@Controller
@RequestMapping("/quiz")
public class QuizController {

	@Autowired
	private IQuizService service;

	// q&a 목록 요청
	@GetMapping("/quizList")
	public void getList(Model model, @RequestParam int pageNum) {
		System.out.println("quiz/quizList: GET");

		QuizPageVO page = new QuizPageVO();
		page.setPageNum(pageNum);
		
		List<QuizVO> list = service.getList(page);
		
		QuizPageCreator qpc = new QuizPageCreator();
		qpc.setPage(page);
		qpc.setPageTotalCount(service.getTotalCount());
		
		model.addAttribute("articles", list);
		model.addAttribute("paging", qpc);
	}

	// 질문 상세보기 화면 요청
	@GetMapping("/quizDetail/{quizNum}")
	public String article(@PathVariable int quizNum, Model model) {
		System.out.println("/quiz/detail: GET");
		model.addAttribute("article", service.getDetail(quizNum));
		
		return "quiz/quizDetail";
	}

	// 질문 등록 화면 요청
	@GetMapping("/quizRegist")
	public void regist() {
		System.out.println("/quiz/quizRegist: GET");

	}

	// 질문 등록 요청
	@PostMapping("/quizRegist")
	public String insert(@RequestParam("file") MultipartFile file, QuizVO article,
							RedirectAttributes ra) {
		System.out.println("/quiz/quizRegist: POST");

		try {
			String writer = "suyeon"; // session.id
			String content = article.getContent();
			String title = article.getTitle();
			String type = article.getType();
			String filePath = "";
			
			System.out.println("파일정보: " + file.toString());
			
			if(!file.isEmpty()) { // 업로드 파일이 있는 경우
				
				// 파일 저장할 위치
				String fileLoca = "_" + writer;
				
				// 저장할 폴더 경로
				String uploadPath = "C:\\home\\quiz" + fileLoca;
				
				File folder = new File(uploadPath);
				if (!folder.exists()) {
					folder.mkdir();
				}
				
				// 서버에 저장할 파일 이름
				String fileRealName = file.getOriginalFilename();
				
				// 파일명을 고유한 랜덤 문자로 작성 (중복 방지)
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				
				// 확장자
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
				
				String fileName = uniqueName + fileExtension;
				
				// 파일 경로 + 이름
				filePath = uploadPath + "\\" + fileName;
				
				File saveFile = new File(filePath);
				file.transferTo(saveFile);
				
			}
			
			QuizVO vo = new QuizVO(0, writer, title, content, type, filePath, 0, null, null);
			service.regist(vo);

		} catch (Exception e) {
			System.out.println("※파일 업로드 중 오류 발생※");
			e.printStackTrace();
		}
		
		ra.addFlashAttribute("msg", "regSuccess");

		return "redirect:/quiz/quizList?pageNum=" + 1;
	}

	// 수정 화면 요청
	@GetMapping("/quizModify")
	public void modify(@ModelAttribute("article") QuizVO vo) {
		System.out.println("/quiz/quizModify: GET");

	}

	// 질문 수정 요청
	@PostMapping("/quizModify")
	public String update(QuizVO vo) {
		System.out.println("/quiz/quizModify: POST");
		service.modify(vo);

		return "redirect:/quiz/detail";
	}

	// 질문 삭제 요청
	@PostMapping("/quizDelete")
	public String delete(@RequestParam("quizNum") int quizNum) {
		System.out.println("/quiz/quizDelete: POST");

		service.delete(quizNum);
		return "redirect:/quiz/quizList";
	}

}
