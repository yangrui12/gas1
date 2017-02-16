package com.aud.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.aud.mapper.CooperationMapper;
import com.aud.mapper.HistoryIntroduceMapper;
import com.aud.pojo.Cooperation;
import com.aud.pojo.HistoryIntroduce;
import com.aud.tool.Utils;

@Controller("adminAboutUs")
@RequestMapping("/admin/aboutUs")
public class AboutUsController {
	@Autowired
	private HistoryIntroduceMapper historyIntroduceMapper;
	@Autowired
	private CooperationMapper cooperationMapper;

	@RequestMapping(value = "/historyIntroduce", method = RequestMethod.GET)
	public String edit(ModelMap model, Locale locale) {
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
		return "admin/historyIntroduce/edit";
	}

	@RequestMapping(value = "/historyIntroduce/update", method = RequestMethod.POST)
	public String update(HistoryIntroduce historyIntroduce, MultipartFile file, MultipartFile serviceFile, HttpServletRequest request, Locale locale) throws IllegalStateException, IOException {
		if(!file.isEmpty()){
			historyIntroduce.setHeadImg(Utils.saveFile(file, request));	
		}
		if(!serviceFile.isEmpty()){
			historyIntroduce.setServiceHeadImg(Utils.saveFile(serviceFile, request));
		}
		List<HistoryIntroduce> all = this.historyIntroduceMapper.all(locale.getLanguage());
		historyIntroduce.setId(all.get(0).getId());
		historyIntroduce.setLang(locale.getLanguage());
		this.historyIntroduceMapper.updateByPrimaryKeySelective(historyIntroduce);
		return "redirect:/admin/aboutUs/historyIntroduce";
	}

	@RequestMapping(value = "/historyIntroduce/cooperations", method = RequestMethod.POST)
	public String addCooperation(Cooperation cooperation, MultipartFile file, HttpServletRequest request, Locale locale) throws IllegalStateException, IOException {
		if(!file.isEmpty()){
			cooperation.setLogoUrl(Utils.saveFile(file, request));	
		}
		cooperation.setLang(locale.getLanguage());
		this.cooperationMapper.insertSelective(cooperation);
		return "redirect:/admin/aboutUs/historyIntroduce";
	}

	@RequestMapping(value = "/historyIntroduce/cooperations/{id}/delete", method = RequestMethod.GET)
	public String deleteCooperation(@PathVariable("id") int id) {
		this.cooperationMapper.deleteByPrimaryKey(id);
		return "redirect:/admin/aboutUs/historyIntroduce";
	}

	@RequestMapping(value = "/historyIntroduce/cooperations/{id}/edit", method = RequestMethod.GET)
	public String editCooperation(@PathVariable("id") int id, ModelMap model) {
		model.addAttribute("cooperation", this.cooperationMapper.selectByPrimaryKey(id));
		return "admin/cooperations/edit";
	}

	@RequestMapping(value = "/historyIntroduce/cooperations/{id}/update", method = RequestMethod.POST)
	public String updateCooperation(@PathVariable("id") int id, Cooperation cooperation, ModelMap model, MultipartFile file, HttpServletRequest request, Locale locale) throws IllegalStateException, IOException {
		if(!file.isEmpty()){
			cooperation.setLogoUrl(Utils.saveFile(file, request));	
		}
		cooperation.setLang(locale.getLanguage());
		this.cooperationMapper.updateByPrimaryKeySelective(cooperation);
		return "redirect:/admin/aboutUs/historyIntroduce";
	}
}
