package testproject.dao.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * authorization scheme
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SigninRequest {
    private String userName;
    private String password;
}
