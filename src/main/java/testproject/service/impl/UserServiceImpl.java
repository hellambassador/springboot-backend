package testproject.service.impl;

import testproject.exception.ResourceNotFoundException;
import testproject.model.User;
import testproject.repository.UserRepository;
import testproject.service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
/**
 * service for working with comments
 */
@Service
public class UserServiceImpl implements UserService {


    private UserRepository userRepository;
    /**
     * constructor
     */
    public UserServiceImpl(UserRepository userRepository) {
        super();
        this.userRepository = userRepository;
    }
    /**
     * saving the user
     * @param user what we save
     * @return user
     */
    @Override
    public User saveUser(User user) {
        return userRepository.save(user);
    }
    /**
     * get all users
     * @return list of users
     */
    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    /**
     * get user by id
     * @param id user id
     * @return user
     */
    @Override
    public User getUserById(long id) {
        return userRepository.findById(id).orElseThrow(() ->
                new ResourceNotFoundException("User", "Id", id));

    }
    /**
     * changing user information
     * @param user what to change
     * @param id user id
     * @return changed news
     */
    @Override
    public User updateUser(User user, long id) {

         User existingUser = userRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("User", "Id", id));

        existingUser.setName(user.getName());
        existingUser.setParentName(user.getParentName());
        existingUser.setSurname(user.getSurname());
        existingUser.setLastEditDate(Date.valueOf(LocalDate.now()));
        userRepository.save(existingUser);
        return existingUser;
    }
    /**
     * deleting a user
     * @param id user id
     */
    @Override
    public void deleteUser(long id) {

        // check whether a user exist in a DB or not
        userRepository.findById(id).orElseThrow(() ->
                new ResourceNotFoundException("User", "Id", id));
        userRepository.deleteById(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }

    @Bean
    @Override
    public UserDetailsService userDetailsService() {

        return new CustomUserDetailsService(userRepository);
    }

}
