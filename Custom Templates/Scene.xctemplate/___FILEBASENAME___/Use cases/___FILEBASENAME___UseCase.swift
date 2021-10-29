//___FILEHEADER___

import Foundation
import Combine

class ___VARIABLE_productName:identifier___UseCase: ___VARIABLE_productName:identifier___UseCaseProtocol {
    
    private let repository: ___VARIABLE_productName:identifier___RepositoryProtocol
    
    init(repository: ___VARIABLE_productName:identifier___RepositoryProtocol) {
        self.repository = repository
    }
    
    func getData() -> AnyPublisher<ModelToReplace, Never> {
        return self.repository.getData()
    }
}
