package com.azeredudu.gestion.banque.controllers;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.CompteCourant;
import com.azeredudu.gestion.banque.entities.CompteEpargne;
import com.azeredudu.gestion.banque.entities.SendToEmail;
import com.azeredudu.gestion.banque.entities.User;
import com.azeredudu.gestion.banque.metier.BanqueForm;
import com.azeredudu.gestion.banque.services.BanqueService;

@Controller
public class EmployeeController {
    @Autowired
    private BanqueService service;

    @RequestMapping( "/backOffice" )
    public String officePage() {
        return "/employees/backOffice";
    }

    @RequestMapping( "/users" )
    public String getUSers( Model model ) {
        List<User> users = service.getUsers();
        model.addAttribute( "users", users );
        return "/employees/users";
    }

    @RequestMapping( "/delete_user" )
    public String deleteUser( @RequestParam( value = "userid", required = false ) Long userid,
            RedirectAttributes redirectAttributes ) {
        service.deleteUSer( userid );
        redirectAttributes.addFlashAttribute( "deleteSuccess", "Customer successfully deleted!" );
        return "redirect:/users";

    }

    @ModelAttribute( "user" )
    public User constructUser() {
        return new User();
    }

    @RequestMapping( "/new_user" )
    public String showRegister() {

        return "/employees/create_user";
    }

    @RequestMapping( method = RequestMethod.POST, value = "/new_user" )
    public String doRegisterUser( @Valid @ModelAttribute( "user" ) User user, BindingResult result,
            RedirectAttributes redirectAttributes ) {
        /*
         * if ( result.hasErrors() ) { showRegister(); }
         */
        service.addUser( user );
        redirectAttributes.addFlashAttribute( "success", true );
        return "redirect:/users";
    }

    @RequestMapping( value = "/edit_user" )
    public String editUser( Model model,
            @RequestParam( value = "userid", required = false ) Long userid ) {
        User user = service.consulterUser( userid );
        model.addAttribute( "user", user );
        return "/employees/edit_user";
    }

    @RequestMapping( value = "/update_user" )
    public String updateUser( @ModelAttribute User user, RedirectAttributes redirectAttributes ) {
        redirectAttributes.addFlashAttribute( "updateSuccess", "Customer successfully updated!" );
        user.setDateCreation( new Date() );
        service.updateUSer( user );
        return "redirect:/users";
    }

    @RequestMapping( "/all_accounts" )
    public String newAccount( Model model ) {
        List<Compte> comptes = service.listComptes();
        model.addAttribute( "comptes", comptes );
        return "/employees/all_accounts";
    }

    @RequestMapping( "/new_account" )
    public String showAccount( BanqueForm bf, Model model ) {
        List<User> users = service.getUsers();
        model.addAttribute( "users", users );
        return "/employees/create_account";
    }

    @RequestMapping( "/new_account_form" )
    public String showAccountForm( BanqueForm bf, Model model,
            @RequestParam( required = false, value = "idUser" ) Long idUser,
            RedirectAttributes redirectAttributes ) {
        List<User> users = service.getUsers();
        model.addAttribute( "users", users );

        if ( bf.getAction() != null ) {
            if ( bf.getTypeCompte().equals( "CA" ) ) {
                service.addCompte(
                        new CompteCourant( new Date(), bf.getSolde(), bf.getCurrency(), bf
                                .getDescription(), bf
                                .getDecouvert() ), idUser );
            }
            if ( bf.getTypeCompte().equals( "SA" ) ) {
                service.addCompte( new CompteEpargne( new Date(), bf.getSolde(), bf.getCurrency(), bf.getDescription(),
                        bf.getTaux() ), idUser );
            }

            model.addAttribute( "banqueForm", bf );
            redirectAttributes.addFlashAttribute( "accountCreated", "Account successfully created ! " );
            return "redirect:/all_accounts";
        }
        return "/employees/create_account_form";
    }

    @RequestMapping( "/new_deposit" )
    public String getUser( BanqueForm bf, Model model ) {
        List<User> users = service.getUsers();
        model.addAttribute( "users", users );
        return "/employees/deposit_get_user";
    }

    @RequestMapping( value = "/do_deposit" )
    public String depositForm( Model model, Principal principal, BanqueForm bf, BindingResult result,
            RedirectAttributes redirectAttributes, HttpServletRequest request,
            @RequestParam( required = false, value = "idUser" ) Long idUser ) {
        String name = principal.getName();
        List<Compte> comptes = service.getComptesByUser( idUser );
        User user = service.consulterUser( idUser );
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "comptes", comptes );

        if ( bf.getAction() != null ) {
            service.verser( bf.getMontant(),
                    bf.getCodeCpte(), idUser );

            new SendToEmail( "Deposit report ", user, bf.getMontant(), bf.getCodeCpte(), "dollars", String.format(
                    "%s://%s:%d/Banking-System/accounts/transactions/" + bf.getCodeCpte(), request.getScheme(),
                    request.getServerName(), request.getServerPort() ), "deposit", "in" );

            model.addAttribute( "comptes", comptes );
            model.addAttribute( "banque", bf );
            model.addAttribute( "name", name );
            redirectAttributes.addFlashAttribute( "message", "Success deposit !" );
            return "redirect:/all_accounts";
        }
        return "/employees/do_deposit";

    }

    @RequestMapping( "/new_withdrawal" )
    public String withdrwal( BanqueForm bf, Model model ) {
        List<User> users = service.getUsers();
        model.addAttribute( "users", users );
        return "/employees/withdrawal_get_user";
    }

    @RequestMapping( value = "/do_withdrawal" )
    public String doWithdrawal( Model model, @Valid BanqueForm bf, BindingResult result,
            RedirectAttributes redirectAttributes, HttpServletRequest request,
            @RequestParam( required = false, value = "idUser" ) Long idUser ) {

        List<Compte> comptes = service.getComptesByUser( idUser );
        User user = service.consulterUser( idUser );

        if ( bf.getAction() != null ) {

            Compte compte = service.consulterCompte( bf.getCodeCpte() );

            double solde = compte.getSolde();
            if ( compte.toString().equals( "Savings" ) ) {
                String message = "Sorry, this is a savings account, you cannot withdraw!";
                model.addAttribute( "comptes", comptes );
                model.addAttribute( "message", message );
                return "/employees/do_withdrawal";
            }
            if ( solde == bf.getMontant() || solde >
                    bf.getMontant() ) {
                service.retrait( bf.getMontant(), bf.getCodeCpte(),
                        user.getIdUser() );
                new SendToEmail( "Withdrawal report ", user, bf.getMontant(), bf.getCodeCpte(), "dollars",
                        String.format(
                                "%s://%s:%d/Banking-System/accounts/transactions/" + bf.getCodeCpte(),
                                request.getScheme(),
                                request.getServerName(), request.getServerPort() ), "withdrawal", "from" );
                redirectAttributes.addFlashAttribute( "message", "Success withdrawal ! " );
                return "redirect:/all_accounts";
            }
            else {

                String message = "Sorry, balance insufficient!";
                model.addAttribute( "comptes", comptes );
                model.addAttribute( "message", message );
                return "/employees/do_withdrawal";
            }

        }
        model.addAttribute( "banqueForm", bf );
        model.addAttribute( "comptes", comptes );

        return "/employees/do_withdrawal";
    }
}
