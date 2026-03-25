//___FILEHEADER___

import UIKit

/// Coordinator para manejar la navegación de ___FILEBASENAME___
final class ___FILEBASENAME___Coordinator {

    // MARK: - Properties

    private weak var navigationController: UINavigationController?

    // MARK: - Lifecycle

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    // MARK: - Public Methods

    func start() {
        let ___FILEBASENAME___ = ___FILEBASENAME___Factory.make___FILEBASENAME___ViewController()
        navigationController?.pushViewController(___FILEBASENAME___, animated: true)
    }

    // TODO: Agregar métodos para navegación a otras pantallas
    // Ejemplo:
    // func navigateToDetails(_ id: String) {
    //     let detailsCoordinator = DetailsCoordinator(navigationController: navigationController)
    //     detailsCoordinator.start(with: id)
    // }
}
