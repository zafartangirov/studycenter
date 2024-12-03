package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo9.studycenter.Student;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class StudentRepo {
    public static List<Student> getAllStudents() {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Student", Student.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @SuppressWarnings("all")

    public static List<Student> getStudentsAndPaymentsById(Integer id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createNativeQuery("""
                    select s.fullname, sum(p.amount) from student s join payment p on p.student_id = s.id where s.groups_id = %d group by s.fullname
                    """.formatted(id), Student.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
