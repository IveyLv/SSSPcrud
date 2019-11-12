package com.Ivey.sssp.entity;

import javax.persistence.*;

@Cacheable
@Entity
@Table(name = "tb_department")
public class Department {

    private Integer id;
    private String deptName;

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }
}
