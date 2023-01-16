package com.pos.pos.ejb;

import com.pos.pos.common.ProductDto;
import com.pos.pos.common.UserDto;
import com.pos.pos.entities.Product;
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
public class UserBean {
    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());
    @PersistenceContext
    EntityManager entityManager;

    private List<UserDto> copyUsersToDto(List<User> users) {
        return users.stream().map(u -> new UserDto(u.getId(),u.getUsername(),u.getEmail(),u.getPassword(),u.getUsertype())).collect(Collectors.toList());
    }
    public List<UserDto> findAllUsers() {
        LOG.info("findAllUsers");
        try {
            TypedQuery<User> typedQuery = entityManager.createQuery("Select u from User u", User.class);
            List<User> users = typedQuery.getResultList();
            return copyUsersToDto(users);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public void createUser(UserDto userDto) {
        LOG.info("createUser");
        try {
            User user = new User();
            user.setUsername(userDto.getUsername());
            user.setEmail(userDto.getEmail());
            user.setPassword(userDto.getPassword());
            user.setUsertype(userDto.getUsertype());
            entityManager.persist(user);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public UserDto findUserById(Long userId) {
        LOG.info("findUserById");
        try {
            User user = entityManager.find(User.class, userId); // find by primary key (userId)
            return new UserDto(user.getId(), user.getUsername(), user.getEmail(), user.getPassword(), user.getUsertype());
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public void updateUser(UserDto userDto) {
        LOG.info("updateUser");
        try {
            User user = entityManager.find(User.class, userDto.getId()); // find by primary key (userId)
            user.setUsername(userDto.getUsername());
            user.setEmail(userDto.getEmail());
            user.setPassword(userDto.getPassword());
            user.setUsertype(userDto.getUsertype());
            entityManager.merge(user);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public void deleteUser(UserDto userDto) {
        LOG.info("deleteUser");
        try {
            User user = entityManager.find(User.class, userDto.getId()); // find by primary key (Id)
            entityManager.remove(user);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public UserDto findUserByUsername(String userName) {
        LOG.info("findUserByUsername");
        try {
            TypedQuery<User> typedQuery = entityManager.createQuery("Select u from User u where u.username = :username", User.class);
            typedQuery.setParameter("username", userName);
            User user = typedQuery.getSingleResult();
            return new UserDto(user.getId(), user.getUsername(), user.getEmail(), user.getPassword(), user.getUsertype());
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
}
