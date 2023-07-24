package testproject.service;


import testproject.dao.request.SignUpRequest;
import testproject.dao.request.SigninRequest;
import testproject.dao.response.JwtAuthenticationResponse;

/**
 *  интерфейс для AuthenticationServiceImpl
 */
public interface AuthenticationService {
    JwtAuthenticationResponse signup(SignUpRequest request);

    JwtAuthenticationResponse signin(SigninRequest request);
}