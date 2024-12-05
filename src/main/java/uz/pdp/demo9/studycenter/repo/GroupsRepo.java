package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.demo9.studycenter.Course;
import uz.pdp.demo9.studycenter.Groups;
import uz.pdp.demo9.studycenter.Modules;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class GroupsRepo extends BaseRepo<Groups>{

    @SuppressWarnings("all")
    public static List<Groups> getGroupsById(Integer id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createNativeQuery("""
                    select * from groups g where g.module_id = %d 
                    """.formatted(id), Groups.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @SuppressWarnings("all")
    public static List<Groups> getAllGroups(){
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createNativeQuery("""
                    select * from groups;
                    """, Groups.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Groups> getGroupsList(int id, int pagejon, String search) {
        pagejon--;
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectTFromTodoT = entityManager.createNativeQuery("select * from groups where name ilike '%'|| :search ||'%' and module_id = :moduleId limit 10 offset :off", Groups.class)
                    .setParameter("off", pagejon * 10)
                    .setParameter("search", search)
                    .setParameter("moduleId", id);

            return selectTFromTodoT.getResultList();
        }
    }

    public static long count(String search, int id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectTFromTodoT = entityManager.createNativeQuery("select count(*) from groups where name ilike '%'|| :search ||'%' and module_id = :moduleId", Long.class)
                    .setParameter("search", search)
                    .setParameter("moduleId", id);
            return (Long)selectTFromTodoT.getSingleResult();
        }
    }
}
