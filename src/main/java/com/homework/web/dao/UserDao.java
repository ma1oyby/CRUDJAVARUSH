package com.homework.web.dao;

import com.homework.web.model.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);
    void editUser(User user);
    void removeUser(int id);
    User getUserById(int id);
    List<User> listUsers();
}
