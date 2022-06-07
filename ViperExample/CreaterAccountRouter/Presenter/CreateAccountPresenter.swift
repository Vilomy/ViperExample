import Foundation


protocol CreateAccountPresenterInput {
	var output: CreateAccountPresenterInput? { get set }
}
protocol CreateAccountPresenterOutput: AnyObject {
}

final class CreateAccountPresenter {
	private let interactor: CreateAccountInteractorInput
	private let router: CreateAccountRouterInput
	private let view: CreateAccountViewInput
	
	init(view: CreateAccountViewInput,
		 interactor: CreateAccountInteractorInput,
		 router: CreateAccountRouterInput) {
		self.view = view
		self.interactor = interactor
		self.router = router
	}
}

extension CreateAccountPresenter: CreateAccountViewOutput {
	func userSelectCreateAccount(withLogin login: String, password: String) {
		interactor.createAccount(withLogin: login, password: password)
	}
}
extension CreateAccountPresenter: CreateAccountInteractorOutput {
	func didRecive(error: String) {
	}

	func didCreateAccount(withLogin login: String) {
		router.openAuthScreen(withLogin: login)
	}
	
}
