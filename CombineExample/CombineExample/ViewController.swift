//
//  ViewController.swift
//  CombineExample
//
//  Created by USER on 2023/01/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    var viewModel: MyViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = MyViewModel()
        
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

