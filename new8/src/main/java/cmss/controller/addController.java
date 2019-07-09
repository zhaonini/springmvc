package cmss.controller;

import cmss.dao.DepartmentDao;
import cmss.dao.EmployeeDao;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import cmss.dao.studentdao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import cmss.model.Department;
import cmss.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


@Path("add")
public class addController {
    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private DepartmentDao departmentDao;
    @GET
    @Produces(MediaType.TEXT_HTML)
    public String sayHtmlHello() {
        //employeeDao.save(new Employee(1001, "E-AA", "aa@163.com", 1, new Department(101, "D-AA")));
        employeeDao.getAll();
        return "<html> " + "<title>" + "Hello Jersey" + "</title>"+ "<body><h1>" + "add success" + "</body></h1>" + "</html> ";
    }
}