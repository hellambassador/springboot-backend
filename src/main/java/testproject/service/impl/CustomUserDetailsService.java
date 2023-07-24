package testproject.service.impl;

import testproject.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
/**
 * сервис для поиска по userNAme
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {

    private UserRepository userRepository;
    /**
     * constructor
     */
    public CustomUserDetailsService(UserRepository userRepository) {
        super();
        this.userRepository = userRepository;
    }
    /**
     * userName search
     * @param username user's nickname
     */
    @Override
    public UserDetails loadUserByUsername(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
    }
}
