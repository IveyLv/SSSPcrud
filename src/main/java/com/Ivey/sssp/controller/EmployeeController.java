package com.Ivey.sssp.controller;

import com.Ivey.sssp.entity.Employee;
import com.Ivey.sssp.service.DepartmentService;
import com.Ivey.sssp.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(value = "ajaxValidate", method = RequestMethod.POST)
    @ResponseBody
    public String validateLastName(@RequestParam(value = "lastName", required = true) String lastName) {
        Employee employee = employeeService.getByLastName(lastName);
        /*System.out.println(employee);
        System.out.println(lastName);*/
        if (employee == null) {
            return "0";
        } else {
            return "1";
        }
    }

    @RequestMapping(value = "emp", method = RequestMethod.POST)
    public String saveEmp(Employee employee) {
        employeeService.save(employee);
        return "redirect:emps";
    }

    @RequestMapping(value = "emp/{id}", method = RequestMethod.GET)
    public String toUpdate(@PathVariable("id") Integer id, Map<String, Object> map) {
        Employee employee = employeeService.getEmp(id);
        System.out.println(employee);
        map.put("employee", employee);
        map.put("departments", departmentService.getAll());
        return "emp/input";
    }

    @ModelAttribute
    public void getEmployee(@RequestParam(value = "id", required = false) Integer id, Map<String, Object> map) {
        if (id != null) {
            Employee employee = employeeService.getEmp(id);
            employee.setDepartment(null);
            map.put("employee", employee);
        }
    }

    @RequestMapping(value = "emp/{id}", method = RequestMethod.PUT)
    public String update(Employee employee) {
        System.out.println("update method...");
        employeeService.save(employee);
        return "redirect:/emps";
    }

    @RequestMapping(value = "emp/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id) {
        employeeService.delete(id);
        return "redirect:/emps";
    }
}
