package com.Ivey.sssp.controller;

import com.Ivey.sssp.entity.Employee;
import com.Ivey.sssp.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

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
}
