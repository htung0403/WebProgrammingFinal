package entity;

import jakarta.persistence.*;

import java.time.Instant;
import java.time.LocalDateTime;

@Entity
@Table(name = "coffee_bag", schema = "coffeeshop")
public class CoffeeBag {
    @Id
    @Column(name = "productId", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "productId", nullable = false)
    private Product product;

    @Column(name = "origin", length = 100)
    private String origin;

    @Column(name = "expirationDate")
    private LocalDateTime expirationDate;

    @Column(name = "productionDate")
    private LocalDateTime productionDate;

    public CoffeeBag(Product product, String origin, LocalDateTime expirationDate, LocalDateTime productionDate) {
        this.product = product;
        this.origin = origin;
        this.expirationDate = expirationDate;
        this.productionDate = productionDate;
    }

    public CoffeeBag() {

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

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public LocalDateTime getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDateTime expirationDate) {
        this.expirationDate = expirationDate;
    }

    public LocalDateTime getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(LocalDateTime productionDate) {
        this.productionDate = productionDate;
    }

}