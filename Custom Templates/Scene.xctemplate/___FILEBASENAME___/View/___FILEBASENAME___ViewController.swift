//___FILEHEADER___

import UIKit
import Combine

class ___VARIABLE_productName:identifier___ViewController: UIViewController {
    private let viewModel: ___VARIABLE_productName:identifier___ViewModelProtocol
    private let viewModelInput: ___VARIABLE_productName:identifier___ViewModelInput = ___VARIABLE_productName:identifier___ViewModelInput()
    private var subscriptions = Set<AnyCancellable>()
    
    init(viewModel: ___VARIABLE_productName:identifier___ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.bind()
    }
    
    private func setupView() {
        //do any view setups
    }
    
    private func bind() {
        let output = self.viewModel.bind(input: self.viewModelInput)
        output.viewDataPublisher.sink (receiveValue: {self.fillWithData(viewData: $0)})
            .store(in: &subscriptions)
    }
    
    private func fillWithData(viewData: ___VARIABLE_productName:identifier___ViewData) {
        //populate the view with some data
    }
        
}
