//___FILEHEADER___

import Foundation
import UIKit

class ___VARIABLE_productName:identifier___SceneBuilder {
    
    func build() -> ___VARIABLE_productName:identifier___ViewController {
        let repository = ___VARIABLE_productName:identifier___Repository(model: ModelToReplace())
        let useCase = ___VARIABLE_productName:identifier___UseCase(repository: repository)
        let viewModel = ___VARIABLE_productName:identifier___ViewModel(useCase: useCase)
        let viewController = ___VARIABLE_productName:identifier___ViewController(viewModel: viewModel)
        return viewController
    }
}
