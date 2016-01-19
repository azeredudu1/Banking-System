package com.azeredudu.gestion.banque.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Role implements Serializable {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private Long       idRole;
    private String     roleName;
    @ManyToMany( mappedBy = "roles" )
    private List<User> user;
    public Long getIdRole() {
        return idRole;
    }
    public void setIdRole( Long idRole ) {
        this.idRole = idRole;
    }
    public String getRoleName() {
        return roleName;
    }
    public void setRoleName( String roleName ) {
        this.roleName = roleName;
    }
    public List<User> getUser() {
        return user;
    }
    public void setUser( List<User> user ) {
        this.user = user;
    }
    public Role() {
        super();
        // TODO Auto-generated constructor stub
    }
    public Role( String roleName ) {
        super();
        this.roleName = roleName;
    }

    }
