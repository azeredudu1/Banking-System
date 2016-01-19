package com.azeredudu.gestion.banque.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.Operation;
import com.azeredudu.gestion.banque.services.BanqueService;

@Controller
public class BanqueController {
    @Autowired
    private BanqueService service;

  /*  @RequestMapping( value = "/banque" )
    public String getBanque( Model model ) {
        model.addAttribute( "banqueForm", new BanqueForm() );
        return "banque-details";
    }

    @RequestMapping( value = "/chargerCompte" )
    public String chargerBanque( @Valid BanqueForm bf, BindingResult result, Model model ) {

        if ( result.hasErrors() ) {
            return "banque-details";
        }
        chargerCompte( bf );
        model.addAttribute( "banqueForm", bf );
        return "banque-details";
    }

    @RequestMapping( value = "/saveOperation" )
    public String saveOperation( @Valid BanqueForm bf, BindingResult result ) {

        if ( result.hasErrors() ) {
            return "banque-details";
        }

        if ( bf.getAction() != null ) {
            if ( bf.getTypeOperation().equals( "VER" ) ) {
                service.verser( bf.getMontant(), bf.getCode(), 1L );
            }
            else if ( bf.getTypeOperation().equals( "RET" ) ) {
                service.retrait( bf.getMontant(), bf.getCode(), 1L );
            }
            else if ( bf.getTypeOperation().equals( "VIR" ) ) {

                try {
                    service.virement( bf.getMontant(), bf.getCode(), bf.getCode2(), 1L );
                } catch ( Exception e ) {
                    // TODO Auto-generated catch block
                    bf.setException( e.getMessage() );
                }

            }
        }
        chargerCompte( bf );

        return "banque-details";
    }

    public void chargerCompte( BanqueForm bf ) {
        try {
            Compte compte = service.consulterCompte( bf.getCode() );
            bf.setCompte( compte );
            bf.setTypeCompte( compte.getClass().getSimpleName() );
            int pos = bf.getNbreLigne() * bf.getPage();
            List<Operation> ops = service.ConsulterOperations( bf.getCode(), pos, bf.getNbreLigne() );
            bf.setOperations( ops );

            long nbreOperations = service.getNombreOperations( bf.getCode() );
            bf.setNombrePages( (int) ( nbreOperations / bf.getNbreLigne() ) + 1 );

            System.out.println( nbreOperations / bf.getNbreLigne() );
        } catch ( Exception e ) {
            // TODO Auto-generated catch block
            bf.setException( e.getMessage() );
        }

    }*/
}
