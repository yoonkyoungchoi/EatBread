package com.EatBread.project;

import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.EatBread.project.mapper.MainMapper;
import com.EatBread.project.mapper.VO.GameInsertVO;

@RestController
public class ApiController {
	
	@Autowired
	MainMapper mainMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @GetMapping("/api/getImageList")
    public List<String> getImageList(HttpServletRequest request) {
    	
    	logger.info("이미지 랜덤 생성 진입");

        String realPath = request.getServletContext().getRealPath("/resources/img");
        File imgDir = new File(realPath);

        if (!imgDir.exists() || !imgDir.isDirectory()) {
            return List.of();  // 폴더 없으면 빈 리스트 반환
        }

        // eat 또는 noeat로 시작하고 .png로 끝나는 파일만 필터링
        String[] imageFiles = imgDir.list((dir, name) ->
                (name.startsWith("eat") || name.startsWith("noeat")) && name.endsWith(".png")
        );

        if (imageFiles == null || imageFiles.length == 0) {
            return List.of();
        }

        // 8장 무작위로 섞어서 선택
        List<String> imageList = Arrays.asList(imageFiles);
        Collections.shuffle(imageList);
        
        logger.info("이미지 랜덤 생성 결과 {}", imageList);
        
		/*
		 * logger.info("이미지 랜덤 생성 결과 {}", imageList.stream() .limit(8)
		 * .collect(Collectors.toList()));
		 */

        return imageList.stream()
                .limit(8)
                .collect(Collectors.toList());
    }
    
    @PostMapping("/api/saveGameResult")
    public String saveGameResult(@RequestBody GameInsertVO vo) {
    	mainMapper.insertGameResult(vo);
        return "success";
    }
    
	/*
	 * @GetMapping("/api/getRank") public List<>
	 */
    
}
