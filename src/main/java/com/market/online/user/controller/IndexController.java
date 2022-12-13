package com.market.online.user.controller;

import com.market.online.common.utils.UrlUtils;
import com.market.online.entity.User;
import com.market.online.user.service.CategoryService;
import com.market.online.user.service.ProductService;
import com.market.online.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class IndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @GetMapping({"/", "/home"})
    public String goIndex(Model model){
        model.addAttribute("categoryData", categoryService.getAll());
        model.addAttribute("productFeature", productService.getFeaturedProducts());
        model.addAttribute("productViewed");
        return "user/component/home";
    }

    @GetMapping("/contact")
    public String goContact(){

        return "user/component/contact";
    }

    @GetMapping("/login")
    public String goLogin(Model model){
        model.addAttribute("loginForm", new User());
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(HttpServletRequest request, RedirectAttributes attributes, @ModelAttribute("loginForm") User user) throws Exception {
        boolean checkLogin = userService.login(request, user);
        attributes.addFlashAttribute("mess", checkLogin ? "Đăng nhập thành công" : "Đăng nhập thất bại");
        System.out.println("Message login: "+checkLogin);
        return "redirect:home";
    }

    @GetMapping("/register")
    public String goRegister(Model model){
        model.addAttribute("registerForm", new User());
        return "register";
    }

    @PostMapping("/register")
    public String doRegister(HttpServletRequest request, BindingResult errors, @ModelAttribute("registerForm") User user){
        if(errors.hasErrors()){

        }
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @GetMapping("/logout")
    public String goLogout(HttpServletRequest request){
        userService.logout(request);
        return "redirect:home";
    }
}
