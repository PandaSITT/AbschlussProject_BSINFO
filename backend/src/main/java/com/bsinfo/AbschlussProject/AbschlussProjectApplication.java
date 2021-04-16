package com.bsinfo.AbschlussProject;

import com.bsinfo.AbschlussProject.entities.UserEntiye;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@SpringBootApplication
@RestController
public class AbschlussProjectApplication {
    private HibernateHelper hibernate;

    @Inject
    public AbschlussProjectApplication(HibernateHelper hibernate) {
        this.hibernate = hibernate;
    }

    @CrossOrigin
    @PostMapping("/users")
    public void createUser(@RequestBody UserEntiye user) {
        hibernate.saveEntity(user);
    }
/*
    @CrossOrigin
    @GetMapping("/users")
    public UserEntiye getUser(@RequestBody String benutzerName) {
        return (UserEntiye) hibernate.getEntity(benutzerName, UserEntiye.class);
    }
*/
    @CrossOrigin
    @GetMapping("/users ")
    public List<UserEntiye> getUsers() {
        return (List<UserEntiye>) hibernate.getAllEntities(UserEntiye.class);
    }

    public static void main(String[] args) {

        SpringApplication.run(AbschlussProjectApplication.class, args);
    }

}


