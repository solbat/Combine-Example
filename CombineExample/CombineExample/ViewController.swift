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

