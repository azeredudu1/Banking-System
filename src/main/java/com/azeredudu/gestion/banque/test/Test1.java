package com.azeredudu.gestion.banque.test;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.Operation;
import com.azeredudu.gestion.banque.entities.User;
import com.azeredudu.gestion.banque.services.BanqueService;

public class Test1 {

    public static void main( String[] args ) {
        // TODO Auto-generated method stub
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
                new String[] { "spring-config.xml" } );
        BanqueService service = (BanqueService) context.getBean( "service" );
        List<Operation> list = service.ConsulterOperations( "6SUFVFIDTN62G", 0, 18 );
        for ( Operation operation : list ) {
            System.out.println( "***************" );
            System.out.println( "Type Op: " + operation );
            System.out.println( "montant" + operation.getMontant() );
        }
        User user = service.getUSer( "azereone" );
        System.out.println( user.getFirstName() + "+++++" + user.getLastName() );

        Compte compte = service.consulterCompte( "YF5UPIP53TTZ3" );
        double solde = compte.getSolde();
        double montant = 47000;
        if ( solde == montant || solde > montant ) {
            service.retrait( montant, "YF5UPIP53TTZ3", 7L );
        } else {
            System.out.println( "Insufficient balance" );
        }

    }
}
