package com.cafe24.kyungsu93.exercise.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExerciseDao {
	
	@Autowired SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseDao.class);
	final String NS = "com.cafe24.kyungsu93.ExerciseMapper.";
	//memberNo -> memberId
	public String changeMemberNo(String memberId) {
		logger.debug("ExerciseDao.changeMemberNo");
		return sqlSession.selectOne(NS + "changeMemberNo", memberId);
	}
	//보증금 등록 체크
	public int exerciseDepositChk(String memberNo) {
		logger.debug("ExerciseDao.exerciseDepositChk");
		return sqlSession.selectOne(NS+"exerciseDepositChk",memberNo);
	}
	//포인트 천원 이상인지 체크
	public int memberPointChk(String memberNo) {
		logger.debug("ExerciseDao.memberPointChk");
		return sqlSession.selectOne(NS+"memberPointChk",memberNo);
	}
	//보증금 등록 번호
	public int depositRegistrationNo() {
		logger.debug("ExerciseDao.depositRegistrationNo");
		return sqlSession.selectOne(NS+"registrationNo");
	}
	//보증금 등록
	public int depositRegistration(Exercise exercise) {
		logger.debug("ExerciseDao.depositRegistration");
		return sqlSession.insert(NS+"depositRegistration",exercise);
	}
	//보증금 등록으로 인한 포인트 차감
	public void pointDeduction(String memberNo) {
		logger.debug("ExerciseDao.pointDeduction");
		sqlSession.update(NS+"pointDeduction",memberNo);
	}
	//운동매칭 게시글 등록 번호
	public int exerciseMatchingNo() {
		logger.debug("ExerciseDao.exerciseMatchingNo");
		return sqlSession.selectOne(NS + "exerciseMatchingNo");
	}
	//운동매칭 등록
	public void addExerciseMatching(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.addExerciseMatching");
		sqlSession.insert(NS + "addExerciseMatching",exerciseRegistration);
	}
	//운동매칭 리스트
	public List<ExerciseRegistration> exerciseMatchingList(Map<String,Integer> map) {
		logger.debug("ExerciseDao.exerciseMatchingList");
		return sqlSession.selectList(NS+"exerciseMatchingList",map);
	}
	//운동매칭 검색 리스트
	public List<ExerciseRegistration> exerciseMatchingSearchList(Map<String,Object> map) {
		logger.debug("ExerciseDao.exerciseMatchingSearchList");
		return sqlSession.selectList(NS + "exerciseMatchingSearchList", map);
	}
	//운동매칭 검색 리스트 count
	public int totalCountSearchList(Map<String, Object> map) {
		logger.debug("ExerciseDao.totalCountSearchList");
		return sqlSession.selectOne(NS + "totalCountSearchList", map);
	}
	// 운동매칭 기간별 검색 
	public List<ExerciseRegistration> exerciseMatchingSearchDateList(Map<String, Object> map) {
		logger.debug("ExerciseDao.exerciseMatchingSearchDateList");
		return sqlSession.selectList(NS + "exerciseMatchingSearchDateList", map);
	}
	// 운동매칭 기간별 검색 카운트
	public int totalCountSearchDateList(Map<String, Object> map) {
		logger.debug("ExerciseDao.totalCountSearchDateList");
		return sqlSession.selectOne(NS + "totalCountSearchDateList", map);
	}
	//운동매칭 리스트
	public int totalCountList() {
		logger.debug("ExerciseDao.totalCountList");
		return sqlSession.selectOne(NS + "totalCountList");
	}
	//운동매칭 내용 
	public ExerciseRegistration exerciseMatchingContent(String exerciseMatchingNo) {
		logger.debug("ExerciseDao.exerciseMatchingContent");
		return sqlSession.selectOne(NS + "exerciseMatchingContent",exerciseMatchingNo);
	}
	//운동매칭 글 삭제
	public void deleteExerciseMatching(String exerciseMatchingNo) {
		logger.debug("ExerciseDao.deleteExerciseMatching");
		sqlSession.delete(NS + "deleteExerciseMatching", exerciseMatchingNo);
	}
	//운동매칭 글 수정
	public void modifyExerciseMatching(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.modifyExerciseMatching");
		sqlSession.delete(NS + "modifyExerciseMatching", exerciseRegistration);
	}
	//운동매칭 참가신청  pk
	public int exerciseMatchingJoinMemberNo() {
		logger.debug("ExerciseDao.modifyExerciseMatching");
		return sqlSession.selectOne(NS + "exerciseMatchingJoinMemberNo");
	}
	//운동매칭 글등록시 글등록자는 자동으로 참가신청 or 참가신청
	public int addExerciseMatchingJoinMember(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.addExerciseMatchingJoinMember");
		return sqlSession.insert(NS + "addExerciseMatchingJoinMember", exerciseRegistration);
	}
	//운동매칭 글 삭제시 글등록자 매칭 참가 신청 삭제
	public void deleteExerciseMatchingJoinMember(String exerciseMatchingNo) {
		logger.debug("ExerciseDao.deleteExerciseMatchingJoinMember");
		sqlSession.delete(NS + "deleteExerciseMatchingJoinMember", exerciseMatchingNo);
	}
	//운동매칭 중복 참가 체크
	public int exerciseSignUpChk(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.exerciseSignUpChk");
		return sqlSession.selectOne(NS + "exerciseSignUpChk", exerciseRegistration);
	}
	//운동매칭 참가신청 취소
	public void exerciseCancel(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.exerciseCancel");
		sqlSession.selectOne(NS + "exerciseCancel", exerciseRegistration);
	}
	//운동매칭 참가 리스트
	public List<ExerciseRegistration> attendExerciseMatching(String memberNo) {
		logger.debug("ExerciseDao.attendExerciseMatching");
		return sqlSession.selectList(NS + "attendExerciseMatching", memberNo);
	}
	//운동매칭 현재 참가 인원수
	public int exerciseMatchingAttendCount(String exerciseMatchingNo) {
		logger.debug("ExerciseDao.exerciseMatchingAttendCount");
		return sqlSession.selectOne(NS + "exerciseMatchingAttendCount", exerciseMatchingNo);
	}
	//운동매칭 완료
	public int exerciseComplete(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.exerciseComplete");
		 return sqlSession.insert(NS + "exerciseComplete", exerciseRegistration);
	}
	//운동매칭 결과 조회
	public int exerciseMatchingResult(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.exerciseMatchingResult");
		return sqlSession.selectOne(NS + "exerciseMatchingResult", exerciseRegistration);
	}

}
