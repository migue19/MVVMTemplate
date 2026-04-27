//___FILEHEADER___

import SwiftUI

/// View para ___VARIABLE_productName___
/// Utiliza @StateObject para gestionar el ViewModel
struct ___VARIABLE_productName___View: View {

    // MARK: - Properties

    @StateObject var viewModel: ___VARIABLE_productName___ViewModel

    // MARK: - Body

    var body: some View {
        ZStack {
            // TODO: Configurar la interfaz de usuario
            VStack {
                Text("___VARIABLE_productName___")
                    .font(.title)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))

            // TODO: Agregar loading/error states según sea necesario
            // if viewModel.isLoading {
            //     ProgressView()
            // }
        }
        .navigationTitle("___VARIABLE_productName___")
        // TODO: Suscribirse a cambios del ViewModel usando onChange si es necesario
    }
}

// MARK: - Preview

#Preview {
    ___VARIABLE_productName___View(
        viewModel: ___VARIABLE_productName___ViewModel(
            useCase: ___VARIABLE_productName___UseCase()
        )
    )
}
