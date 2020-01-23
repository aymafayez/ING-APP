# ING-App

Task :- 

Write a mobile application that can price a basket of goods in a number of different currencies.
The application shall allow to purchase the following goods, all priced in EUR:-

- Peas - 0.95 EUR per bag
- Eggs - 2.1 EUR per dozen
- Beans - 0.73 EUR per can
- Milk - 1.4 EUR per bottle

App feature requirements:
-The app shall allow the user to add and remove items in a basket.
-The app shall allow the user to click on a checkout button that will display the total price of the users' basket.
-The app shall allow the user to display the amount in different currencies. E.g. A basket that contains a dozen eggs and the currency selected was USD, with an exchange rate of 1.08, the total would be 1.51 USD
-The list of currencies shall be consumed from http://fixer.io. Mind that the exchanges rate may change at any time. 

Feel free to design the UI in any way you see most appropriate to the solution.
You can use third party libraries that you might require as long as their use is clearly stated. 
The code and design should meet the requirements above and be sufficiently flexible for any future extensibility.
Highly appreciated if the app has integration, unit and or UI tests.
You are expected to work on this task on your own and without help of others.

ING-APP is consists of :- 

 1- AppLayer                   :- Responsible for the features at the application
 
 2- NetworkLayer (Unit tested) :- Responsible for the HTTP Requests
 
 3- APIManager                 :- Responsible for All APIS at the app 
 
 4- DTO                        :- Resposible for all APIs' request and response model 

 
 Notes :- 
 
 - The idea of the architecture is that every layer can be an external module that can be reused at the same product (Example:
   B2B applications).
   
 - Every layer should be an external module but I created the layers at the same project in order to make it easier to the
   reviewer.
 
 
1- AppLayer 
 
 - MVVM design battern is used to avoid massive controllers.
 - Routing battern is used to move the navigation responsibility from the controller to the router.
 - Dependency injection is used at view controllers, view models, and models.
 - I did not have time to write unit tests for the applayer but I used dependency injection to make it testable.
 
2- NetworkLayer (Unit tested)

- Unit tests are written with full code coverage.
- It is desinged to be a simple network layer that serve the app.
- It is using protocol oriented programming and dependency injection therfore it is tesable.
- It can be extendable using open closed principle, for example : interceptors can be added easily to intercept both request and response.

3- APIManager

- Generics are used to give the api the request and the response during the initialization.
- BaseAPI is used to implement the shared functions and properties between all apis like base url and access key.
- Every api will inherit base layer should provide its url and http method.

4- DTO

- It contains all requests and responses DTOs that confirms to the Encodable and Decodable protocol. 
