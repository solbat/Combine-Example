//
//  MyViewModel.swift
//  CombineExample
//
//  Created by USER on 2023/01/03.
//

import Foundation
import Combine

class MyViewModel {
    
    // Published 어노테이션을 통해 구독이 가능하도록 설정
    @Published var passwordInput: String = "" {
        didSet {
            print("MyViewModel / passwordInput: \(passwordInput)")
        }
    }
    @Published var passwordConfirmInput: String = "" {
        didSet {
            print("MyViewModel / passwordConfirmInput: \(passwordConfirmInput)")
        }
    }
}
