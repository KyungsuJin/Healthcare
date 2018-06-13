package com.cafe24.kyungsu93.payment.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.group.service.Group;
import com.cafe24.kyungsu93.payment.service.PointCharging;
import com.cafe24.kyungsu93.payment.service.PointChargingService;
import com.cafe24.kyungsu93.payment.service.Refund;
import com.cafe24.kyungsu93.payment.service.RefundService;


@Controller
public class PaymentController {
	@Autowired
	private PointChargingService pointChargingService;
	@Autowired
	private RefundService refundService;
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	//환불 신청 완료 결과
	@RequestMapping(value="/refundResult", method=RequestMethod.GET)
	public String refundResult() {
		logger.debug("PaymentController - refundResult 포워드 실행");
		return "group/refundResult";
	}
	
	//환불 신청 완료
	@RequestMapping(value="/addRefund", method=RequestMethod.POST)
	public String addRefund(Refund refund) {
		logger.debug("PaymentController - addRefund 리다이렉트 실행");
		refundService.addrefund(refund);
		return "redirect:/refundResult";
	}
	
	//환불 신청 
	@RequestMapping(value="/addRefund", method=RequestMethod.GET)
	public String addRefund() {
		logger.debug("PaymentController - addRefund 포워드 실행");
		return "group/addRefund";
	}
	
	//포인트 결제 신청 완료 결과
	@RequestMapping(value="/pointChargingResult", method=RequestMethod.GET)
	public String pointChargingResult() {
		logger.debug("PaymentController - pointChargingResult 포워드 실행");
		return "group/pointChargingResult";
	}
	
	//포인트 결제 신청 완료
	@RequestMapping(value="/pointCharging", method=RequestMethod.POST)
	public String pointCharging(PointCharging pointCharging) {
		logger.debug("PaymentController - pointCharging 리다이렉트 실행");
		pointChargingService.addPointCharging(pointCharging);
		return "redirect:/pointChargingResult";
	}
	
	//포인트 결제 신청 
	@RequestMapping(value="/addPointCharging", method=RequestMethod.GET)
	public String addpointCharging() {
		logger.debug("PaymentController - addPointCharging 포워드 실행");
		return "group/addPointCharging";
	}
	
	//환불 지급완료 리스트
	@RequestMapping(value="/refundCompleteList", method=RequestMethod.GET)
	public String refundCompleteList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("PaymentController - refundCompleteList 포워드 실행");
		Map<String,Object> map = refundService.refundCompleteList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "group/refundCompleteList";
	}
	
	//환불 승인 리스트
	@RequestMapping(value="/refundApprovalList", method=RequestMethod.GET)
	public String refundApprovalList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("PaymentController - refundApprovalList 포워드 실행");
		Map<String,Object> map = refundService.refundApprovalList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "group/refundApprovalList";
	}
	
	//환불 승인 대기 리스트
	@RequestMapping(value="/refundList", method=RequestMethod.GET)
	public String refundList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("PaymentController - refundList 포워드 실행");
		Map<String,Object> map = refundService.refundList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "group/refundList";
	}
	
	//포인트 결제 승인 리스트
	@RequestMapping(value="/PointChargingApprovalList", method=RequestMethod.GET)
	public String PointChargingApprovalList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("PaymentController - pointChargingApprovalList 포워드 실행");
		Map<String,Object> map = pointChargingService.pointChargingApprovalList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "group/PointChargingApprovalList";
	}
	
	//포인트 결제 승인 대기 리스트
	@RequestMapping(value="/PointChargingList", method=RequestMethod.GET)
	public String PointChargingList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("PaymentController - pointChargingList 포워드 실행");
		Map<String,Object> map = pointChargingService.pointChargingList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "group/PointChargingList";
	}
}
