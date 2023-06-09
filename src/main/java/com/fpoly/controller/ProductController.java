package com.fpoly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.dao.ProductDAO;
import com.fpoly.model.Product;
import com.fpoly.service.SessionService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	SessionService session;

	@RequestMapping("/product/sort")
	public String sort(Model model, @RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = productDAO.findAll(sort);
		model.addAttribute("items", items);
		return "product/sort";
	}

	@RequestMapping("/product/page")
	public String paginate(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = productDAO.findAll(pageable);
		model.addAttribute("page", page);
		return "product/page";
	}

	@RequestMapping("/product/search")
	public String search(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		Double minPrice = min.orElse(Double.MIN_VALUE);
		Double maxPrice = max.orElse(Double.MAX_VALUE);
//		bai 1
//		List<Product> items = productDAO.findByPrice(minPrice, maxPrice);
		
//		bai 4
		List<Product> items = productDAO.findByPriceBetween(minPrice, maxPrice);
		model.addAttribute("items", items);
		return "product/search";
	}

	@RequestMapping("/product/search-and-page")
	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse((String) session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
//		Page<Product> page = productDAO.findByKeywords("%"+kwords+"%", pageable);
		
		Page<Product> page = productDAO.findAllByNameLike("%"+kwords+"%", pageable);
		model.addAttribute("page", page);
		return "product/search-and-page";
	}
}