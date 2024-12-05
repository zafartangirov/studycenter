package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.demo9.studycenter.Groups;
import uz.pdp.demo9.studycenter.Student;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class StudentRepo extends BaseRepo<Student>{
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

    public static List<Student> getStudentsById(Integer id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createNativeQuery("""
                    select * from student s where s.groups_id = %d
                    """.formatted(id), Student.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Student> getStudentsList(int id, int pagejon, String search) {
        pagejon--;
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectTFromTodoT = entityManager.createNativeQuery("select * from student where fullname ilike '%'|| :search ||'%' and groups_id = :groupsId limit 10 offset :off", Student.class)
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
            Query selectTFromTodoT = entityManager.createNativeQuery("select count(*) from student where fullname ilike '%'|| :search ||'%' and groups_id = :groupsId", Long.class)
                    .setParameter("search", search)
                    .setParameter("groupsId", id);
            return (Long)selectTFromTodoT.getSingleResult();
        }
    }
}
