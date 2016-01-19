package com.azeredudu.gestion.banque.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table( name = "groupe" )
public class Groupe implements Serializable {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private Long             numGroupe;
    @Column( name = "nomGroupe" )
    private String           nomGroupe;
    @ManyToMany( mappedBy = "groupes" )
    private Collection<User> users;
    public Long getNumGroupe() {
        return numGroupe;
    }
    public void setNumGroupe( Long numGroupe ) {
        this.numGroupe = numGroupe;
    }
    public String getNomGroupe() {
        return nomGroupe;
    }
    public void setNomGroupe( String nomGroupe ) {
        this.nomGroupe = nomGroupe;
    }
    public Collection<User> getUsers() {
        return users;
    }
    public void setUsers( Collection<User> users ) {
        this.users = users;
    }
    public Groupe( String nomGroupe ) {
        super();
        this.nomGroupe = nomGroupe;
      
    }
    public Groupe() {
        super();
        // TODO Auto-generated constructor stub
    }


}
