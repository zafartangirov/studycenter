package uz.pdp.demo9.studycenter.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo9.studycenter.Course;
import uz.pdp.demo9.studycenter.ReportData;

import java.util.List;

import static uz.pdp.demo9.MyListener.EMF;

public class CourseRepo {
    public static List<Course> getAllCourses() {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Course", Course.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<ReportData> getReport() {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("""
                    select new uz.pdp.demo9.studycenter.ReportData(
                            c.name,
                            count(distinct s.id),
                            sum(p.amount)
                        )
                    from Course c
                    join Modules m on m.course.id = c.id
                    join Groups g on g.module.id = m.id
                    join Student s on s.groups.id = g.id
                    left join Payment p on p.student.id = s.id
                    GROUP BY c.name
                    ORDER BY c.name
                    """).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
