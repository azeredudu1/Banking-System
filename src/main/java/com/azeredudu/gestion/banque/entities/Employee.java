package com.azeredudu.gestion.banque.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table( name = "employee" )
public class Employee implements Serializable {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "code_Employee" )
    private Long               codeEmployee;
    private String             firstName;
    private String             lastName;
    private String             username;
    private String             password;
    private boolean            actived;
    @ManyToOne
    @JoinColumn( name = "CODE_EMP_SUP" )
    private Employee           employeeSup;
    @ManyToMany
    @JoinTable( name = "EMP_GR", joinColumns =
            @JoinColumn( name = "CODE_EMP" ), inverseJoinColumns =
            @JoinColumn( name = "CODE_GR" )

    )
    private Collection<Groupe> groupes;

    @ManyToMany
    @JoinTable( name = "employee_role", joinColumns = @JoinColumn( name = "employee_id" ), inverseJoinColumns = @JoinColumn( name = "role_id" ) )
    private List<RoleEmployee> roleEmp;

    public Employee() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Long getCodeEmployee() {
        return codeEmployee;
    }

    public void setCodeEmployee( Long codeEmployee ) {
        this.codeEmployee = codeEmployee;
    }

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

    public String getUsername() {
        return username;
    }

    public void setUsername( String username ) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword( String password ) {
        this.password = password;
    }

    /**
     * @return the employeeSup
     */
    public Employee getEmployeeSup() {
        return employeeSup;
    }

    /**
     * @param employeeSup
     *            the employeeSup to set
     */
    public void setEmployeeSup( Employee employeeSup ) {
        this.employeeSup = employeeSup;
    }

    /**
     * @return the groupes
     */
    public Collection<Groupe> getGroupes() {
        return groupes;
    }

    /**
     * @param groupes
     *            the groupes to set
     */
    public void setGroupes( Collection<Groupe> groupes ) {
        this.groupes = groupes;
    }

    public List<RoleEmployee> getRoleEmp() {
        return roleEmp;
    }

    public void setRoleEmp( List<RoleEmployee> roleEmp ) {
        this.roleEmp = roleEmp;
    }

    public boolean isActived() {
        return actived;
    }

    public void setActived( boolean actived ) {
        this.actived = actived;
    }

}
