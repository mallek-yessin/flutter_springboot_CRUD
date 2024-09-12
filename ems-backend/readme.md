# pre-requi

on met dans application.properties :<br>
```
spring.application.name=ems_backend
spring.datasource.url=jdbc:postgresql://localhost:5432/ems
spring.datasource.username=postgres
spring.datasource.password=1234
spring.jpa.hibernate.ddl-auto=update
```


et le nom de la base dans postgress est <b>ems</b>


# Annotations 
### Exemple d'Utilisation de `@Repository` en Spring Boot
Class Level Annotation  
It can reach the database and do all the operations.  
It make the connection between the database and the business logic.  
DAO is a repository.  
It is a marker interface.  
```java
@Repository
public class TestRepo{
   public void add(){
      System.out.println("Added");
   }
}
```

### Exemple d'Utilisation de `@Service` en Spring Boot
Class Level Annotation    
It is a marker interface.  
It is a business logic.  
It is a service layer.  
It used to create a service layer.  
```java
@Service
public class TestService{
   public void service1(){
      //business code (iş kodları)
   }
}
```


### Exemple d'Utilisation de `@Autowired` en Spring Boot
Field Level Annotation  
It is used to inject the dependency.  
It is used to inject the object.  
It is used to inject the object reference.  
Dependency Injection is a design pattern.
```java
public class Brand{
   private int id;
   private String name;

   @Autowired
   public Brand(int id, String name){
     this.id = id;
     this.name = name;
   }
}
```



### Exemple d'Utilisation de `@Controller` en Spring Boot
Class Level Annotation    
It is a marker interface.  
It is a controller layer.  
It is used to create a controller layer.  
It use with @RequestMapping annotation.
```java
@Controller
@RequestMapping("/api/brands")
public class BrandsController{
   @GetMapping("/getall")
   public Employee getAll(){
       return brandService.getAll();
   }
}
```


### Exemple d'Utilisation de `@RequestMapping` en Spring Boot
Method Level Annotation  
It is used to map the HTTP request with specific method.
```java
@Controller
@RequestMapping("/api/brands")
public class BrandsController{
   @GetMapping("/getall")
   public Employee getAll(){
       return brandService.getAll();
   }
}
```



### Exemple d'Utilisation de `@GetMapping` en Spring Boot
Method Level Annotation  
It is used to map the HTTP GET request with specific method.  
It is used to get the data.  
It is used to read the data.
```java
  @GetMapping("/getall")
  public Employee getAll(){
      return brandService.getAll();
  }
```

  ### Exemple d'Utilisation de `@PostMapping` en Spring Boot
Method Level Annotation  
It is used to map the HTTP POST request with specific method.  
It is used to add the data.  
It is used to create the data.
```java
  @PostMapping("/add")
  public void add(@RequestBody Brand brand){
      brandService.add(brand);
  }
  ```



  ### Exemple d'Utilisation de `@PutMapping` en Spring Boot
Method Level Annotation  
It is used to map the HTTP PUT request with specific method.  
It is used to update the data.
```java
  @PutMapping("/update")
  public void update(@RequestBody Brand brand){
      brandService.update(brand);
  }
  ```


  ### Exemple d'Utilisation de `@DeleteMapping` en Spring Boot
Method Level Annotation   
It is used to map the HTTP DELETE request with specific method.  
It is used to delete the data.
```java
  @DeleteMapping("/delete")
  public void delete(@RequestBody Brand brand){
      brandService.delete(brand);
  }
```


  ### Exemple d'Utilisation de `@PathVariable` en Spring Boot
Method Level Annotation  
It is used to get the data from the URL.  
It is the most suitable for RESTful web service that contains a path variable.
```java
  @GetMapping("/getbyid/{id}")
  public Brand getById(@PathVariable int id){
      return brandService.getById(id);
  }
  ```


  ### Exemple d'Utilisation de `@RequestBody` en Spring Boot
It is used to get the data from the request body.    
It is used to get the data from the HTTP request.  
It is used to get the data from the HTTP request body.
```java
  @PostMapping("/add")
  public void add(@RequestBody Brand brand){
      brandService.add(brand);
  }
```









### Exemple d'Utilisation de `@RequestParam` en Spring Boot

Voici un exemple complet de l'utilisation de `@RequestParam` dans un contrôleur Spring Boot pour gérer les paramètres de requête HTTP.

```java
package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

    @GetMapping("/greet")
    public String greet(
            @RequestParam(value = "name", defaultValue = "World") String name,
            @RequestParam(value = "age", required = false) Integer age) {

        String greetingMessage = "Hello, " + name;
        
        if (age != null) {
            greetingMessage += "! You are " + age + " years old.";
        } else {
            greetingMessage += "!";
        }
        
        return greetingMessage;
    }
}
```

### Exemple d'Utilisation de `@RestController` en Spring Boot
Class Level Annotation  
It is a marker interface.  
It is a controller layer.  
It is used to create a controller layer.  
It use with @RequestMapping annotation.  
It is a combination of @Controller and @ResponseBody annotations.  
@RestController annotation is explained with @ResponseBody annotation.  
@ResponseBody eliminates the need to add a comment to every method.
```java
@RestController
@RequestMapping("/api/brands")
public class BrandsController{
   @GetMapping("/getall")
   public Employee getAll(){
       return brandService.getAll();
   }
}
```


