package testproject.service;

import org.springframework.security.core.userdetails.UserDetails;
/**
 *  интерфейс для JwtServiceImpl
 */
public interface JwtService {
    String extractUserName(String token);

    String generateToken(UserDetails userDetails);

    boolean isTokenValid(String token, UserDetails userDetails);
}
