# Clean Architecture MVVM Template

Este template ha sido restructurado para seguir los principios de **Clean Architecture** implementados en el proyecto `app-mobile-banking`.

## Estructura del Template

```
___FILEBASENAME___/
├── Domain/
│   ├── Entities/
│   │   └── ___FILEBASENAME___Entity.swift          # Modelos de dominio
│   ├── Repositories/
│   │   └── ___FILEBASENAME___Repository.swift      # Protocolos (contratos) del repositorio
│   └── UseCases/
│       └── ___FILEBASENAME___UseCases.swift        # Lógica de negocio
├── Data/
│   └── Repositories/
│       └── ___FILEBASENAME___RepositoryImpl.swift   # Implementación del repositorio
├── Presentation/
│   ├── ViewModels/
│   │   └── ___FILEBASENAME___ViewModel.swift       # ViewModel con @Published (MVVM + Combine)
│   ├── Factory/
│   │   └── ___FILEBASENAME___Factory.swift         # Inyección de dependencias
│   └── ___FILEBASENAME___ViewController.swift      # UIViewController
└── ___FILEBASENAME___Coordinator.swift             # Coordinador de navegación
```

## Capas de Clean Architecture

### 1. **Domain Layer** (Capa de Dominio)
- **Independiente** de frameworks y detalles de implementación
- Contiene la lógica de negocio pura
- Define contratos (protocolos) que deben ser cumplidos
- No tiene dependencias externas

**Contenido:**
- **Entities**: Modelos de datos del dominio
- **Repositories**: Protocolos que definen operaciones de acceso a datos
- **UseCases**: Clases que implementan la lógica de negocio

### 2. **Data Layer** (Capa de Datos)
- **Implementación** de los contratos definidos en Domain
- Accede a APIs externas, bases de datos, o servicios
- Transforma datos externos a entidades del dominio
- Puede usar APIs REST, GraphQL, CoreData, etc.

**Contenido:**
- **RepositoryImpl**: Implementación concreta del protocolo Repository

### 3. **Presentation Layer** (Capa de Presentación)
- **MVVM** con Combine para reactividad
- Gestiona la interfaz de usuario y estados
- Se comunica con la capa Domain a través de UseCases
- No accede directamente a la capa Data

**Contenido:**
- **ViewModel**: Lógica de presentación, propiedades `@Published`
- **ViewController**: UI components y bindeos
- **Factory**: Inyección de dependencias

## Flujo de Datos

```
ViewController → ViewModel → UseCase → Repository (Protocol)
                                          ↓
                                      RepositoryImpl → API/Database
```

## Pasos para Implementar una Feature

### 1. **Domain Layer**

**Entities** - Define el modelo de tu dominio:
```swift
struct UserEntity {
    let id: String
    let name: String
    let email: String
}
```

**Repository Protocol** - Define el contrato:
```swift
protocol UserRepository {
    func fetchUser(id: String) -> AnyPublisher<UserEntity, Error>
    func saveUser(_ user: UserEntity) -> AnyPublisher<Void, Error>
}
```

**UseCase** - Implementa la lógica de negocio:
```swift
final class FetchUserUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(userId: String) -> AnyPublisher<UserEntity, Error> {
        return repository.fetchUser(id: userId)
    }
}
```

### 2. **Data Layer**

**RepositoryImpl** - Implementa el protocolo:
```swift
final class UserRepositoryImpl: UserRepository {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchUser(id: String) -> AnyPublisher<UserEntity, Error> {
        return apiClient.get("/users/\(id)")
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
```

### 3. **Presentation Layer**

**ViewModel**:
```swift
final class UserViewModel: ObservableObject {
    @Published var user: UserEntity?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let fetchUserUseCase: FetchUserUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchUserUseCase: FetchUserUseCase) {
        self.fetchUserUseCase = fetchUserUseCase
    }
    
    func loadUser(id: String) {
        isLoading = true
        fetchUserUseCase.execute(userId: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &cancellables)
    }
}
```

**Factory** - Inyecta todas las dependencias:
```swift
struct UserFactory {
    static func makeUserViewController() -> UserViewController {
        // Data Layer
        let apiClient = APIClient()
        let repository = UserRepositoryImpl(apiClient: apiClient)
        
        // Domain Layer
        let useCase = FetchUserUseCase(repository: repository)
        
        // Presentation Layer
        let viewModel = UserViewModel(fetchUserUseCase: useCase)
        let viewController = UserViewController(viewModel: viewModel)
        
        return viewController
    }
}
```

## Ventajas de Clean Architecture

✅ **Separación de responsabilidades**: Cada capa tiene un propósito claro
✅ **Testeable**: Lógica de negocio independiente de frameworks
✅ **Mantenible**: Cambios en una capa no afectan otras capas
✅ **Reutilizable**: UseCases pueden usarse en diferentes contextos
✅ **Escalable**: Fácil de extender con nuevas features

## Patrones Utilizados

- **Dependency Injection**: Las dependencias se inyectan en constructores
- **Repository Pattern**: Abstracción del acceso a datos
- **UseCase Pattern**: Encapsulación de la lógica de negocio
- **MVVM + Combine**: Reactividad en la presentación
- **Factory Pattern**: Creación centralizada de objetos con sus dependencias

## Referencia de Archivos

El template genera los siguientes archivos para cada nueva scene:

| Archivo | Propósito |
|---------|-----------|
| `___FILEBASENAME___Entity.swift` | Modelo de dominio |
| `___FILEBASENAME___Repository.swift` | Protocolo del repositorio (Domain) |
| `___FILEBASENAME___RepositoryImpl.swift` | Implementación del repositorio |
| `___FILEBASENAME___UseCases.swift` | Casos de uso con lógica de negocio |
| `___FILEBASENAME___ViewModel.swift` | Lógica de presentación |
| `___FILEBASENAME___ViewController.swift` | Vista y controles |
| `___FILEBASENAME___Factory.swift` | Inyección de dependencias |
| `___FILEBASENAME___Coordinator.swift` | Coordinación de navegación |

## Tips de Implementación

1. **Siempre empieza por Domain Layer**: Define tus entidades y contratos primero
2. **Usa Combine PublishersAnyPublisher**: Usa `AnyPublisher` para tipos de retorno
3. **Implementa el Factory correctamente**: Asegúrate de inyectar todas las dependencias
4. **Prueba los UseCases**: Son independientes, fáciles de testear
5. **Mantén el ViewController delgado**: Delega lógica al ViewModel

## Recursos

- [Documentación de Clean Architecture por Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- Referencia: app-mobile-banking proyecto
