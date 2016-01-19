package com.azeredudu.gestion.banque.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table( name = "compte" )
@DiscriminatorValue( "CE" )
public class CompteEpargne extends Compte {
    private double taux;

    public CompteEpargne() {
        super();
        // TODO Auto-generated constructor stub
    }

    public CompteEpargne( Date dateCreation, double solde, String currency, String description, double taux ) {
        super( dateCreation, solde, currency, description );
        this.taux = taux;
    }

    /**
     * @return the taux
     */
    public double getTaux() {
        return taux;
    }

    /**
     * @param taux
     *            the taux to set
     */
    public void setTaux( double taux ) {
        this.taux = taux;
    }

    @Override
    public String toString() {
        return "Savings";
    }

}
