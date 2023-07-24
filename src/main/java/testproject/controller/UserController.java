package testproject.controller;


import testproject.model.User;
import testproject.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
/**
 * controller responsible for user interaction
 */
@RestController
@RequestMapping("/api/users")
public class UserController {

    private UserService userService;
    /**
     * constructor
     */
    public UserController(UserService userService) {
        super();
        this.userService = userService;
    }
    /**
     * adding a user
     * @param user who to add
     * @return information about whether it turned out or not
     */
    @PostMapping()
    public ResponseEntity<User> saveUser(@RequestBody User user) {
        return new ResponseEntity<User>(userService.saveUser(user), HttpStatus.CREATED);
    }

    /**
     * get all the news
     * @return all users
     */
    // build get all users REST API
    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    /**
     * user-specific information
     * @param userId user id
     * @return user
     */
    @GetMapping("{id}")
    public ResponseEntity<User> getUserById(@PathVariable("id") long userId) {
        return new ResponseEntity<User>(userService.getUserById(userId), HttpStatus.OK);
    }

    /**
     * user change
     * @param id user id
     * @param user what to replace user information with
     * @return information about whether it turned out or not
     */
    @PutMapping("{id}")
    public ResponseEntity<User> updateUser(@PathVariable("id") long id
            , @RequestBody User user) {
        return new ResponseEntity<User>(userService.updateUser(user, id), HttpStatus.OK);
    }

    /**
     * deleting a user
     * @param id user id
     * @return information about whether it turned out or not
     */
    @DeleteMapping("{id}")
    public ResponseEntity<String> deleteUser(@PathVariable("id") long id) {

        userService.deleteUser(id);

        return new ResponseEntity<String>("User deleted successfully!.", HttpStatus.OK);
    }
}