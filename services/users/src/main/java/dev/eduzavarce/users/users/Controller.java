package dev.eduzavarce.users.users;

import dev.eduzavarce.shared.domain.SharedDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {
    @GetMapping("/api/v1/users")
    public String getUsers() {
        SharedDto sharedDto = new SharedDto();
        return "Hello, Users!";
    }
}
