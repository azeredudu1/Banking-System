package com.azeredudu.gestion.banque.services;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.azeredudu.gestion.banque.dao.BanqueDao;
import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.Groupe;
import com.azeredudu.gestion.banque.entities.Operation;
import com.azeredudu.gestion.banque.entities.Retrait;
import com.azeredudu.gestion.banque.entities.Role;
import com.azeredudu.gestion.banque.entities.User;
import com.azeredudu.gestion.banque.entities.Versement;

@Transactional
public class BanqueServiceImpl implements BanqueService {

    private BanqueDao dao;

    /**
     * @param dao
     *            the dao to set
     */
    public void setDao( BanqueDao dao ) {
        this.dao = dao;
    }

    public Groupe addgroupe( Groupe groupe ) {
        // TODO Auto-generated method stub
        return dao.addgroupe( groupe );
    }

    public void verser( double montant, String codeCpte, Long userId ) {
        // TODO Auto-generated method stub
        dao.addOperation( new Versement( new Date(), montant ), codeCpte, userId );
        Compte compte = dao.consulterCompte( codeCpte );
        compte.setSolde( compte.getSolde() + montant );
    }

    public void retrait( double montant, String codeCpte, Long userId ) {
        // TODO Auto-generated method stub
        dao.addOperation( new Retrait( new Date(), montant ), codeCpte, userId );
        Compte compte = dao.consulterCompte( codeCpte );
        compte.setSolde( compte.getSolde() - montant );

    }

    public void virement( double montant, String codeCpte1, String codeCpte2, Long userId ) {
        // TODO Auto-generated method stub
        retrait( montant, codeCpte1, userId );
        verser( montant, codeCpte2, userId );
    }

    public Compte consulterCompte( String codeCpte ) {
        // TODO Auto-generated method stub
        return dao.consulterCompte( codeCpte );
    }

    public List<Groupe> getGroupes() {
        // TODO Auto-generated method stub
        return dao.getGroupes();
    }

    public Long getNombreOperations( String codeCpte ) {
        // TODO Auto-generated method stub
        return dao.getNombreOperations( codeCpte );
    }

    public Compte addCompte( Compte compte, Long userId ) {
        // TODO Auto-generated method stub
        return dao.addCompte( compte, userId );
    }

    public User consulterUser( Long userId ) {
        // TODO Auto-generated method stub
        return dao.consulterUser( userId );
    }

    public List<User> getUsers() {
        // TODO Auto-generated method stub
        return dao.getUsers();
    }

    public List<User> getUsersByGroupe( Long codeGr ) {
        // TODO Auto-generated method stub
        return dao.getUSersByGroupe( codeGr );
    }

    public List<User> consulterUsers( String mc ) {
        // TODO Auto-generated method stub
        return dao.consulterUsers( mc );
    }

    public User addUser( User user ) {
        // TODO Auto-generated method stub
        return dao.addUser( user );
    }

    public void addUserToGroupe( Long userId, Long codeGr ) {
        // TODO Auto-generated method stub
        dao.addUserToGroupe( userId, codeGr );

    }

    public Compte consulterCompte( Long userId ) {
        // TODO Auto-generated method stub
        return dao.consulterCompte( userId );
    }

    public void addRole( Role role ) {
        // TODO Auto-generated method stub
        dao.addRole( role );

    }

    public Role getRole( Long id ) {
        // TODO Auto-generated method stub
        return dao.getRole( id );
    }

    /*
     * public List<Compte> getComptesByUser( String userName, int position, int
     * nbreComptes ) { // TODO Auto-generated method stub return
     * dao.getComptesByUser( userName, position, nbreComptes ); }
     */

    public List<Operation> ConsulterOperations( String codeCpte ) {
        // TODO Auto-generated method stub
        return dao.ConsulterOperations( codeCpte );
    }

    public Long getNombreComptes( String username ) {
        // TODO Auto-generated method stub
        return dao.getNombreComptes( username );
    }

    public List<Compte> getComptesByUser( String userName ) {
        // TODO Auto-generated method stub
        return dao.getComptesByUser( userName );
    }

    public User getUSer( String username ) {
        // TODO Auto-generated method stub
        return dao.getUSer( username );
    }

    public void deleteUSer( Long id ) {
        // TODO Auto-generated method stub
        dao.deleteUSer( id );

    }

    public void UpdateUser( Long id, String firstName, String lastName, String userName, String email,
            boolean actived, String address, String userPassword ) {
        // TODO Auto-generated method stub
        dao.UpdateUser( id, firstName, lastName, userName, email, actived, address, userPassword );

    }

    public void updateUSer( User user ) {
        // TODO Auto-generated method stub
        dao.updateUSer( user );

    }
}
