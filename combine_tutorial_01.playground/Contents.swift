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


// NotificationCenter
var mySubscription: AnyCancellable? // 하나의 Subscription

var mySubscriptionSet = Set<AnyCancellable>() // 여러 개의 Subscription을 Set으로 모아 관리

var myNotification = Notification.Name("com.solbat.customNotification")

var myDefaultPublisher: NotificationCenter.Publisher = NotificationCenter.default.publisher(for: myNotification) // Notification과 연결된 Publisher 생성

NotificationCenter.default.post(Notification(name: myNotification)) // NotificationCenter에서 post하더라도 연결된 Publisher에 대해 아직 구독을 하지 않았으므로 아무 일도 발생하지 않음

mySubscription = myDefaultPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("완료")
    case .failure(let error):
        print("실패 : error : \(error)")
    }
}, receiveValue: { receivedValue in
    print("받은 값 : \(receivedValue)")
})

mySubscription?.store(in: &mySubscriptionSet)

NotificationCenter.default.post(Notification(name: myNotification))
NotificationCenter.default.post(Notification(name: myNotification))
NotificationCenter.default.post(Notification(name: myNotification))

//mySubscription?.cancel()


// KVO - Key-Value Observing
class MyFriend {
    var name = "철수" {
        // 값이 변경되면 실행
        didSet {
            print("name - didSet() : ", name)
        }
    }
}

var myFriend = MyFriend()

var myFriendSubscription: AnyCancellable = ["영수", "진희"].publisher.assign(to: \.name, on: myFriend) // myFriend 인스턴스의 name 프로퍼티에 assign

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
