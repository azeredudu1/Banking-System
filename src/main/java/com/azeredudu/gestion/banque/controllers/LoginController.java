package com.azeredudu.gestion.banque.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @RequestMapping( "/connexion" )
    public ModelAndView getLoginForm( @RequestParam( required = false ) String authfailed, String denied ) {
        String message = "";
        if ( authfailed != null ) {
            message = "Username or password incorrect, try again!";
        }

        else if ( denied != null ) {
            message = "Access denied";
        }

        return new ModelAndView( "login", "message", message );
    }

    @RequestMapping( "/403page" )
    public String get403page() {
        return "redirect:login?denied";
    }

}
