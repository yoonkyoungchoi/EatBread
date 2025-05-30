package com.EatBread.project;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @GetMapping("/")
    public String main(Locale locale, Model model) {
        logger.info("메인화면 접근.", locale);
        return "home";
    }
    
    @GetMapping("/game")
    public String game(Locale locale, Model model) {
        logger.info("게임화면 접근.", locale);
        return "game";
    }
    
    @GetMapping("/rule")
    public String rule(Locale locale, Model model) {
        logger.info("게임방법 접근.", locale);
        return "rule";
    }
    
    @GetMapping("/name")
    public String name(Locale locale, Model model) {
        logger.info("닉네임 입력 접근.", locale);
        return "name";
    }
    
    @GetMapping("/easyGame")
    public String easyGame(Locale locale, Model model) {
        logger.info("쉬운 모드 게임 접근.", locale);
        return "easyGame";
    }
    
    @GetMapping("/hardGame")
    public String hardGame(Locale locale, Model model) {
        logger.info("어려운 모드 게임 접근.", locale);
        return "hardGame";
    }
    
    @GetMapping("/gameMode")
    public String gameMode(Locale locale, Model model) {
        logger.info("게임 모드 선택 접근.", locale);
        return "gameMode";
    }
}
