package testproject.service.impl;

import testproject.service.JwtService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;

/**
 * service for working with the key
 */
@Service
public class JwtServiceImpl implements JwtService {
    private String jwtSigningKey = "413F4428472B4B6250655368566D5970337336763979244226452948404D6351";
    /**
     * * method to get UserName from the key
     * @param token key
     * @return username
     */
    @Override
    public String extractUserName(String token) {
        return extractClaim(token, Claims::getSubject);
    }
    /**
     * медод создания ключа
     * @param userDetails информация о пользователе
     * @return ключ
     */
    @Override
    public String generateToken(UserDetails userDetails) {
        return generateToken(new HashMap<>(), userDetails);
    }
    /**
     * key verification
     * @param userDetails user information
     * @param token key
     * @return key is suitable or not
     */
    @Override
    public boolean isTokenValid(String token, UserDetails userDetails) {
        final String userName = extractUserName(token);
        return (userName.equals(userDetails.getUsername())) && !isTokenExpired(token);
    }
    /**
     * extract requirements
     * @param claimsResolvers means of resolving claims
     * @param token key
     * @return requirements
     */
    private <T> T extractClaim(String token, Function<Claims, T> claimsResolvers) {
        final Claims claims = extractAllClaims(token);
        return claimsResolvers.apply(claims);
    }
    /**
     * key creation method
     * @param UserDetails user information
     * @param extra Claims additional requirements
     * @return key
     */
    private String generateToken(Map<String, Object> extraClaims, UserDetails userDetails) {
        return Jwts.builder().setClaims(extraClaims).setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 24))
                .signWith(getSigningKey(), SignatureAlgorithm.HS256).compact();
    }

    /**
     * checking the expired key
     * @param token key
     * @*@return key is suitable or not
     */
    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }
    /**
     * get the key expiration date
     * @param token key
     * @return date
     */
    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }
    /**
     * * extract all requirements
     * @param token key
     * @return date
     */
    private Claims extractAllClaims(String token) {
        return Jwts.parserBuilder().setSigningKey(getSigningKey()).build().parseClaimsJws(token)
                .getBody();
    }
    /**
     * getting the key
     * @return key
     */
    private Key getSigningKey() {
        byte[] keyBytes = Decoders.BASE64.decode(jwtSigningKey);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}