# E-Commerce Application Development TODO

## Backend Enhancements (Spring Boot)
- [x] Update entities: Add User, Role, Cart, CartItem entities with proper relationships
- [x] Add JWT authentication: Configure Spring Security with JWT, remove Okta dependency
- [x] Update repositories: Add UserRepository, RoleRepository, CartRepository, CartItemRepository
- [x] Create controllers: AuthController (register, login), CartController
- [x] Update services: Add UserService, CartService, enhance CheckoutService
- [x] Add DTOs: UserRegistrationDto, LoginDto, JwtResponseDto
- [x] Implement global exception handling
- [x] Add input validation
- [x] Configure Swagger for API documentation
- [x] Update SecurityConfig for JWT and role-based access
- [x] Create database schema scripts (schema.sql) for MySQL tables: users, roles, products, categories, cart, cart_items, orders, order_items
- [x] Update application.properties for JWT secrets, etc.

## Frontend Creation (Angular)
- [ ] Generate Angular project in frontend/ directory
- [ ] Set up routing with guards for auth
- [ ] Create modules: auth, product, cart, order
- [ ] Implement components: Login, Register, ProductList, ProductDetails, Cart, Checkout, OrderHistory
- [ ] Create services: AuthService, ProductService, CartService, OrderService
- [ ] Add models/interfaces: User, Product, Cart, Order, etc.
- [ ] Implement reactive forms with validation
- [ ] Add responsive UI (use Angular Material)
- [ ] Integrate JWT for API calls
- [ ] Handle loading states and error handling

## Integration and Testing
- [ ] Connect frontend to backend APIs
- [ ] Test full user flow: Register -> Login -> Browse Products -> Add to Cart -> Checkout -> Order History
- [ ] Add unit tests for backend and frontend
- [ ] Create Docker Compose for local development
- [ ] Update README with setup instructions

## Deployment and Production
- [ ] Configure production builds
- [ ] Add environment configs
- [ ] Implement CI/CD (optional)
