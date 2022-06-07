import Foundation

protocol CreateAccountInteractorInput {
	var output: CreateAccountInteractorOutput? { get set }
	func createAccount(withLogin login: String, password: String)
}
protocol CreateAccountInteractorOutput: AnyObject {
	func didRecive(error: String)
	func didCreateAccount(withLogin login: String)
}

final class CreateAccountInteractor: CreateAccountInteractorInput {
	weak var output: CreateAccountInteractorOutput?

	func createAccount(withLogin login: String, password: String) {
		let _ = Account(logun: login, password: password)

		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
			self?.output?.didCreateAccount(withLogin: login)
		}
	}
}
