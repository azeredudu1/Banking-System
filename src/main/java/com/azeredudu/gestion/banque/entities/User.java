package com.azeredudu.gestion.banque.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table( name = "users" )
public class User implements Serializable {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "user_id" )
    private Long               idUser;

    @Column( name = "user_name" )
    private String             userName;
    @Column( name = "user_password" )
    private String             userPassword;
    private boolean            actived;
    @NotEmpty( message = "Please enter your first name!" )
    private String             firstName;
    @NotEmpty( message = "Please enter your first name!" )
    private String             lastName;
    private String             address;
    @Email( message = "Email format Incorrect" )
    private String             email;
    @ManyToMany( cascade = CascadeType.REMOVE )
    @JoinTable( name = "user_role", joinColumns = @JoinColumn( name = "users_id" ), inverseJoinColumns = @JoinColumn( name = "roles_id" ) )
    private Collection<Role>   roles;
    @OneToMany( mappedBy = "user", cascade = CascadeType.REMOVE )
    private Collection<Compte> comptes;
    @ManyToMany
    @JoinTable( name = "USER_GROUPE", joinColumns =
            @JoinColumn( name = "CODE_US" ), inverseJoinColumns =
            @JoinColumn( name = "CODE_GR" )

    )
    private Collection<Groupe> groupes;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName( String firstName ) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName( String lastName ) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress( String address ) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail( String email ) {
        this.email = email;
    }

    /**
     * @return the roles
     */
    public Collection<Role> getRoles() {
        return roles;
    }

    /**
     * @param roles
     *            the roles to set
     */
    public void setRoles( Collection<Role> roles ) {
        this.roles = roles;
    }

    /**
     * @return the idUser
     */
    public Long getIdUser() {
        return idUser;
    }

    /**
     * @param idUser
     *            the idUser to set
     */
    public void setIdUser( Long idUser ) {
        this.idUser = idUser;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName
     *            the userName to set
     */
    public void setUserName( String userName ) {
        this.userName = userName;
    }

    /**
     * @return the userPassword
     */
    public String getUserPassword() {
        return userPassword;
    }

    /**
     * @param userPassword
     *            the userPassword to set
     */
    public void setUserPassword( String userPassword ) {
        this.userPassword = userPassword;
    }

    /**
     * @return the actived
     */
    public boolean isActived() {
        return actived;
    }

    /**
     * @param actived
     *            the actived to set
     */
    public void setActived( boolean actived ) {
        this.actived = actived;
    }

    public User() {
        super();
        // TODO Auto-generated constructor stub
    }

    public User( String userName, String userPassword, String firstName, String lastName, String address, String email ) {
        super();
        this.userName = userName;
        this.userPassword = userPassword;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.email = email;
    }

    public Collection<Compte> getComptes() {
        return comptes;
    }

    public void setComptes( Collection<Compte> comptes ) {
        this.comptes = comptes;
    }

    public Collection<Groupe> getGroupes() {
        return groupes;
    }

    public void setGroupes( Collection<Groupe> groupes ) {
        this.groupes = groupes;
    }

}
