import Foundation

public class SignUpPresenter {
    private let alertView: AlertView
    
    public init(alertView: AlertView) {
        self.alertView = alertView
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        }
    }
    
    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || viewModel.name!.isEmpty {
            return "Nome é obrigatório"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "Email é obrigatório"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "Senha é obrigatória"
        } else if viewModel.confirmPassword == nil || viewModel.confirmPassword!.isEmpty {
            return "Confirmação de senha é obrigatória"
        }
        return nil
    }
}

public struct SignUpViewModel {
    public var name: String?
    public var email: String?
    public var password: String?
    public var confirmPassword: String?
    
    public init(name: String? = nil, email: String? = nil, password: String? = nil, confirmPassword: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
