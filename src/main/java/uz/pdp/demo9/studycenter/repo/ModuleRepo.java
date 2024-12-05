package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.demo9.studycenter.Modules;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class ModuleRepo extends BaseRepo<Modules>{


    @SuppressWarnings("all")
    public static List<Modules> getModulesById(Integer id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createNativeQuery("""
                    select * from modules m where m.course_id = %d group by m.id
                    """.formatted(id), Modules.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @SuppressWarnings("all")
    public static List<Modules> getAllModules(){
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createNativeQuery("""
                    select * from modules
                    """, Modules.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Modules> getModulesList(Integer id, int pagejon, String search) {
        pagejon--;
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectTFromTodoT = entityManager.createNativeQuery("select * from modules where name ilike '%'|| :search ||'%' and course_id = :courseId limit 10 offset :off", Modules.class)
                    .setParameter("off", pagejon * 10)
                    .setParameter("search", search)
                    .setParameter("courseId", id);

            return selectTFromTodoT.getResultList();
        }
    }

    public static long count(String search, Integer id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectTFromTodoT = entityManager.createNativeQuery("select count(*) from modules where name ilike '%'|| :search ||'%' and course_id = :courseId", Long.class)
                    .setParameter("search", search)
                    .setParameter("courseId", id);
            return (Long)selectTFromTodoT.getSingleResult();
        }
    }
}
