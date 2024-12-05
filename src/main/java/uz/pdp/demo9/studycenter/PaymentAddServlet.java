package uz.pdp.demo9.studycenter;


import uz.pdp.demo9.studycenter.repo.GroupsRepo;
import uz.pdp.demo9.studycenter.repo.PaymentRepo;
import uz.pdp.demo9.studycenter.repo.StudentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/add/payment")
public class PaymentAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int groupId = Integer.parseInt(req.getParameter("groupId"));
        Integer studentId = Integer.parseInt(req.getParameter("studentId"));
        Long amount = Long.parseLong(req.getParameter("amount"));
        PaymentRepo paymentRepo = new PaymentRepo();
        Student student = StudentRepo.getAllStudents().stream().filter(item -> item.getId().equals(studentId)).findFirst().orElseThrow();
        Payment payment = new Payment(
                null,
                amount,
                student
        );
        paymentRepo.save(payment);
        resp.sendRedirect("/Payment.jsp?groupId=" + groupId);
    }
}
