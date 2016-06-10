package com.azeredudu.gestion.banque.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Welcome {
    @RequestMapping( "/welcome" )
    public String welcomePage( @RequestParam( required = false ) String logout, Model model ) {
        if ( logout != null ) {
            model.addAttribute( "message", "Successfully logged out!" );
        }

        return "welcome";
    }

}
