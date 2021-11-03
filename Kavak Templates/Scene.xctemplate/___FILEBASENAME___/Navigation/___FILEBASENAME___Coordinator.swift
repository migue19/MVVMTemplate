//___FILEHEADER___

import Foundation
import Combine
import UIKit

class ___VARIABLE_productName:identifier___Coordinator: Coordinator, ___VARIABLE_productName:identifier___CoordinatorProtocol {
    var children: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let builder = ___VARIABLE_productName:identifier___SceneBuilder()
        let viewController = builder.build()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToSomewhere() {
        
    }
}
