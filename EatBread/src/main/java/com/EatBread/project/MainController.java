package com.EatBread.project;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.EatBread.project.mapper.MainMapper;
import com.EatBread.project.mapper.VO.RankVO;

@Controller
public class MainController {
    
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);
    
    @Autowired
	MainMapper mainMapper;

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
    
    @GetMapping("/rank")
    public String rank(Locale locale, Model model) {
        logger.info("랭킹 접근. locale={}", locale);

        List<RankVO> rankList = mainMapper.selectRank();
        model.addAttribute("rankList", rankList);

        return "rank"; // /WEB-INF/views/rank.jsp로 연결됨
    }

    
    @GetMapping("/setting")
    public String name(Locale locale, Model model) {
        logger.info("화면 설정 진입.", locale);
        return "setting";
    }
}
