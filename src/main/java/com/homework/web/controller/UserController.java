package com.homework.web.controller;

import com.homework.web.model.User;
import com.homework.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers(@RequestParam(required = false) Integer page, Model model) {
        List<User> userList = userService.listUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(userList);
        pagedListHolder.setPage(5);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());
        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;
        model.addAttribute("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            model.addAttribute("listUsers", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            model.addAttribute("listUsers", pagedListHolder.getPageList());
        }
        model.addAttribute("user", new User());
        return "users";
    }

    @RequestMapping(value = "users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        userService.addUser(user);
        return "redirect:/users";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "userdata.edit", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") User user, BindingResult result , Model model) {
        userService.editUser(user);
        return "userdata";
    }

    @RequestMapping("/userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping("user.search")
    public String searchUser(@ModelAttribute User user, Model model) {
        User searchedUser = userService.getUserById(user.getId());
        if (searchedUser.getId() == 0) {

            return "redirect:/users";
        } else {
            model.addAttribute("user", searchedUser);
            return "userdata";
        }
    }
}
