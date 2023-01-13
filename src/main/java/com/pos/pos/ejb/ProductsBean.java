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
}
