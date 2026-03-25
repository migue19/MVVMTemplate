//___FILEHEADER___

import Combine
import Foundation

/// ViewModel para ___FILEBASENAME___
/// Capa de presentación con reactividad usando Combine y @Published
final class ___FILEBASENAME___ViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // MARK: - Private Properties

    private let useCase: ___FILEBASENAME___UseCase
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Lifecycle

    init(useCase: ___FILEBASENAME___UseCase) {
        self.useCase = useCase
    }

    // MARK: - Public Methods

    // TODO: Agregar métodos que publiquen eventos y actualicen @Published properties
    // Ejemplo:
    // func loadData() {
    //     isLoading = true
    //     errorMessage = nil
    //
    //     useCase.execute()
    //         .receive(on: DispatchQueue.main)
    //         .sink(
    //             receiveCompletion: { [weak self] completion in
    //                 self?.isLoading = false
    //                 if case let .failure(error) = completion {
    //                     self?.errorMessage = error.localizedDescription
    //                 }
    //             },
    //             receiveValue: { [weak self] data in
    //                 // Update @Published properties
    //             }
    //         )
    //         .store(in: &cancellables)
    // }
}
