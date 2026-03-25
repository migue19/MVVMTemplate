//___FILEHEADER___

import UIKit

/// ViewController para ___FILEBASENAME___
final class ___FILEBASENAME___ViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: ___FILEBASENAME___ViewModel

    // MARK: - Lifecycle

    init(viewModel: ___FILEBASENAME___ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        // TODO: Configurar la interfaz de usuario
    }

    private func bindViewModel() {
        // TODO: Suscribirse a los @Published properties del ViewModel usando Combine
        // Ejemplo:
        // viewModel.$isLoading
        //     .receive(on: DispatchQueue.main)
        //     .sink { [weak self] isLoading in
        //         self?.updateLoadingState(isLoading)
        //     }
        //     .store(in: &cancellables)
    }
}
