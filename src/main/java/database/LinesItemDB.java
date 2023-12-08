package database;
import entity.LinesItem;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class LinesItemDB {
    public static void insert(LinesItem lineItem) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em3 = emf.createEntityManager();
        EntityTransaction trans = em3.getTransaction();
        trans.begin();
        try {
            em3.persist(lineItem);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em3.close();
        }
    }
}

