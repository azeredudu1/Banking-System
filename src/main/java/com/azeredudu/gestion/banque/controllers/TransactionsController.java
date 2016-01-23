package com.azeredudu.gestion.banque.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.SendToEmail;
import com.azeredudu.gestion.banque.entities.SendToEmail1;
import com.azeredudu.gestion.banque.entities.SendToEmail2;
import com.azeredudu.gestion.banque.entities.User;
import com.azeredudu.gestion.banque.metier.BanqueForm;
import com.azeredudu.gestion.banque.services.BanqueService;

@Controller
public class TransactionsController {
    @Autowired
    private BanqueService service;

    @RequestMapping( value = "/depositForm" )
    public String depositForm( Model model, Principal principal, BanqueForm bf ) {
        String name = principal.getName();
        List<Compte> comptes = service.getComptesByUser( name );
        model.addAttribute( "name", name );
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "comptes", comptes );
        return "do-deposit";

    }

    @RequestMapping( value = "/deposit" )
    public String doDeposit( Model
            model, Principal principal, @Valid BanqueForm bf, BindingResult result,
            RedirectAttributes redirectAttributes, HttpServletRequest request ) {
        String name = principal.getName();
        List<Compte> comptes =
                service.getComptesByUser( name );
        User user = service.getUSer( name );

        service.verser( bf.getMontant(),
                bf.getCodeCpte(), user.getIdUser() );

        new SendToEmail( "Deposit report ", user, bf.getMontant(), bf.getCodeCpte(), "dollars", String.format(
                "%s://%s:%d/Banking-System/accounts/transactions/" + bf.getCodeCpte(), request.getScheme(),
                request.getServerName(), request.getServerPort() ), "deposit", "in" );

        model.addAttribute( "comptes", comptes );
        model.addAttribute( "banque", bf );
        model.addAttribute( "name", name );
        redirectAttributes.addFlashAttribute( "message", "Success deposit !" );
        return "redirect:/accounts";

    }

    @RequestMapping( value = "/withdrawalForm" )
    public String withdrawalForm( Model model, Principal principal, BanqueForm bf, String name ) {
        if ( principal != null ) {
            name = principal.getName();
        }

        List<Compte> comptes = service.getComptesByUser( name );
        model.addAttribute( "name", name );
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "comptes", comptes );
        return "do-withdrawal";

    }

    @RequestMapping( value = "withdrawal" )
    public String withdrawal( Model model, @Valid BanqueForm bf, BindingResult result, Principal principal,
            RedirectAttributes redirectAttributes, HttpServletRequest request ) {
        String name = principal.getName();
        User user = service.getUSer( name );
        List<Compte> comptes = service.getComptesByUser( name );
        /*
         * if ( result.hasErrors() ) { model.addAttribute( "comptes", comptes );
         * return "do-withdrawal"; }
         */

        Compte compte = service.consulterCompte( bf.getCodeCpte() );
        double solde = compte.getSolde();
        if ( solde == bf.getMontant() || solde >
                bf.getMontant() ) {
            service.retrait( bf.getMontant(), bf.getCodeCpte(),
                    user.getIdUser() );
            new SendToEmail( "Withdrawal report ", user, bf.getMontant(), bf.getCodeCpte(), "dollars", String.format(
                    "%s://%s:%d/Banking-System/accounts/transactions/" + bf.getCodeCpte(), request.getScheme(),
                    request.getServerName(), request.getServerPort() ), "withdrawal", "from" );
        } else {

            String message = "Sorry, your balance is insufficient!";
            model.addAttribute( "comptes", comptes );
            model.addAttribute( "message", message );
            return "do-withdrawal";
        }
        model.addAttribute( "name", name );
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "comptes", comptes );
        redirectAttributes.addFlashAttribute( "message", "Success withdrawal ! " );
        return "redirect:/accounts";

    }

    @RequestMapping( value = "/transferForm", method = RequestMethod.GET )
    public String getTransferForm( Model model, Principal principal, BanqueForm bf ) {
        String name = principal.getName();
        List<Compte> comptes = service.getComptesByUser( name );
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "comptes", comptes );
        model.addAttribute( "name", name );
        return "do-transfer";
    }

    @RequestMapping( value = "/transfer" )
    public String transfer( Model model, Principal principal, @Valid BanqueForm bf, BindingResult result,
            RedirectAttributes redirectAttributes, HttpServletRequest request ) {
        String name = principal.getName();
        User user = service.getUSer( name );
        List<Compte> comptes = service.getComptesByUser( name );
        /*
         * if ( result.hasErrors() ) { model.addAttribute( "comptes", comptes );
         * return "do-transfer"; }
         */
        Compte compte = service.consulterCompte( bf.getCodeCpte() );
        double solde = compte.getSolde();
        Compte compte2 = service.consulterCompte( bf.getCodeCpte2() );
        if ( compte2 == null ) {
            model.addAttribute( "exception", "No account found with the account number : " + bf.getCodeCpte2() );
            model.addAttribute( "comptes", comptes );
            return "do-transfer";
        }
        if ( solde == bf.getMontant() || solde > bf.getMontant() ) {

            service.virement( bf.getMontant(), bf.getCodeCpte(), bf.getCodeCpte2(), user.getIdUser() );
            new SendToEmail1( "Transfer report", user, bf.getMontant(), bf.getCodeCpte(), bf.getCodeCpte2(), "dollars",
                    String.format(
                            "%s://%s:%d/Banking-System/accounts/transactions/" + bf.getCodeCpte(), request.getScheme(),
                            request.getServerName(), request.getServerPort() ) );
            Compte accountReceiver = service.consulterCompte( bf.getCodeCpte2() );
            User userReceiver = accountReceiver.getUser();
            new SendToEmail2( "Fund received report", userReceiver, bf.getMontant(), bf.getCodeCpte(),
                    bf.getCodeCpte2(),
                    "dollars",
                    String.format(
                            "%s://%s:%d/Banking-System/accounts/transactions/" + bf.getCodeCpte2(),
                            request.getScheme(),
                            request.getServerName(), request.getServerPort() ) );
        }

        else {
            String message = "Sorry, your balance is insufficient!";
            model.addAttribute( "comptes", comptes );
            model.addAttribute( "message", message );
            return "do-transfer";

        }

        redirectAttributes.addFlashAttribute( "message", "Success transfer !" );
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "comptes", comptes );
        model.addAttribute( "name", name );
        return "redirect:/accounts";

    }
}
