package testproject.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import testproject.dao.request.SignUpRequest;
import testproject.dao.request.SigninRequest;
import testproject.service.AuthenticationService;
import testproject.dao.response.JwtAuthenticationResponse;

import lombok.RequiredArgsConstructor;
/**
 *  the controller responsible for user authorization and registration
 */
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthenticationController {


    private final AuthenticationService authenticationService;
    /**
     * user registration
     * @param request nickname and password
     * @return authorization code
     */
    @PostMapping("/signup")
    public ResponseEntity<JwtAuthenticationResponse> signup(@RequestBody SignUpRequest request) {
        return ResponseEntity.ok(authenticationService.signup(request));
    }
    /**
     * User authorization
     * @param request nickname and password
     * @return authorization code
     */
    @PostMapping("/signin")
    public ResponseEntity<JwtAuthenticationResponse> signin(@RequestBody SigninRequest request) {
        return ResponseEntity.ok(authenticationService.signin(request));
    }
}
