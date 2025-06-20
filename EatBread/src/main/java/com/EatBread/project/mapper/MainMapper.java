package com.EatBread.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.transaction.annotation.Transactional;

import com.EatBread.project.mapper.VO.GameInsertVO;
import com.EatBread.project.mapper.VO.NoticeVO;
import com.EatBread.project.mapper.VO.RankVO;

@MapperScan
public interface MainMapper {
	
	// 게임 점수 등록
	public int insertGameResult(GameInsertVO vo);
	
	// 랭크 조회
	@Transactional(readOnly = true)
	public List<RankVO> selectRank();
	
	// 방명록 등록
	public int insertNotice(NoticeVO vo);
	
	// 방명록 수정
	public int updateNotice(NoticeVO vo);
	
	// 관리자 전용 수정
	public int updateNoticeAdmin(@Param("id") Integer id, @Param("message") String message );
	
	// 방명록 삭제
	public int deleteNotice(@Param("id") String id, @Param("password") String password);
	
	//방명록 조회
	@Transactional(readOnly = true)
	public List<NoticeVO> selectNotice();
	
	// 비밀번호 조히
	int selectById(@Param("id") String id, @Param("password") String password);



}
