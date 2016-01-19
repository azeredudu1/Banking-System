package com.azeredudu.gestion.banque.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue( "CC" )
public class CompteCourant extends Compte {
    private double decouvert;

    public CompteCourant() {
        super();
        // TODO Auto-generated constructor stub
    }

    public CompteCourant( Date dateCreation, double solde, String currency, String description, double decouvert ) {
        super( dateCreation, solde, currency, description );
        this.decouvert = decouvert;
    }

    /**
     * @return the decouvert
     */
    public double getDecouvert() {
        return decouvert;
    }

    /**
     * @param decouvert
     *            the decouvert to set
     */
    public void setDecouvert( double decouvert ) {
        this.decouvert = decouvert;
    }

    @Override
    public String toString() {
        return "Current";
    }

}
