//___FILEHEADER___

import Foundation

/// Factory para inyectar dependencias en ___FILEBASENAME___
struct ___FILEBASENAME___ {

    /// Crea el ViewController de ___FILEBASENAME___ completamente configurado
    /// - Returns: ___FILEBASENAME___ViewController con todas las dependencias inyectadas
    static func make___FILEBASENAME___ViewController() -> ___FILEBASENAME___ViewController {
        // TODO: Instanciar datasources y servicios
        // Ejemplo:
        // let apiClient: APIClientProtocol = APIClient()
        // let localDataSource: LocalDataSourceProtocol = CoreDataLocalDataSource()

        // Data Layer - Repository
        let repository = ___FILEBASENAME___RepositoryImpl()
            // Pasar las dependencias:
            // apiClient: apiClient,
            // localDataSource: localDataSource

        // Domain Layer - Use Cases
        let useCase = ___FILEBASENAME___UseCase(repository: repository)

        // Presentation Layer - ViewModel
        let viewModel = ___FILEBASENAME___ViewModel(useCase: useCase)

        // View Controller
        let viewController = ___FILEBASENAME___ViewController(viewModel: viewModel)

        return viewController
    }
}
