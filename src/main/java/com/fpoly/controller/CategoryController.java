package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.CategoryDAO;
import com.fpoly.model.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO categoryDAO;

	@GetMapping("/category/index")
	public String index(Model model) {
		Category item = new Category();
		model.addAttribute("item", item);
		List<Category> items = categoryDAO.findAll(Sort.by(Direction.ASC, "id"));
		model.addAttribute("items", items);
		return "category/index";
	}

	@RequestMapping("/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		Category item = categoryDAO.findById(id).get();
		model.addAttribute("item", item);
		List<Category> items = categoryDAO.findAll();
		model.addAttribute("items", items);
		return "category/index";
	}

	@RequestMapping("/category/create")
	public String create(Category item) {
		categoryDAO.save(item);
		return "redirect:/category/index";
	}

	@RequestMapping("/category/update")
	public String update(Category item) {
		categoryDAO.save(item);
		return "redirect:/category/edit/" + item.getId();
	}

	@RequestMapping("/category/delete/{id}")
	public String create(@PathVariable("id") String id) {
		categoryDAO.deleteById(id);
		return "redirect:/category/index";
	}
}
