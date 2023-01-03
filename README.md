## Combine Example

### `Combine`을 활용하여 `UITextField`와 `UIButton`에 대하여 비밀번호 일치 여부 구현

- `UITextField`의 `textDidChangeNotification`에 대한 Publisher 생성
- `UITextField`에서 방출하는 String 값과 ViewModel Input과 바인딩
- ViewModel이 받는 String 값에 `@Published` 어노테이션을 붙여 이 값도 구독할 수 있도록 설정
- String 값을 방출하는 Publisher들에 대해 `CombineLatest()` 수행, 값 일치 여부에 따른 Bool 값을 방출
- VC에서 ViewModel의 Bool 값을 구독하여 버튼의 `isValid` 프로퍼티와 바인딩
- 버튼의 `isValid` 프로퍼티에 따른 버튼 배경 색상 및 글자색 변경

![Simulator Screen Recording - iPhone 14 Pro - 2023-01-03 at 15 32 01](https://user-images.githubusercontent.com/77015330/210311176-f10289f0-466a-42e3-b11f-ea22ca49e07e.gif)
