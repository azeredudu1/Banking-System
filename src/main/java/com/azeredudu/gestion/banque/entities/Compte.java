package com.azeredudu.gestion.banque.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table( name = "compte" )
@Inheritance( strategy = InheritanceType.SINGLE_TABLE )
@DiscriminatorColumn( name = "TYPE_PTE", discriminatorType = DiscriminatorType.STRING, length = 4 )
public class Compte implements Serializable {

    /**
     * 
     */
    private static final long     serialVersionUID = 1L;
    @Id
    private String                codeCompte;
    private Date                  dateCreation;
    private double                solde;
    private String                currency;
    private String                description;

    @ManyToOne
    @JoinColumn( name = "user_id" )
    private User                  user;
    @OneToMany( mappedBy = "compte", cascade = CascadeType.REMOVE )
    private Collection<Operation> operations;

    public String getCodeCompte() {
        return codeCompte;
    }

    public void setCodeCompte( String codeCompte ) {
        this.codeCompte = codeCompte;
    }

    public Date getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation( Date dateCreation ) {
        this.dateCreation = dateCreation;
    }

    public double getSolde() {
        return solde;
    }

    public void setSolde( double solde ) {
        this.solde = solde;
    }

    public User getUser() {
        return user;
    }

    public void setUser( User user ) {
        this.user = user;
    }

    public Collection<Operation> getOperations() {
        return operations;
    }

    public void setOperations( Collection<Operation> operations ) {
        this.operations = operations;
    }

    public Compte( Date dateCreation, double solde, String currency, String description ) {
        super();
        this.dateCreation = dateCreation;
        this.solde = solde;
        this.currency = currency;
        this.description = description;
    }

    public Compte() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency( String currency ) {
        this.currency = currency;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription( String description ) {
        this.description = description;
    }

}
