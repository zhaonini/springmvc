package cmss.dao;

import cmss.model.Student;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class studentdao {
    private static ArrayList<Student> emps = new ArrayList< Student>();
    /**
     * 初始化员工信息
     */
    static {
        emps.add( new Student(1001,"AA"));
        emps.add(new Student(1002,"BB"));
        emps.add(new Student(1003,"CC"));
        emps.add(new Student(1004,"DD"));
    }
    private static int employeeId = 1005;
    public void add(){
        emps.add( new Student(1005,"FF"));
        System.out.print(emps);
    }
    public void del(Integer id){
        emps.remove(id);
        System.out.print(emps);
    }
    public Student ser(Integer id){
        System.out.print(emps.get(id));
        return emps.get(id);
    }
}