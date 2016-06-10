package com.azeredudu.gestion.banque.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table( name = "role_employee" )
public class RoleEmployee implements Serializable {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private Long           idRole;
    private String         roleName;
    @ManyToMany( mappedBy = "roleEmp" )
    private List<Employee> employees;

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

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees( List<Employee> employees ) {
        this.employees = employees;
    }

}
