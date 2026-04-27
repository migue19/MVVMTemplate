//___FILEHEADER___

import SwiftUI
import UIKit

/// Coordinator para manejar la navegación de ___VARIABLE_productName___
/// Soporta navegación bidireccional entre UIKit y SwiftUI
final class ___VARIABLE_productName___Coordinator {

    // MARK: - Public Methods - SwiftUI

    /// Crea una SwiftUI View lista para usar en SwiftUI o embeber en UIKit
    /// - Returns: AnyView de ___VARIABLE_productName___
    func makeSwiftUIView() -> AnyView {
        AnyView(___VARIABLE_productName___Factory.make___VARIABLE_productName___View())
    }

    // MARK: - Public Methods - UIKit

    /// Crea un UIViewController para usar en UIKit
    /// - Returns: UIHostingViewController que contiene la SwiftUI View
    func makeUIKitViewController() -> UIViewController {
        let swiftUIView = ___VARIABLE_productName___Factory.make___VARIABLE_productName___View()
        return UIHostingController(rootView: swiftUIView)
    }

    // MARK: - Public Methods - Wrappers para intercompatibilidad

    /// Envuelve un UIViewController en un SwiftUI View para usarlo desde SwiftUI
    /// Útil cuando necesitas navegar desde SwiftUI a módulos UIKit
    /// - Parameter viewController: El UIViewController a envolver
    /// - Returns: AnyView que contiene el UIViewController
    func wrapUIKitViewController(_ viewController: UIViewController) -> AnyView {
        AnyView(
            ___VARIABLE_productName___UIViewControllerRepresentable(viewController: viewController)
        )
    }

    // TODO: Agregar métodos para crear vistas/viewControllers de navegación
    // Ejemplo SwiftUI → SwiftUI:
    // func makeDetailsView(id: String) -> AnyView {
    //     let detailsCoordinator = DetailsCoordinator()
    //     return detailsCoordinator.makeSwiftUIView()
    // }
    //
    // Ejemplo UIKit → SwiftUI:
    // func makeDetailsViewController(id: String) -> UIViewController {
    //     let detailsCoordinator = DetailsCoordinator()
    //     return detailsCoordinator.makeUIKitViewController()
    // }
    //
    // Ejemplo SwiftUI → UIKit:
    // func makeOldModuleView() -> AnyView {
    //     let uiKitViewController = OldModuleCoordinator().makeViewController()
    //     return wrapUIKitViewController(uiKitViewController)
    // }
}

// MARK: - UIViewControllerRepresentable para embeber UIKit en SwiftUI

/// Wrapper para mostrar un UIViewController dentro de SwiftUI
fileprivate struct ___VARIABLE_productName___UIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let viewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Actualizar si es necesario
    }
}
