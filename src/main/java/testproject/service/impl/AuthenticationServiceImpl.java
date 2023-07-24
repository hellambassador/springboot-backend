package testproject.service.impl;

import testproject.dao.request.SignUpRequest;
import testproject.dao.request.SigninRequest;
import testproject.dao.response.JwtAuthenticationResponse;
import testproject.repository.UserRepository;
import testproject.service.AuthenticationService;
import testproject.service.JwtService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import testproject.model.User;

import lombok.RequiredArgsConstructor;

import java.nio.charset.Charset;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Random;

/**
 * service for authorization and registration
 */
@Service
@RequiredArgsConstructor
public class AuthenticationServiceImpl implements AuthenticationService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    /**
     * user registration in the database
     * @param request user information
     * @return token
     */
    @Override
    public JwtAuthenticationResponse signup(SignUpRequest request) {
        var user = new User();
        // создание пароля
        byte[] password = new byte[40];
        new Random().nextBytes(password);
        user.setPassword(new String(password, Charset.forName("UTF-8")) );
        user.setName(request.getName());
        user.setSurname(request.getSurname());
        user.setUsername(request.getUserName());
        user.setParentName(request.getParentName());
        user.setRole(request.getRole());
        user.setCreationDate(Date.valueOf(LocalDate.now()));
        user.setLastEditDate(Date.valueOf(LocalDate.now()));
        userRepository.save(user);
        // сделаем вид, что
        //пароль отправляется куда-то там в стороннюю систему
        var jwt = jwtService.generateToken(user);
        return JwtAuthenticationResponse.builder().token(jwt).build();
    }
    /**
     * user registration in the database
     * @param request user information
     * @return token
     */
    @Override
    public JwtAuthenticationResponse signin(SigninRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUserName(), request.getPassword()));
        var user = userRepository.findByUsername(request.getUserName())
                .orElseThrow(() -> new IllegalArgumentException("Invalid getUserName or password."));
        var jwt = jwtService.generateToken(user);
        return JwtAuthenticationResponse.builder().token(jwt).build();
    }
}
