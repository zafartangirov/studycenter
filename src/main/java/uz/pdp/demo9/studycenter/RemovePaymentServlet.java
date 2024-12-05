package uz.pdp.demo9.studycenter;

import uz.pdp.demo9.studycenter.repo.PaymentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/payment/remove")
public class RemovePaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer paymentId = Integer.parseInt(req.getParameter("paymentId"));
        int groupId = Integer.parseInt(req.getParameter("groupId"));
        PaymentRepo paymentRepo = new PaymentRepo();
        Payment payment = new Payment();
        paymentRepo.remove(payment, paymentId);
        resp.sendRedirect("/Payment.jsp?groupId=" + groupId);
    }
}
