package com.azeredudu.gestion.banque.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.azeredudu.gestion.banque.entities.User;
import com.azeredudu.gestion.banque.services.BanqueService;

@Controller
@RequestMapping( "/register" )
public class UserController {
    @Autowired
    private BanqueService service;

    @ModelAttribute( "user" )
    public User constructUser() {
        return new User();
    }

    @RequestMapping
    public String showRegister() {
        return "user-register";
    }

    @RequestMapping( method = RequestMethod.POST )
    public String doRegisterUser( @Valid @ModelAttribute( "user" ) User user, BindingResult result,
            RedirectAttributes redirectAttributes ) {
        if ( result.hasErrors() ) {
            showRegister();
        }
        service.addUser( user );
        redirectAttributes.addFlashAttribute( "success", true );
        return "redirect:/register";
    }
}
