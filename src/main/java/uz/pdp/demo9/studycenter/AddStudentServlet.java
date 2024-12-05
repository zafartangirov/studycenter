package uz.pdp.demo9.studycenter;

import uz.pdp.demo9.studycenter.repo.BaseRepo;
import uz.pdp.demo9.studycenter.repo.GroupsRepo;
import uz.pdp.demo9.studycenter.repo.StudentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/student/add")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer groupId = Integer.parseInt(req.getParameter("groupId"));
        String fullName = req.getParameter("fullName");
        StudentRepo studentRepo = new StudentRepo();
        GroupsRepo groupsRepo = new GroupsRepo();
        Groups groups = groupsRepo.findAll().stream().filter(item -> item.getId().equals(groupId)).findFirst().orElseThrow();
        Student student = new Student(
                null,
                fullName,
                groups
        );
        studentRepo.save(student);
        resp.sendRedirect("/Student.jsp?groupId=" + groupId);
    }
}
