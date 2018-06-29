package com.cafe24.kyungsu93.healthscreen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodpressure.service.BloodPressureDao;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugarDao;
import com.cafe24.kyungsu93.bodymassindex.service.BodyMassIndex;
import com.cafe24.kyungsu93.bodymassindex.service.BodyMassIndexDao;


@Service
public class HealthScreenService {
	private static final Logger logger = LoggerFactory.getLogger(HealthScreenService.class);

	@Autowired HealthScreenDao healthScreenDao;
	@Autowired BodyMassIndexDao bodyMassIndexDao;
	@Autowired BloodSugarDao bloodSugarDao;
	@Autowired BloodPressureDao bloodPressureDao;
	
	//건강검진표 리스트 출을 위한 메서드
	public Map<String,Object> getHealthScreenList(int currentPage, int pagePerRow, HealthScreenRequest heatlhScreenRequest){
		logger.debug("HealthScreenService.getHealthScreenList 호출");
		//자신이 등록한 건강검진표의 총 row수를 가져온다.
		int totalRow = healthScreenDao.healthScreenTotalCount(heatlhScreenRequest);
		//게시판에서 가장 첫번째 페이지를 나타내는값
		int firstPage = 1;
		//게시판에서 가장 마지막 페이지를 나타내는값
		int lastPage = totalRow/pagePerRow;
		//만약 나누어 떨어지지않는다면, 마지막페이지가 하나 더 있으므로 ++ 해준다.
		if(totalRow%pagePerRow != 0) {
			lastPage++;
		}
		//현재 currentPage에서  이전페이지를 나타내는 값
		int beforePage = ((currentPage-1)/10)*10;
		//현재 currentPage에서  다음페이지를 나타내는 값
		int afterPage = ((currentPage-1)/10)*10 +11;
		
		//한페이지당 10개의 row를 출력을 해주고, 그 범위를 정하기 위해 beginRow와 pagePerRow를 담은뒤 호출한다..
		Map pageMap = new HashMap<String, Object>();
		pageMap.put("memberNo", heatlhScreenRequest.getMemberNo());
		pageMap.put("beginRow", (currentPage-1)*10);
		pageMap.put("pagePerRow", pagePerRow);
		List<HealthScreenResponse> list = healthScreenDao.getHealthScreenList(pageMap);
		
		//위에서 구한 값들을 리턴하기 위하여 map을 생성하여 담는다.
		Map map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("beforePage", beforePage);
		map.put("afterPage", afterPage);
		logger.debug("HealthScreenService.getHealthScreenList.map : " + map);
		return map;
	}
	
	//건강검진표 등록을 위한 메서드
	public void addHealthScreen(HealthScreenRequest healthScreenRequest, BodyMassIndex bodyMassIndex, BloodSugar bloodSugar, BloodPressure bloodPressure) {
		System.out.println(healthScreenRequest.toString());
		System.out.println(bodyMassIndex.toString());
		System.out.println(bloodSugar.toString());
		System.out.println(bloodPressure.toString());
		//체질량테이블의 다음 key값을 리턴받아와 setting하고, insert 한 뒤 해당 key값을 healthScreenRequest에 setting한다.
		bodyMassIndex.setBodyMassIndexNo("body_mass_index_" + (bodyMassIndexDao.bodyMassIndexEndNo()+1));
		bodyMassIndexDao.addBodyMassIndex(bodyMassIndex);
		healthScreenRequest.setBodyMassIndexNo(bodyMassIndex.getBodyMassIndexNo());
		
		//혈당테이블의 다음 key값을 리턴받아와 setting하고, insert 한 뒤 해당 key값을 healthScreenRequest에 setting한다.
		bloodSugar.setBloodSugarNo("blood_sugar_" + (bloodSugarDao.selectBloodSugarNo()+1));
		bloodSugar.setFastingState("T");
		bloodSugarDao.addBloodSugar(bloodSugar);
		healthScreenRequest.setBloodSugarNo(bloodSugar.getBloodSugarNo());

		//혈압테이블의 다음 key값을 리턴받아와 setting하고, insert 한 뒤 해당 key값을 healthScreenRequest에 setting한다.
		bloodPressure.setBloodPressureNo("blood_pressure_" + (bloodPressureDao.selectBloodPressureNo()+1));
		bloodPressureDao.addBloodPressure(bloodPressure);
		healthScreenRequest.setBloodPressureNo(bloodPressure.getBloodPressureNo());
		
		//건강검진표테이블의 다음 key값을 리턴받아와 setting하고, insert 한다.
		healthScreenRequest.setHealthScreenNo("health_screen_" + (healthScreenDao.getHealthScreenNo()+1));
		healthScreenDao.addHealthScreen(healthScreenRequest);
	}
	
	//건강검진표 삭제를 위한 메서드
	public void removeHealthScreen(Map<String, Object> map, HealthScreenRequest healthScreenRequest) {
		bloodSugarDao.deleteSugarCount(((BloodSugar)map.get("bloodSugar")).getBloodSugarNo());
		bloodPressureDao.deleteBloodPressure(((BloodPressure)map.get("bloodPressure")).getBloodPressureNo());
		bodyMassIndexDao.deleteBmi(((BodyMassIndex)map.get("bodyMassIndex")).getBodyMassIndexNo());
		healthScreenDao.removeHealthScreen(healthScreenRequest);
	}
	
	//건강검진표 수정을 위해 특정 건강검진표의 내용을 가져오는 메서드
	public Map<String, Object> getHealthScreenOne(HealthScreenRequest healthScreenRequest) {
		Map<String, Object> map = new HashMap<String,Object>();
		HealthScreenResponse healthScreenResponse = healthScreenDao.getHealthScreenOne(healthScreenRequest);
		BloodSugar bloodSugar = bloodSugarDao.selectBloodSugarOne(healthScreenResponse.getBloodSugarNo());
		BloodPressure bloodPressure = bloodPressureDao.selectBloodPressureOne(healthScreenResponse.getBloodPressureNo());
		BodyMassIndex bodyMassIndex = bodyMassIndexDao.selectBodyMassIndexOne(healthScreenResponse.getBodyMassIndexNo());
		map.put("healthScreen", healthScreenResponse);
		map.put("bloodSugar", bloodSugar);
		map.put("bloodPressure", bloodPressure);
		map.put("bodyMassIndex", bodyMassIndex);
		return map;
	}
	
	//건강검진표 수정을 위한 메서드
	public void modifyHealthScreen(HealthScreenRequest healthScreenRequest, BodyMassIndex bodyMassIndex, BloodSugar bloodSugar, BloodPressure bloodPressure) {
		HealthScreenResponse healthScreenResponse = healthScreenDao.getHealthScreenOne(healthScreenRequest);
		bloodSugar.setBloodSugarNo(healthScreenResponse.getBloodSugarNo());
		bloodSugar.setFastingState("T");
		bloodPressure.setBloodPressureNo(healthScreenResponse.getBloodPressureNo());
		bodyMassIndex.setBodyMassIndexNo(healthScreenResponse.getBodyMassIndexNo());
		bloodSugarDao.updateBloodSugar(bloodSugar);
		bloodPressureDao.updateBloodPressure(bloodPressure);
		bodyMassIndexDao.modifyBmi(bodyMassIndex);
		healthScreenDao.modifyHealthScreen(healthScreenRequest);
	}
	
	
}
