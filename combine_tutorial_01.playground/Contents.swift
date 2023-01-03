import UIKit
import Combine

// 기본 Publisher-Subscriber
var myIntArrayPublisher: Publishers.Sequence<[Int], Never> = [1, 2, 3].publisher

myIntArrayPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("완료")
    case .failure(let error): // Never이기 때문에 에러가 발생하지는 않음
        print("실패 : error : \(error)")
    }
}, receiveValue: { receivedValue in
    print("값을 받았다. : \(receivedValue)")
})

