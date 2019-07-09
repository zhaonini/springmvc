package cmss.controller;

import cmss.dao.DepartmentDao;
import cmss.dao.EmployeeDao;
import cmss.dao.studentdao;
import org.springframework.beans.factory.annotation.Autowired;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("del")
public class deletecontroller {
    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private DepartmentDao departmentDao;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String sayHello(){
        return "Hello,I am text!";
    }
    @POST
    @Produces(MediaType.TEXT_XML)
    public String sayXMLHello() {
        return "<?xml version=\"1.0\"?>" + "<hello> Hello,I am xml!" + "</hello>";
    }

    @GET
    @Produces(MediaType.TEXT_HTML)
    public String sayHtmlHello() {
        employeeDao.delete(1001);
        System.out.print(employeeDao.getAll());
        return "<html> " + "<title>" + "Hello Jersey" + "</title>"
                + "<body><h1>" + "del success" + "</body></h1>" + "</html> ";
    }
}
