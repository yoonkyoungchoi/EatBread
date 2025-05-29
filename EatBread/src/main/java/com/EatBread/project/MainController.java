package com.EatBread.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("메인화면 접근.", locale);
		
		// model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/game", method = RequestMethod.GET)
	public String game(Locale locale, Model model) {
		logger.info("게임화면 접근.", locale);
		
		return "game";
	}
	
	@RequestMapping(value = "/rule", method = RequestMethod.GET)
	public String rule(Locale locale, Model model) {
		logger.info("게임방법 접근.", locale);
		
		return "rule";
	}
	
	@RequestMapping(value = "/name", method = RequestMethod.GET)
	public String name(Locale locale, Model model) {
		logger.info("닉네임 입력 접근.", locale);
		
		return "name";
	}
	
	@RequestMapping(value = "/nameAdd", method = RequestMethod.POST)
	public String nameAdd(Locale locale, Model model) {
		logger.info("닉네임 입력 접근.", locale);
		
		return "game";
	}
	
	@RequestMapping(value = "/easyGame", method = RequestMethod.GET)
	public String easyGame(Locale locale, Model model) {
		logger.info("쉬운 모드 게임 접근.", locale);
		
		return "easyGame";
	}
	
	@RequestMapping(value = "/hardGame", method = RequestMethod.GET)
	public String hardGame(Locale locale, Model model) {
		logger.info("어려운 모드 게임 접근.", locale);
		
		return "hardGame";
	}
	
	@RequestMapping(value = "/gameMode", method = RequestMethod.GET)
	public String gameMode(Locale locale, Model model) {
		logger.info("게임 모드 선택 접근.", locale);
		
		return "gameMode";
	}
	
	@RequestMapping(value = "/submitScore", method = RequestMethod.POST)
	public String submitScore(Locale locale, Model model) {
		logger.info("게임 모드 선택 접근.", locale);
		
		return "gameMode";
	}
}
