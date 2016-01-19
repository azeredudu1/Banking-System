package com.azeredudu.gestion.banque.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Inheritance( strategy = InheritanceType.SINGLE_TABLE )
@DiscriminatorColumn( name = "TYPE_OP", discriminatorType = DiscriminatorType.STRING, length = 4 )
public class Operation implements Serializable {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private long   numOperation;
    private Date   dateOperation;
    private double montant;
    @ManyToOne
    @JoinColumn( name = "CODE_CPTE" )
    private Compte compte;
    @ManyToOne
    @JoinColumn( name = "user_id" )
    private User   user;

    public Operation() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Operation( Date dateOperation, double montant ) {
        super();
        this.dateOperation = dateOperation;
        this.montant = montant;
    }

    /**
     * @return the numOperation
     */
    public long getNumOperation() {
        return numOperation;
    }

    /**
     * @param numOperation
     *            the numOperation to set
     */
    public void setNumOperation( long numOperation ) {
        this.numOperation = numOperation;
    }

    /**
     * @return the montant
     */
    public double getMontant() {
        return montant;
    }

    /**
     * @param montant
     *            the montant to set
     */
    public void setMontant( double montant ) {
        this.montant = montant;
    }

    /**
     * @return the compte
     */
    public Compte getCompte() {
        return compte;
    }

    /**
     * @param compte
     *            the compte to set
     */
    public void setCompte( Compte compte ) {
        this.compte = compte;
    }

    public User getUser() {
        return user;
    }

    public void setUser( User user ) {
        this.user = user;
    }

    public Date getDateOperation() {
        return dateOperation;
    }

    public void setDateOperation( Date dateOperation ) {
        this.dateOperation = dateOperation;
    }

}
