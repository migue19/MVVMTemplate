//___FILEHEADER___

import UIKit

/// Coordinator para manejar la navegación de ___VARIABLE_productName___
final class ___VARIABLE_productName___Coordinator {

    // MARK: - Properties

    private weak var navigationController: UINavigationController?

    // MARK: - Lifecycle

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    // MARK: - Public Methods

    func start() {
        let viewController = ___VARIABLE_productName___Factory.make___VARIABLE_productName___ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    // TODO: Agregar métodos para navegación a otras pantallas
    // Ejemplo:
    // func navigateToDetails(_ id: String) {
    //     let detailsCoordinator = DetailsCoordinator(navigationController: navigationController)
    //     detailsCoordinator.start(with: id)
    // }
}
