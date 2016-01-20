package com.azeredudu.gestion.banque.controllers;

import java.security.Principal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.azeredudu.gestion.banque.entities.CompteCourant;
import com.azeredudu.gestion.banque.entities.CompteEpargne;
import com.azeredudu.gestion.banque.entities.User;
import com.azeredudu.gestion.banque.metier.BanqueForm;
import com.azeredudu.gestion.banque.services.BanqueService;

@Controller
@RequestMapping( "/createAccount" )
public class NewAccount {
    @Autowired
    private BanqueService service;

    @RequestMapping
    public String showdoCreateForm( BanqueForm bf, Model model, Principal principal ) {
        model.addAttribute( "banqueForm", bf );

        return "do-createAccount";
    }

    @RequestMapping( method = RequestMethod.POST )
    public String doCreateAccount( BanqueForm bf, Model model, Principal principal,
            RedirectAttributes redirectAttributes ) {
        if ( principal != null ) {
            String name = principal.getName();
            User user = service.getUSer( name );
            model.addAttribute( "user", user );
            bf.setUserId( user.getIdUser() );
        }
        if ( bf.getTypeCompte().equals( "CA" ) ) {
            service.addCompte(
                    new CompteCourant( new Date(), bf.getSolde(), bf.getCurrency(), bf
                            .getDescription(), bf
                            .getDecouvert() ), bf.getUserId() );
        }
        if ( bf.getTypeCompte().equals( "SA" ) ) {
            service.addCompte( new CompteEpargne( new Date(), bf.getSolde(), bf.getCurrency(), bf.getDescription(),
                    bf.getTaux() ), bf.getUserId() );
        }

        model.addAttribute( "banqueForm", bf );
        redirectAttributes.addFlashAttribute( "message", "Account successfully created ! " );

        return "redirect:/accounts";

    }
}
