package com.aud.client.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aud.mapper.CooperationMapper;
import com.aud.mapper.HistoryIntroduceMapper;
import com.aud.mapper.LeaveMessageMapper;
import com.aud.pojo.HistoryIntroduce;
import com.aud.pojo.LeaveMessage;

@Controller
@RequestMapping("/client/aboutUs")
public class AboutUsController  extends BaseController{
	@Autowired
	private LeaveMessageMapper leaveMessageMapper;
	@Autowired
	private HistoryIntroduceMapper historyIntroduceMapper;
	@Autowired
	private CooperationMapper cooperationMapper;

	@RequestMapping(value="/leaveMessages", method=RequestMethod.POST)
	public String leaveMessages(LeaveMessage leaveMessage){
		leaveMessage.setCreatedAt(new Date());
		this.leaveMessageMapper.insertSelective(leaveMessage);
		return "redirect:/client/aboutUs/contactUs?message=success";
	}

	@RequestMapping(value="", method=RequestMethod.GET)
	public String show(ModelMap model, Locale locale){
		List<HistoryIntroduce> all = this.historyIntroduceMapper.all(locale.getLanguage());
		if (all.size() > 0) {
			model.addAttribute("historyIntroduce", all.get(0));
		} else {
			HistoryIntroduce historyIntroduce = new HistoryIntroduce();
			historyIntroduce.setCompanyHistory("");
			historyIntroduce.setCooperationCompany("");
			historyIntroduce.setVideo("");
			historyIntroduce.setHeadImg("");
			historyIntroduce.setServiceContent("");
			historyIntroduce.setServiceHeadImg("");
			historyIntroduceMapper.insertSelective(historyIntroduce);
			model.addAttribute("historyIntroduce", new HistoryIntroduce());
		}
		model.addAttribute("cooperations", this.cooperationMapper.all());
		return "client/aboutUs/show";
	}

	@RequestMapping(value="/service", method=RequestMethod.GET)
	public String showService(ModelMap model, Locale locale){
		List<HistoryIntroduce> all = this.historyIntroduceMapper.all(locale.getLanguage());
		if (all.size() > 0) {
			model.addAttribute("company", all.get(0));
		} else {
			HistoryIntroduce historyIntroduce = new HistoryIntroduce();
			historyIntroduce.setCompanyHistory("");
			historyIntroduce.setCooperationCompany("");
			historyIntroduce.setVideo("");
			historyIntroduce.setHeadImg("");
			historyIntroduce.setServiceContent("");
			historyIntroduce.setServiceHeadImg("");
			historyIntroduceMapper.insertSelective(historyIntroduce);
			model.addAttribute("company", new HistoryIntroduce());
		}
		return "client/aboutUs/service";
	}

	@RequestMapping(value="/contactUs", method=RequestMethod.GET)
	public String showContactUs(){
		return "client/aboutUs/contact-us";
	}
}
