package testproject.service;

import testproject.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
/**
 *  интерфейс для UserServiceImpl
 */
public interface UserService extends UserDetailsService {
    User saveUser(User user);
    List<User> getAllUsers();
    User getUserById(long id);
    User updateUser(User user, long id);
    void deleteUser(long id);

    UserDetailsService userDetailsService();
}