package ua.test.myapp.controller;

import java.util.List;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.*;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.test.myapp.model.User;
import ua.test.myapp.services.DataService;

@Controller
public class DataController {

	@Autowired
	DataService dataService;
	
	@RequestMapping(value = {"/", "/form"}, method = RequestMethod.GET)
	public ModelAndView getForm(@ModelAttribute User user) {
		return new ModelAndView("form");
	}

	@RequestMapping(value="/register", method=POST)
	public ModelAndView registerUser(@Valid @ModelAttribute User user, Errors errors) {	
		if (errors.hasErrors()) {
			return new ModelAndView("form");
		}		
		dataService.insertRow(user);
		return new ModelAndView("redirect:list");
	}

	@RequestMapping("/list")
	public ModelAndView getList(
			@RequestParam(value = "page", defaultValue = "0", required = false) int page) {
		List<User> userList = dataService.getList(page);
		int totalPages = dataService.getTotalPages();
		ModelAndView mav = new ModelAndView("list", "userList", userList);
		int previousPage = page - 1;
		if (previousPage < 0) {
			previousPage = 0;
		}
		int nextPage = page + 1;
		if (nextPage >= totalPages) {
			nextPage = totalPages - 1;
		}
		mav.addObject("totalPages", totalPages);
		mav.addObject("page", page);
		mav.addObject("previousPage", previousPage);
		mav.addObject("nextPage", nextPage);
		return mav;
	}

	@RequestMapping("/delete")
	public ModelAndView deleteUser(@RequestParam int id) {
		dataService.deleteRow(id);
		return new ModelAndView("redirect:list");
	}

	@RequestMapping("/edit")
	public ModelAndView editUser(@RequestParam int id, @ModelAttribute User user) {
		User userObject = dataService.getRowById(id);
		return new ModelAndView("edit", "userObject", userObject);
	}

	@RequestMapping(value="/update", method=POST)
	public ModelAndView updateUser(@Valid @ModelAttribute User user, Errors errors) {
		if (errors.hasErrors()) {
			return new ModelAndView("form");
		}	
		dataService.updateRow(user);
		return new ModelAndView("redirect:list");
	}

	@RequestMapping("/search")
	public ModelAndView getSearchList(@RequestParam("name") String name) {
		List<User> userList = dataService.getUsersByName(name);
		return new ModelAndView("search", "userList", userList);
	}
}
