package uz.pdp.test.jenkins.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.test.jenkins.enums.Roles;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthUser {
    private Long id;
    private String username;
    private String password;
    private Roles roles;
}
