package com.Ivey.sssp.controller;

import com.Ivey.sssp.entity.Employee;
import com.Ivey.sssp.service.DepartmentService;
import com.Ivey.sssp.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("emps")
    public String getEmps(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
                          Map<String, Object> map) {
        int pageNo = 1;

        // 校验 pageNo
        try {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        } catch (Exception e) {
        }

        Page<Employee> page = employeeService.getPage(pageNo, 5);
        map.put("page", page);
        return "emp/list";
    }

    @RequestMapping(value = "emp", method = RequestMethod.GET)
    public String insertEmp(Map<String, Object> map) {
        map.put("departments", departmentService.getAll());
        map.put("employee", new Employee());
        return "emp/input";
    }
}
