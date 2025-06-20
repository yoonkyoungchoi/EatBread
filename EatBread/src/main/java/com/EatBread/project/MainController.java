package com.EatBread.project;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.EatBread.project.mapper.MainMapper;
import com.EatBread.project.mapper.VO.NoticeVO;
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

        return "rank";
    }
    
    @GetMapping("/notice")
    public String notice(Locale locale, Model model) {
        logger.info("방명록 접근. locale={}", locale);

        List<NoticeVO> noticeList = mainMapper.selectNotice();
        model.addAttribute("noticeList", noticeList);
        
        return "notice"; 
    }
    
    @PostMapping("/notice/insert")
    public String notice(@ModelAttribute NoticeVO vo) {
        logger.info("방명록 접근");

        mainMapper.insertNotice(vo);
        
        return "redirect:/notice"; 
    }
    

    @GetMapping("/notice/pwCheck")
    @ResponseBody
    public int notice(String id, String password) {
        logger.info("비밀번호 비교 ID : {}, PW : {}", id, password);

        int result = password != null && password.equals("!23$") ? 1 : mainMapper.selectById(id, password);
        
        return result; 
    }
    
    @PutMapping("/notice/update")
    @ResponseBody
    public int updateNotice(@RequestBody NoticeVO vo) {
        logger.info("메세지 내용 수정 vo: {}", vo);
        
        int result = vo.getPassword() != null && vo.getPassword().equals("!23$") ? mainMapper.updateNoticeAdmin(vo.getId(), vo.getMessage()) : mainMapper.updateNotice(vo);
        
        return result;
    }
    
    @DeleteMapping("/notice/delete")
    @ResponseBody
    public int deleteNotice(String id, String password) {
        logger.info("메세지 내용 삭제 id: {} / pw : {}", id, password);
        
        return mainMapper.deleteNotice(id, password); // 1 반환 시 성공
    }
    
    
    @GetMapping("/setting")
    public String name(Locale locale, Model model) {
        logger.info("화면 설정 진입.", locale);
        return "setting";
    }
}
