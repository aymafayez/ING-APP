# ING-App

ING-APP is consists of :- 

 1- AppLayer                   :- Responsible for the features at the application
 
 2- NetworkLayer (Unit tested) :- Responsible for the HTTP Requests
 
 3- APIManager                 :- Responsible for All APIS at the app 
 
 4- DTO                        :- Resposible for all APIs' request and response model 

 
 (The idea of the architecture is that every layer can be an external module that can be reused at the same product (Example: B2B applications))
 (Every layer should be an external module but I created the layers at the same project in order to make it easier to the reviewer)
 
 
1- AppLayer 
 
 - MVVM design battern is used to avoid massive controllers.
 - Routing battern is used to move the navigation responsibility from the controller to the router.
 - Dependency injection is used at view controllers, view models, and models.
 - I did not have time to write unit tests for the applayer but I used dependency injection to make it testable.
 
2- NetworkLayer

- Unit tests are written with full code coverage.
- It is desinged to be a simple network layer that serve the app.
- It is using protocol oriented programming and dependency injection therfore it is tesable.
- It can be extendable using open closed principle, for example : interceptors can be added easily to intercept both request and response.

3- APIManager

- Generics are used to give the api the request and the response during the initialization.
- BaseAPI is used to implement the shared functions and properties between all apis like base url and access key.
- every api will inherit base layer should provide its url and http method.

4- DTO

- contains all requests and responses DTOs that confirms to the Encodable and Decodable protocol 
