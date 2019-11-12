package com.Ivey.sssp.test;

import com.Ivey.sssp.entity.Department;
import com.Ivey.sssp.repository.DepartmentRepository;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class SSSPTest {

    private ApplicationContext ctx;
    private DepartmentRepository departmentRepository;

    {
        ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        departmentRepository = ctx.getBean(DepartmentRepository.class);
    }

    @Test
    public void test() {
        System.out.println("----------------------");
        List<Department> departments = departmentRepository.getAll();
        departments = departmentRepository.getAll();
        System.out.println("----------------------");
    }
}
