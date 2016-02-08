package com.azeredudu.gestion.banque.services;

import java.util.List;

import com.azeredudu.gestion.banque.entities.Compte;
import com.azeredudu.gestion.banque.entities.Groupe;
import com.azeredudu.gestion.banque.entities.Operation;
import com.azeredudu.gestion.banque.entities.Role;
import com.azeredudu.gestion.banque.entities.User;

public interface BanqueService {
    User addUser( User user );

    Groupe addgroupe( Groupe groupe );

    void addUserToGroupe( Long userId, Long codeGr );

    Compte addCompte( Compte compte, Long userId );

    void verser( double montant, String codeCpte, Long userId );

    void retrait( double montant, String codeCpte, Long userId );

    void virement( double montant, String codeCpte1, String codeCpte2, Long userId );

    Compte consulterCompte( String codeCpte );

    Compte consulterCompte( Long userId );

    User consulterUser( Long userId );

    User getUSer( String username );

    List<Compte> getComptesByUser( String userName );

    List<User> getUsers();

    List<Groupe> getGroupes();

    List<User> getUsersByGroupe( Long codeGr );

    List<User> consulterUsers( String mc );

    List<Operation> ConsulterOperations( String codeCpte );

    Long getNombreOperations( String codeCpte );

    void addRole( Role role );

    Role getRole( Long id );

    Long getNombreComptes( String username );

    void deleteUSer( Long id );

    void UpdateUser( Long id, String firstName, String lastName, String userName, String email,
            boolean actived, String address, String userPassword );

    void updateUSer( User user );

    List<Compte> listComptes();
}
