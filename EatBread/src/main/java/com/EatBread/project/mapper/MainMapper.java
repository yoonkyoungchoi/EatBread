package com.EatBread.project.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.EatBread.project.mapper.VO.GameInsertVO;
import com.EatBread.project.mapper.VO.RankVO;

@MapperScan
public interface MainMapper {
	
	// 게임 점수 등록
	public int insertGameResult(GameInsertVO vo);
	
	// 랭크 조회
	public List<RankVO> selectRank();

}
