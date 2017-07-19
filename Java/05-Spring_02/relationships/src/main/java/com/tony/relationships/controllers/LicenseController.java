package com.tony.relationships.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tony.relationships.models.License;
import com.tony.relationships.services.LicenseService;
import com.tony.relationships.services.PersonService;

@Controller
@RequestMapping("/licenses")
public class LicenseController{	
	@Autowired
	private LicenseService licenseService;
	@Autowired
	private PersonService personService;
	
	public LicenseController(LicenseService licenseService){
		this.licenseService = licenseService;
	}
	
	@RequestMapping("/new")
	public String _new(Model model){
		model.addAttribute("license",new License());
		model.addAttribute("persons",personService.noLicense());//Dont show people who already have a license. It will error if we don't anyways, since one-to-one.
		
		return "new_license";
	}
	
	@PostMapping("/new")
	public String create(@Valid @ModelAttribute("license") License license,BindingResult res,RedirectAttributes re){
		
		if(res.hasErrors()){
			re.addFlashAttribute("errs",res.getAllErrors());
			return "redirect:/licenses/new";
		}else{
			licenseService.create(license);
			return "redirect:/";
		}
	}
}
