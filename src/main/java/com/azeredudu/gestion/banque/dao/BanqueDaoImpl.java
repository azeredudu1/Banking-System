package com.azeredudu.gestion.banque.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.Groupe;
import com.azeredudu.gestion.banque.entities.Operation;
import com.azeredudu.gestion.banque.entities.Role;
import com.azeredudu.gestion.banque.entities.User;

public class BanqueDaoImpl implements BanqueDao {

    @PersistenceContext
    private EntityManager em;

    public User addUser( User user ) {
        // TODO Auto-generated method stub
        /*
         * user.setActived( true );
         */
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        user.setUserPassword( encoder.encode( user.getUserPassword() ) );
        List<Role> roles = new ArrayList<Role>();

        roles.add( getRole( 2L ) );
        user.setDateCreation( new Date() );
        user.setRoles( roles );
        em.persist( user );
        return user;
    }

    public Groupe addgroupe( Groupe groupe ) {
        // TODO Auto-generated method stub
        em.persist( groupe );
        return groupe;
    }

    public void addUserToGroupe( Long userId, Long codeGr ) {
        // TODO Auto-generated method stub
        User user = em.find( User.class, userId );
        Groupe groupe = em.find( Groupe.class, codeGr );
        user.getGroupes().add( groupe );
        groupe.getUsers().add( user );

    }

    public Compte addCompte( Compte compte, Long userId ) {
        // TODO Auto-generated method stub
        User user = em.find( User.class, userId );
        String aToZ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; // 36 letter.
        String randomStr = generateRandom( aToZ );
        compte.setCodeCompte( randomStr );

        compte.setUser( user );
        em.persist( compte );

        return compte;
    }

    public Operation addOperation( Operation operation, String cpteId, Long userId ) {
        // TODO Auto-generated method stub
        Compte compte = consulterCompte( cpteId );
        User user = em.find( User.class, userId );
        operation.setCompte( compte );
        operation.setUser( user );
        em.persist( operation );

        return operation;
    }

    public User consulterUser( Long userId ) {
        // TODO Auto-generated method stub
        User user = em.find( User.class, userId );
        if ( user == null ) {
            throw new RuntimeException( "Client introuvable!" );
        }

        return user;
    }

    public List<Compte> getComptesByUser( String userName ) {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select c from Compte c where c.user.userName=:x order by c.dateCreation DESC" );
        query.setParameter( "x", userName );

        return query.getResultList();
    }

    public List<User> getUsers() {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select u from User u" );
        return query.getResultList();
    }

    public List<Groupe> getGroupes() {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select g from Groupe g" );
        return query.getResultList();
    }

    public List<User> getUSersByGroupe( Long userId ) {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select u from User u where u.groupe.codeGroupe=:x" );
        query.setParameter( "x", userId );

        return query.getResultList();
    }

    public List<User> consulterUsers( String mc ) {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select u from User u where u.firstName like:x" );
        query.setParameter( "x", "%" + mc + "%" );

        return query.getResultList();
    }

    public List<Operation> ConsulterOperations( String codeCpte ) {
        // TODO Auto-generated method stub
        Query query = em
                .createQuery( "select o from Operation o where o.compte.codeCompte=:x order by o.dateOperation desc" );
        query.setParameter( "x", codeCpte );

        return query.getResultList();
    }

    public Long getNombreOperations( String codeCpte ) {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select count(o) from Operation o where o.compte.codeCompte=:x " );
        query.setParameter( "x", codeCpte );

        return (Long) query.getResultList().get( 0 );
    }

    public void addRole( Role role ) {
        // TODO Auto-generated method stub

        em.persist( role );

    }

    public Compte consulterCompte( Long userId ) {
        // TODO Auto-generated method stub
        Compte compte = em.find( Compte.class, userId );

        return compte;
    }

    public Compte consulterCompte( String userId ) {
        // TODO Auto-generated method stub
        Compte compte = em.find( Compte.class, userId );
        return compte;
    }

    public Role getRole( Long id ) {
        // TODO Auto-generated method stub
        Role role = em.find( Role.class, id );
        return role;
    }

    private static String generateRandom( String aToZ ) {
        Random rand = new Random();
        StringBuilder res = new StringBuilder();
        for ( int i = 0; i < 13; i++ ) {
            int randIndex = rand.nextInt( aToZ.length() );
            res.append( aToZ.charAt( randIndex ) );
        }
        return res.toString();
    }

    public Long getNombreComptes( String username ) {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select count(c) from Compte c where c.user.userName=:x " );
        query.setParameter( "x", username );

        return (Long) query.getResultList().get( 0 );
    }

    public User getUSer( String username ) {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "select u from User u where u.userName like:x" );
        query.setParameter( "x", "%" + username + "%" );
        return (User) query.getSingleResult();
    }

    public void deleteUSer( Long id ) {
        // TODO Auto-generated method stub
        User user = em.find( User.class, id );
        em.remove( user );

    }

    public void UpdateUser( Long id, String firstName, String lastName, String userName, String email,
            boolean actived, String address, String userPassword ) {
        // TODO Auto-generated method stub
        User user = em.find( User.class, id );
        user.setUserName( userName );
        user.setFirstName( firstName );
        user.setLastName( lastName );
        user.setActived( actived );
        user.setEmail( email );
        user.setUserPassword( userPassword );
        user.setAddress( address );

    }

    public void updateUSer( User user ) {
        em.merge( user );

    }

    public List<Compte> listComptes() {
        // TODO Auto-generated method stub
        Query query = em.createQuery( "SELECT c FROM  Compte c" );
        return query.getResultList();
    }

    public List<Compte> getComptesByUser( Long id ) {
        // TODO Auto-generated method stub

        Query query = em.createQuery( "select c from Compte c where c.user.idUser=:x order by c.dateCreation DESC" );
        query.setParameter( "x", id );

        return query.getResultList();
    }

}
