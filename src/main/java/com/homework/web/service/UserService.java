package com.homework.web.service;

import com.homework.web.model.User;

import java.util.List;

public interface UserService {
    void addUser(User user);
    void editUser(User user);
    void removeUser(int id);
    User getUserById(int id);
    List<User> listUsers();
}
