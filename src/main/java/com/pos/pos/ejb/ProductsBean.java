package com.pos.pos.ejb;

import com.pos.pos.common.ProductDto;
import com.pos.pos.entities.Product;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Stateless
public class ProductsBean {
    private static final Logger LOG = Logger.getLogger(ProductsBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;

    private List<ProductDto> copyProductsToDto(List<Product> products) {
        return products.stream().map(p -> new ProductDto(p.getBarCode(), p.getName(), p.getPrice(), p.getStock(), p.getDescription(), p.getType())).collect(Collectors.toList());
    }
    public List<ProductDto> findAllProducts() {
        LOG.info("findAllProducts");
        try {
            TypedQuery<Product> typedQuery = entityManager.createQuery("Select p from Product p", Product.class);
            List<Product> products = typedQuery.getResultList();
            return copyProductsToDto(products);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public void createProduct(ProductDto productDto) {
        LOG.info("createProduct");
        try {
            Product product = new Product();
            product.setBarCode(productDto.getBarCode());
            product.setName(productDto.getName());
            product.setPrice(productDto.getPrice());
            product.setStock(productDto.getStock());
            product.setDescription(productDto.getDescription());
            product.setType(productDto.getType());
            entityManager.persist(product);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public ProductDto findProductByBarCode(Long barCode) {
        LOG.info("findProductByBarCode");
        try {
            Product product = entityManager.find(Product.class, barCode); // find by primary key (barCode)
            return new ProductDto(product.getBarCode(), product.getName(), product.getPrice(), product.getStock(), product.getDescription(), product.getType());
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public void updateProduct(ProductDto productDto) {
        LOG.info("updateProduct");
        try {
            Product product = entityManager.find(Product.class, productDto.getBarCode()); // find by primary key (barCode)
            product.setName(productDto.getName());
            product.setPrice(productDto.getPrice());
            product.setStock(productDto.getStock());
            product.setDescription(productDto.getDescription());
            product.setType(productDto.getType());
            entityManager.merge(product);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
}
