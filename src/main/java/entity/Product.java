package entity;

import jakarta.persistence.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "product", schema = "coffeeshop")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productId", nullable = false)
    private Integer id;

    @Column(name = "productName", nullable = false)
    private String productName;

    @Column(name = "price")
    private Double price;

    @Column(name = "description")
    private String description;

    @Column(name = "imgUrl")
    private String imgUrl;

    @OneToOne(mappedBy = "product")
    private CoffeeBag coffeeBag;

    @OneToOne(mappedBy = "product")
    private Course course;

    @OneToMany(mappedBy = "product")
    private Set<LinesItem> linesItems = new LinkedHashSet<>();

    public Product(String productName, Double price, String description, String imgUrl) {
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.imgUrl = imgUrl;
    }

    public Product() {

    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public CoffeeBag getCoffeeBag() {
        return coffeeBag;
    }

    public void setCoffeeBag(CoffeeBag coffeeBag) {
        this.coffeeBag = coffeeBag;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Set<LinesItem> getLinesitems() {
        return linesItems;
    }

    public void setLinesitems(Set<LinesItem> linesItems) {
        this.linesItems = linesItems;
    }

}