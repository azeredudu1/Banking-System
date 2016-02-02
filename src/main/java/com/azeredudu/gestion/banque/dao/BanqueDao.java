package com.azeredudu.gestion.banque.dao;

import java.util.List;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.Groupe;
import com.azeredudu.gestion.banque.entities.Operation;
import com.azeredudu.gestion.banque.entities.Role;
import com.azeredudu.gestion.banque.entities.User;

public interface BanqueDao {
    User addUser( User user );

    Groupe addgroupe( Groupe groupe );

    void addUserToGroupe( Long userId, Long codeGr );

    Compte addCompte( Compte compte, Long userId );

    Operation addOperation( Operation operation, String codeCpte, Long userId );

    Compte consulterCompte( Long userId );

    Compte consulterCompte( String userId );

    User consulterUser( Long userId );

    User getUSer( String username );

    List<Compte> getComptesByUser( String userName );

    /* List<Compte> getComptesByUser( String userName ); */

    List<User> getUsers();

    List<Groupe> getGroupes();

    List<User> getUSersByGroupe( Long codeGr );

    List<User> consulterUsers( String mc );

    List<Operation> ConsulterOperations( String codeCpte );

    Long getNombreOperations( String codeCpte );

    Long getNombreComptes( String username );

    void addRole( Role role );

    Role getRole( Long id );

}
