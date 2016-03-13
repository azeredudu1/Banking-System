package com.azeredudu.gestion.banque.test;

import java.util.Date;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.azeredudu.gestion.banque.entities.CompteCourant;
import com.azeredudu.gestion.banque.entities.Groupe;
import com.azeredudu.gestion.banque.entities.Role;
import com.azeredudu.gestion.banque.services.BanqueService;

public class Test {

    public static void main( String[] args ) {
        // TODO Auto-generated method stub
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
                new String[] { "spring-config.xml" } );
        BanqueService service = (BanqueService) context.getBean( "service" );
        service.addRole( new Role( "ROLE_ADMIN" ) );
        service.addRole( new Role( "ROLE_USER" ) );

        /*
         * User user = service .addUser( new User( "azere242", "azere242",
         * "Azere", "Mabiala", "China", "azere@gmail.com" ) ); service.addUser(
         * new User( "christophe", "christophe", "Christophe", "Mabiala",
         * "Congo", "christophe@gmail.com" ) ); service.addUser( new User(
         * "nyss242", "nyss242", "Nyss", "Mabiala", "Canada", "nyss@gmail.com" )
         * ); service.addUser( new User( "kenavizir", "kenavizir", "Dieuveille",
         * "Sah", "China", "kenavizir@gmail.com" ) );
         * 
         * service.addCompte( new CompteCourant( "LKIR00MCNKEAAC", new Date(),
         * 25000, 5000.0 ), 1L ); service.addCompte( new CompteCourant(
         * "LKIR00MCNKEDDA", new Date(), 180000, 5000.0 ), 1L );
         * service.addCompte( new CompteCourant( "LKIR00MCNKECCR", new Date(),
         * 25000, 5000.0 ), 2L ); service.addCompte( new CompteCourant(
         * "LKIR00MCNKEKKL", new Date(), 80000, 5000.0 ), 2L );
         * service.addCompte( new CompteEpargne( "LKIR00MCNKDLKI", new Date(),
         * 30000, 5 ), 1L ); service.addCompte( new CompteEpargne(
         * "LKIR00MCNKECVC", new Date(), 30000, 5 ), 2L );
         */

        service.addgroupe( new Groupe( "Top" ) );
        service.addgroupe( new Groupe( "Moyen" ) );
        service.addUserToGroupe( 1L, 1L );
        service.addUserToGroupe( 1L, 2L );
        service.addUserToGroupe( 2L, 2L );

        /*
         * service.verser( 15000, "LKIR00MCNKEAAC", 1L ); service.verser( 10000,
         * "LKIR00MCNKEAAC", 1L ); service.retrait( 5000, "LKIR00MCNKEAAC", 1L
         * ); service.verser( 7000, "LKIR00MCNKECCR", 2L ); service.verser(
         * 19000, "LKIR00MCNKECCR", 2L ); service.retrait( 3500,
         * "LKIR00MCNKECCR", 2L );
         */

        /*
         * List<Compte> listComptes = service.getComptesByUser( "azere242" );
         * for ( Compte compte : listComptes ) { System.out.println(
         * "********************************" ); System.out.println( "Owner :" +
         * compte.getUser().getFirstName() + " " +
         * compte.getUser().getLastName() ); System.out.println( "Solde : " +
         * compte.getSolde() ); System.out.println( "Type compte: " +
         * compte.getClass().toString() ); System.out.println( "Date creation: "
         * + compte.getDateCreation() );
         * 
         * } System.out.println( "*****************************" ); Compte
         * compte = service.consulterCompte( "LKIR00MCNKECVC" );
         * System.out.println( compte.getSolde() ); System.out.println(
         * compte.getDateCreation() );
         * 
         * List<Operation> operations = service.ConsulterOperations(
         * "LKIR00MCNKEAAC" ); for ( Operation operation : operations ) {
         * System.out.println( "*****************************" );
         * System.out.println( "Type operation: " + operation );
         * System.out.println( "Montant: " + operation.getMontant() ); }
         * List<Role> roles = (List<Role>) user.getRoles(); for ( Role role :
         * roles ) { System.out.println( role.getRoleName() ); }
         */
        /*
         * String uuid = UUID.randomUUID().toString(); System.out.println( uuid
         * );
         */
        Date date1 = new Date();
        Date date2 = new Date();
        service.addCompte( new CompteCourant( new Date(), 25000, "EURO", "first account", 5000 ), 1L );
        service.addCompte( new CompteCourant( new Date(), 18000, "EURO", "first account", 5000 ), 2L );

    }

}
