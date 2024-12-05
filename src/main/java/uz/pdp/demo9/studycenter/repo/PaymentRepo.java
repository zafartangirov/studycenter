package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.demo9.studycenter.Payment;
import uz.pdp.demo9.studycenter.Student;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class PaymentRepo extends BaseRepo<Payment>{
    public static List<Payment> getAllPayments() {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Payment ", Payment.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Payment> getStudentsAndPayments(int id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
           return entityManager.createNativeQuery("select p.* from payment p join student s on p.student_id = s.id where s.groups_id = %d".formatted(id), Payment.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Payment> getPaymentsList(int id, int pagejon, String search) {
        pagejon--;
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectTFromTodoT = entityManager.createNativeQuery("select p.* from payment p join student s on p.student_id = s.id where s.fullname ilike '%'|| :search ||'%' and s.groups_id = :groupsId limit 10 offset :off", Payment.class)
                    .setParameter("off", pagejon * 10)
                    .setParameter("search", search)
                    .setParameter("groupsId", id);

            return selectTFromTodoT.getResultList();
        }
    }

    public static long count(String search, int id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectTFromTodoT = entityManager.createNativeQuery("select count(p.*) from payment p join student s on p.student_id = s.id where s.fullname ilike '%'|| :search ||'%' and s.groups_id = :groupsId", Long.class)
                    .setParameter("search", search)
                    .setParameter("groupsId", id);
            return (Long)selectTFromTodoT.getSingleResult();
        }
    }
}