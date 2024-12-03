package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo9.studycenter.Payment;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class PaymentRepo {
    public static List<Payment> getAllPayments() {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Payment ", Payment.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static List<Payment> getStudentsAndPayments(int groupId) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            String query = """
                    select s.fullname, p.*, sum(distinct p.amount)
                            from payment p
                                     join student s on p.student_id = s.id
                            where s.groups_id = %d
                            group by s.fullname, p.amount, p.id, p.student_id
            """.formatted(groupId);
            return entityManager.createNativeQuery(query,Payment.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}