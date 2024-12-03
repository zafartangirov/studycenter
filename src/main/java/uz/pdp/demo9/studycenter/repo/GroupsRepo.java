package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo9.studycenter.Groups;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class GroupsRepo {

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
}
