package database;

import entity.CoffeeBag;
import entity.Course;
import entity.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.time.LocalDateTime;
import java.util.List;

public class ProductDB {

    static EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
    public static void addProduct(String productName, Double price, String description, String imgUrl) {
        EntityManager em = emf.createEntityManager();
        Product product = new Product(productName, price, description, imgUrl);
        em.getTransaction().begin();
        em.persist(product);
        em.getTransaction().commit();
        em.close();
    }

    public static void addCoffeeBag(Product product, String origin, LocalDateTime expirationDate, LocalDateTime productionDate){
        EntityManager em = emf.createEntityManager();
        CoffeeBag coffeeBag = new CoffeeBag(product, origin, expirationDate, productionDate);
        em.getTransaction().begin();
        em.persist(coffeeBag);
        em.getTransaction().commit();
        em.close();
    }

    public static void addCoffeeBag(String productName, Double price, String description, String imgUrl, String origin, LocalDateTime expirationDate, LocalDateTime productionDate){
        Product product = new Product(productName, price, description, imgUrl);
        ProductDB.addCoffeeBag(product, origin, expirationDate, productionDate);
    }

    public static void addCourse(Product product, String lecturesName, LocalDateTime completionTime){
        EntityManager em = emf.createEntityManager();
        Course course = new Course(product, lecturesName, completionTime);
        em.getTransaction().begin();
        em.persist(course);
        em.getTransaction().commit();
        em.close();
    }

    public static void addCourse(String productName, Double price, String description, String imgUrl, String lecturesName, LocalDateTime completionTime){
        Product product = new Product(productName, price, description, imgUrl);
        ProductDB.addCourse(product, lecturesName, completionTime);
    }
    public static List<Product> getAllProducts() {
        EntityManager em = emf.createEntityManager();
        TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p", Product.class);
        return query.getResultList();
    }

    public static List<Course> getCourseDetails() {
        EntityManager em = emf.createEntityManager();
        TypedQuery<Course> query = em.createQuery(
                "SELECT c " +
                        "FROM Course c JOIN FETCH c.product", Course.class);
        List<Course> courseDetails = query.getResultList();
        em.close();
        return courseDetails;
    }
    public static Product getProductById(Integer id) {
        EntityManager em = emf.createEntityManager();
        return em.find(Product.class, id);
    }

    public static void updateProduct(String productName, Double price, String description, String imgUrl, Integer id) {
        EntityManager em = emf.createEntityManager();
        Product product = em.find(Product.class, id);
        if(productName == null || productName.isEmpty())
            productName = product.getProductName();
        if(price == null)
            price = product.getPrice();
        if(description == null || description.isEmpty())
            description = product.getDescription();
        if(imgUrl == null || imgUrl.equals(""))
            imgUrl = product.getImgUrl();
        product.setProductName(productName);
        product.setPrice(price);
        product.setDescription(description);
        product.setImgUrl(imgUrl);
        em.getTransaction().begin();
        em.persist(product);
        em.getTransaction().commit();
        em.close();
    }

    public static void deleteProduct(Integer id) {
        EntityManager em = emf.createEntityManager();
        Product product = em.find(Product.class, id);
        CoffeeBag coffeeBag = em.find(CoffeeBag.class, id);
        Course course = em.find(Course.class, id);
        em.getTransaction().begin();
        if (coffeeBag != null) {
            em.remove(coffeeBag);
        }
        if (course != null) {
            em.remove(course);
        }
        if (product != null) {
            em.remove(product);
        }
        em.getTransaction().commit();
        em.close();
    }
    public static void close(){
        emf.close();
    }
}
