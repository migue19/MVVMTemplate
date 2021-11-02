//___FILEHEADER___

import Foundation
import Combine

class ___VARIABLE_productName:identifier___ViewModel: ___VARIABLE_productName:identifier___ViewModelProtocol {
    private let useCase: ___VARIABLE_productName:identifier___UseCaseProtocol
    private var subscriptions = Set<AnyCancellable>()
    var output: ___VARIABLE_productName:identifier___ViewModelOutput = ___VARIABLE_productName:identifier___ViewModelOutput()
    
    init(useCase: ___VARIABLE_productName:identifier___UseCaseProtocol) {
        self.useCase = useCase
    }
    
    func bind(input: ___VARIABLE_productName:identifier___ViewModelInput) -> ___VARIABLE_productName:identifier___ViewModelOutput {
        input.viewLoadedPublisher.sink { [weak self] in
            //do something when view is loaded, for example fetching an endpoint or loading an object in memory
            self?.loadViewData()
        }
        .store(in: &self.subscriptions)
        return output
    }
    
    private func loadViewData() {
        self.useCase.getData().sink { [weak self] model in
            let viewData = ___VARIABLE_productName:identifier___ViewData(model: model)
            self?.output.viewDataPublisher.send(viewData)
        }.store(in: &subscriptions)
    }
}
