
package cmss.controller;



import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;



import cmss.model.Employee;
import cmss.dao.EmployeeDao;
import cmss.dao.DepartmentDao;

@Controller

public class EmployeeHandler {

 /*    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String index() {
        System.out.print("hello");
        return "success";
    }*/
//主页面

    @Autowired

    private EmployeeDao employeeDao;

    @Autowired

    private DepartmentDao departmentDao;

//@InitBinder

//public void initBinder(WebDataBinder webBinder){

//	webBinder.setAllowedFields("lastName");

//}



//修改操作

    @RequestMapping(value="/emp",method=RequestMethod.PUT)

    public String update(Employee employee){

        employeeDao.save(employee);

        return "redirect:/emps";

    }

    @ModelAttribute

    public void getEmployee(@RequestParam(value="id",required=false) Integer id,
                            Map<String,Object> map){

        if(id!=null){

            map.put("employee", employeeDao.get(id));

        }
    }



//以下做的是回显的操作，也就是在list页面点击edit后可以跳转到input页面，并且回显所点击的行的数据

    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)

    public String input(@PathVariable("id") Integer id,Map<String,Object>map){

        map.put("employee", employeeDao.get(id));//键值employee必须和input页面中的modelAttribute的值一致

        map.put("departments", departmentDao.getDepartments());

        return "input";

    }
    @RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)

    public String delete(@PathVariable("id")Integer id){

        employeeDao.delete(id);

        //返回根目录下的emps

        return "redirect:/emps";

    }

    @RequestMapping(value="emp",method=RequestMethod.GET)

    public String input(Map<String,Object> map){

        map.put("departments", departmentDao.getDepartments());

        //如果以下是map.put("employee",new Employee());则添加一个空的employee，以下的写法不是空的

        map.put("employee",new Employee());

        return "input";

    }



    @RequestMapping(value="/emp",method=RequestMethod.POST)

    public String save(Employee employee){

        employeeDao.save(employee);

        return "redirect:/emps";

    }

    @RequestMapping("/emps")

    public String list(Map<String,Object> map){

        map.put("employees",employeeDao.getAll());
        System.out.print(map);
        System.out.print(employeeDao.getAll());
        return "list";

    }

}