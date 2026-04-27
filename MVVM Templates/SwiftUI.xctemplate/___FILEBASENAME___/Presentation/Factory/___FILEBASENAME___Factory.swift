//___FILEHEADER___

import Foundation

/// Factory para inyectar dependencias en ___VARIABLE_productName___Factory
/// Crea y configura la Vista de ___VARIABLE_productName___ con todas sus dependencias (Repository, UseCase, ViewModel)
struct ___VARIABLE_productName___Factory {

    /// Crea la View de ___VARIABLE_productName___ completamente configurada
    /// - Returns: ___VARIABLE_productName___View con todas las dependencias inyectadas
    static func make___VARIABLE_productName___View() -> some View {
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

        // SwiftUI View
        return ___VARIABLE_productName___View(viewModel: viewModel)
    }
}
