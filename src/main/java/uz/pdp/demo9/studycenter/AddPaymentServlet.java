package uz.pdp.demo9.studycenter;

import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo9.MyListener.EMF;

@WebServlet("/payment/add")

public class AddPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            int groupId = Integer.parseInt(req.getParameter("groupId"));
            Integer studentId = Integer.parseInt(req.getParameter("studentId"));
            Long amount = Long.parseLong(req.getParameter("amount"));
            Student student = entityManager.find(Student.class, studentId);
            entityManager.getTransaction().begin();
            Payment payment = new Payment(
                null,
                amount,
                student
            );
            entityManager.persist(payment);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/Payment.jsp?groupId="+groupId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
