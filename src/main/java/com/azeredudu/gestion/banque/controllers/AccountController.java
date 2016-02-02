package com.azeredudu.gestion.banque.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.Operation;
import com.azeredudu.gestion.banque.metier.BanqueForm;
import com.azeredudu.gestion.banque.services.BanqueService;

@Controller
@RequestMapping( "/accounts" )
public class AccountController {
    @Autowired
    private BanqueService service;

    @RequestMapping
    public String doGetAccounts( Model model, Principal principal, BanqueForm bf ) {
        String name = principal.getName();
        /*
         * int pos = bf.getNbreLigne() * bf.getPage();
         * 
         * long nbreComptes = service.getNombreComptes( name );
         * bf.setNombrePages( (int) ( nbreComptes / bf.getNbreLigne() ) + 1 );
         */
        List<Compte> comptes = service.getComptesByUser( name );
        model.addAttribute( "comptes", comptes );
        model.addAttribute( "name", name );

        return "accounts";
    }

    @RequestMapping( "/{code}" )
    public String doGetAccountDetails( Model model, @PathVariable String code, Principal principal ) {
        String name = principal.getName();
        Compte compte = service.consulterCompte( code );
        model.addAttribute( "compte", compte );
        model.addAttribute( "name", name );

        return "account-details";

    }

    @RequestMapping( "/transactions/{code}" )
    public String doGetTransactions( Model model, BanqueForm bf, @PathVariable String code, Principal principal ) {
        String name = principal.getName();
        List<Operation> operations = service.ConsulterOperations( code );
        model.addAttribute( "operations", operations );
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "code", code );
        model.addAttribute( "name", name );

        return "transactions-details";
    }
}
