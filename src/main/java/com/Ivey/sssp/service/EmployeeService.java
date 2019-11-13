package com.Ivey.sssp.service;

import com.Ivey.sssp.entity.Employee;
import com.Ivey.sssp.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Transactional(readOnly = true)
    public Page<Employee> getPage(int pageNo, int pageSize) {
        PageRequest pageRequest = new PageRequest(pageNo - 1, pageSize);
        return employeeRepository.findAll(pageRequest);
    }

    @Transactional(readOnly = true)
    public Employee getByLastName(String lastName) {
        return employeeRepository.getByLastName(lastName);
    }

    @Transactional
    public void save(Employee employee) {
        employee.setCreateDate(new Date());
        employeeRepository.saveAndFlush(employee);
    }
}
