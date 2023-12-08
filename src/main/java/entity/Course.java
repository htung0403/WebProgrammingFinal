package entity;

import jakarta.persistence.*;

import java.time.Instant;
import java.time.LocalDateTime;

@Entity
@Table(name = "course", schema = "coffeeshop")
public class Course {
    @Id
    @Column(name = "productId", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "productId", nullable = false)
    private Product product;

    @Column(name = "lecturesName")
    private String lecturesName;

    @Column(name = "completionTime")
    private LocalDateTime completionTime;

    public Course(Product product, String lecturesName, LocalDateTime completionTime) {
        this.product = product;
        this.lecturesName = lecturesName;
        this.completionTime = completionTime;
    }

    public Course() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getLecturesName() {
        return lecturesName;
    }

    public void setLecturesName(String lecturesName) {
        this.lecturesName = lecturesName;
    }

    public LocalDateTime getCompletionTime() {
        return completionTime;
    }

    public void setCompletionTime(LocalDateTime completionTime) {
        this.completionTime = completionTime;
    }

}