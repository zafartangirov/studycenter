package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo9.studycenter.Modules;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class ModuleRepo {


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
}
