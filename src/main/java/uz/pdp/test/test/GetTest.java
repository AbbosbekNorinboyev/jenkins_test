package uz.pdp.test.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GetTest {
    @GetMapping
    public String getMapping() {
        return "Hello World From Docker";
    }
}
