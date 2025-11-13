package uz.pdp.test.test.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.test.test.enums.Role;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthUser {
    private Long id;
    private String username;
    private String password;
    private Role role;
}
