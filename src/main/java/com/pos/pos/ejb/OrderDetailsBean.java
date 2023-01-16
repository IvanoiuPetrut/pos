package com.pos.pos.ejb;

import com.pos.pos.common.OrderDetailsDto;
import com.pos.pos.common.UserDto;
import com.pos.pos.entities.OrderDetails;
import com.pos.pos.entities.User;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Stateless
public class OrderDetailsBean {
    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());
    @PersistenceContext
    EntityManager entityManager;

    private List<OrderDetailsDto> copyOrderDetailsToDto(List<OrderDetails> orderDetails) {
        return orderDetails.stream().map(u -> new OrderDetailsDto(u.getId(), u.getPaymentType(),u.isRefounded(),u.getDate(),u.getTotalPrice())).collect(Collectors.toList());
    }

    public List<OrderDetailsDto> findAllOrderDetails() {
        LOG.info("findAllOrderDetails");
        try {
            TypedQuery<OrderDetails> typedQuery = entityManager.createQuery("Select u from OrderDetails u", OrderDetails.class);
            List<OrderDetails> orderDetails = typedQuery.getResultList();
            return copyOrderDetailsToDto(orderDetails);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public void createOrderDetails(OrderDetailsDto orderDetailsDto) {
        LOG.info("createOrderDetails");
        try {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setPaymentType(orderDetailsDto.getPaymentType());
            orderDetails.setRefounded(orderDetailsDto.isRefounded());
            orderDetails.setDate(orderDetailsDto.getDate());
            orderDetails.setTotalPrice(orderDetailsDto.getTotalPrice());
            entityManager.persist(orderDetails);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
}
