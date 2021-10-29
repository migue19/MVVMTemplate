//___FILEHEADER___

import Foundation
import Combine

class ___VARIABLE_productName:identifier___Repository: ___VARIABLE_productName:identifier___RepositoryProtocol {
    
    // init should receive a datasource like a network client, a database object, the user defaults, or even a simple data object returned with a Combine just()
    
    let model: ModelToReplace
    
    init(model: ModelToReplace) {
        self.model = meal
    }
    
    func getData() -> AnyPublisher<ModelToReplace, Never> {
        return Just(model)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
