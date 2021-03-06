package com.tony.relationships.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tony.relationships.services.PersonService;

@Controller
@RequestMapping("/")
public class RelationshipController{
	@Autowired
	private PersonService personService;
	
	@RequestMapping("")
	public String index(Model model){		
		model.addAttribute("persons",personService.all());
		return "show_all";
	}
}
