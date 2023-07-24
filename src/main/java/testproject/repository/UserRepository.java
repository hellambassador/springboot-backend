package testproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import testproject.model.User;

import java.util.Optional;
/**
 * user repository
 */
public interface UserRepository extends JpaRepository<User, Long>{

        Optional<User> findByUsername(String userName);
}