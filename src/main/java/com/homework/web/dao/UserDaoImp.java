package com.homework.web.dao;

import com.homework.web.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImp implements UserDao {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserDaoImp.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        sessionFactory.getCurrentSession().save(user);
        LOGGER.info("User successfully added.");
    }

    @Override
    public void editUser(User user) {
        sessionFactory.getCurrentSession().update(user);
        LOGGER.info("User successfully updated.");
    }

    @Override
    public void removeUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));

        if (user != null) {
            session.delete(user);
            LOGGER.info("User successfully removed.");
        } else LOGGER.info("User is null.");
    }

    @Override
    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, new Integer(id));
        LOGGER.info("User with id = "+id+" successfully loaded.");
        if (user == null) {
            user = (User) session.load(User.class, new Integer(id));
        }
        return user;
    }

    @Override
    public List<User> listUsers() {
        List<User> users = sessionFactory.getCurrentSession().createQuery("from User").list();
        for (User user : users) {
            LOGGER.info("User successfully loaded. User details: "+user.toString());
        }
        return users;
    }
}
