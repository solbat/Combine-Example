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
    
    // 들어온 퍼블리셔들의 값 일치 여부를 반환하는 퍼블리셔
    lazy var isMatchPasswordInput: AnyPublisher<Bool, Never> = Publishers
        .CombineLatest($passwordInput, $passwordConfirmInput)
        .map({ (password: String, passwordConfirm: String) in
            if password == "" || passwordConfirm == "" {
                return false
            }
            return password == passwordConfirm ? true : false
        })
        .print()
        .eraseToAnyPublisher()
}
