package com.cafe24.kyungsu93.doctorfeedback.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.disease.service.Disease;
import com.cafe24.kyungsu93.disease.service.MyDiseaseDetail;

@Repository
public class DoctorFeedbackDao {
	private static final Logger logger = LoggerFactory.getLogger(DoctorFeedbackDao.class);
	@Autowired SqlSessionTemplate sqlSession;
	String NS = "com.cafe24.kyungsu93.doctorfeedback.service.DoctorFeedbackMapper.";
	
	//d
	public int selectForInsertFeedbackApproval(String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackDao_selectForInsertFeedbackApproval");
		return sqlSession.selectOne(NS+"selectForInsertFeedbackApproval", doctorFeedbackRequestNo);
	}
	//의사피드백결과 pk를 구하기위한 select
	public int selectDoctorFeedbackResultNo() {
		logger.debug("DoctorFeedbackDao_selectDoctorFeedbackResultNo");
		return sqlSession.selectOne(NS+"selectDoctorFeedbackResultNo");
	}
	//의사피드백결과를 추가해 준다.
	public int addDoctorFeedbackResult(DoctorFeedbackResult doctorFeedbackResult) {
		logger.debug("DoctorFeedbackDao_addDoctorFeedbackResult");
		return sqlSession.insert(NS+"insertDoctorFeedbackResult", doctorFeedbackResult);
	}
	//의사 회원이 피드백요청을 수락하면 수락여부를 추가해준다.
	public int addDoctorFeedbackApproval(DoctorFeedbackApproval doctorFeedbackApproval) {
		logger.debug("DoctorFeedbackDao_addDoctorFeedbackApproval");
		return sqlSession.insert(NS+"insertDoctorFeedbackApproval", doctorFeedbackApproval);
	}
	//의사가피드백 수락을 하면 회원의 질병정보를 확인할수 있다.
	public List<MyDiseaseDetail> getMemberDiseaseListForFeedback(String memberNo) {
		logger.debug("DoctorFeedbackDao_getMemberDiseaseList");
		return sqlSession.selectList(NS+"selectGetMemberDiseaseListForFeedback", memberNo);
	}
	public DoctorFeedbackRequest getDoctorFeedbackRequestedDetail(String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackDao_getDoctorFeedbackRequestedDetail");
		return sqlSession.selectOne(NS+"selectGetDoctorFeedbackRequestedDetail", doctorFeedbackRequestNo);
	}
	public List<DoctorFeedbackRequest> getDoctorFeedbackRequestedList(String doctorNo) {
		logger.debug("DoctorFeedbackDao_getDoctorFeedbackRequestedList");
		return sqlSession.selectList(NS+"selectGetDoctorFeedbackRequestedList",doctorNo);
	}
	public int removeDoctorFeedbackRequest(String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackDao_removeDoctorFeedbackRequest");
		return sqlSession.delete(NS+"deleteDoctorFeedbackRequest", doctorFeedbackRequestNo);
	}
	public List<Disease> getDiseaseList() {
		logger.debug("DoctorFeedbackDao_getDiseaseList");
		return sqlSession.selectList(NS+"selectGetDiseaseList");
	}
	public List<DoctorFeedbackRequest> getDoctorFeedbackRequestList(String memberNo) {
		logger.debug("DoctorFeedbackDao_getDoctorFeedbackRequestList");
		return sqlSession.selectList(NS+"selectGetDoctorFeedbackRequestList", memberNo);
	}
	//의사피드백요청 PK생성을 위한 select
	public int selectDoctorFeedbackRequestNo() {
		logger.debug("DoctorFeedbackDao_selectDoctorFeedbackRequestNo");
		return sqlSession.selectOne(NS+"selectDoctorFeedbackRequestNo");
	}
	
	public int doctorFeedbackRequest(DoctorFeedbackRequest doctorFeedbackRequest) {
		logger.debug("DoctorFeedbackDao_doctorFeedbackRequest");
		return sqlSession.insert(NS+"insertDoctorFeedbackRequest", doctorFeedbackRequest);
	}
	//피드백요청할때 요청한의사의 목록을보고 의사를 선택할 수있기 때문에 의사목록을 불러온다.
	public List<DoctorMember> getDoctorList() {
		logger.debug("DoctorFeedbackDao_getDoctorList");
		return sqlSession.selectList(NS+"selectGetDoctorList");
	}
}
