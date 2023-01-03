//
//  ViewController.swift
//  CombineExample
//
//  Created by USER on 2023/01/03.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    var viewModel: MyViewModel!
    
    private var mySubscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MyViewModel()
        
        passwordTextField
            .myTextPublisher
            // 스레드 - 메인에서 받겠다
            .receive(on: DispatchQueue.main)
            // KVO 방식으로 구독
            .assign(to: \.passwordInput, on: viewModel)
            .store(in: &mySubscriptions)
        
        passwordConfirmTextField
            .myTextPublisher
//            .print()
            // 다른 스레드와 같이 작업하기 때문에 RunLoop로 돌리겠다
            .receive(on: RunLoop.main)
            // KVO 방식으로 구독
            .assign(to: \.passwordConfirmInput, on: viewModel)
            .store(in: &mySubscriptions)
        
    }


}

extension UITextField {
    var myTextPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
//            .print()
            // UITextField 가져옴
            .compactMap { $0.object as? UITextField }
            // String 가져옴
            .map { $0.text ?? "" }
            .print() // receive value: (\($0))
            // AnyPublisher로 퉁치기
            .eraseToAnyPublisher()
    }
}

extension UIButton {
    var isValid: Bool {
        get {
            backgroundColor == .yellow
        }
        set {
            backgroundColor = newValue ? .yellow : .lightGray
            isEnabled = newValue
            setTitleColor(newValue ? .blue : .white, for: .normal)
        }
    }
}
