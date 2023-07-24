package testproject.dao.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import testproject.model.Role;

/**
 * registration scheme
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SignUpRequest {
    private String name;
    private String surname;
    private String parentName;
    private String userName;
    private Role role;
}
