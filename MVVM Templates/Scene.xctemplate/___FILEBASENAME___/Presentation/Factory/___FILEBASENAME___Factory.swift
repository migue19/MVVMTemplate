//___FILEHEADER___

import Foundation

/// Factory para inyectar dependencias en ___VARIABLE_productName___Factory
/// Crea y configura el ViewController de ___VARIABLE_productName___ con todas sus dependencias (Repository, UseCase, ViewModel)
struct ___VARIABLE_productName___Factory {

    /// Crea el ViewController de ___VARIABLE_productName___ completamente configurado
    /// - Returns: ___VARIABLE_productName___VC con todas las dependencias inyectadas
    static func make___VARIABLE_productName___ViewController() -> ___VARIABLE_productName___VC {
        // TODO: Instanciar datasources y servicios
        // Ejemplo:
        // let apiClient: APIClientProtocol = APIClient()
        // let localDataSource: LocalDataSourceProtocol = CoreDataLocalDataSource()

        // Data Layer - Repository
        let repository = ___VARIABLE_productName___RepositoryImpl()
            // Pasar las dependencias:
            // apiClient: apiClient,
            // localDataSource: localDataSource

        // Domain Layer - Use Cases
        let useCase = ___VARIABLE_productName___UseCase(repository: repository)

        // Presentation Layer - ViewModel
        let viewModel = ___VARIABLE_productName___ViewModel(useCase: useCase)

        // View Controller
        let viewController = ___VARIABLE_productName___VC(viewModel: viewModel)

        return viewController
    }
}
