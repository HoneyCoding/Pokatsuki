목차

- [Android/iOS/Flutter로 작성해보는 간단한 앱 - 포카츠키](#Android/iOS/Flutter로-작성해보는-간단한-앱:-포카츠키)
  
  * [Android와 iOS 네이티브 개발 방식 비교](#Android와-iOS-네이티브-개발-방식-비교)
    + [개인적으로 크게 느낀 Swift와 Kotlin의 차이점](#개인적으로-크게-느낀-Swift와-Kotlin의-차이점)
      - [Optional과 Nullable](#Optional과-Nullable)
      - [삼항 연산자](#삼항-연산자)
      - [이니셜라이저 생성](#이니셜라이저-생성)
      - [그 외](#그-외)
    + [개인적으로 크게 느낀 안드로이드와 iOS 앱 개발의 비슷한 점](#개인적으로-크게-느낀-안드로이드와-iOS-앱-개발의-비슷한-점)
    + [개인적으로 크게 느낀 안드로이드와 iOS 앱 개발의 다른 점](#개인적으로-크게-느낀-안드로이드와-iOS-앱-개발의-다른-점)
      - [용어의 차이](#용어의-차이)
      - [뒤로가기 버튼 유무](#뒤로가기-버튼-유무)
  * [프로젝트를 진행하며 포커스를 두었던 목표](#프로젝트를-진행하며-포커스를-두었던-목표)
    * [Android와 iOS 네이티브 방식 구현](#Android와-iOS-네이티브-방식-구현)
  
  

# Android/iOS/Flutter로 작성해보는 간단한 앱: 포카츠키

iOS 앱 개발 공부를 하며 얻은 지식을 Android에 활용해 볼 수 없을까 생각하며 진행한 프로젝트입니다. iOS의 CollectionView에 대응하는 RecyclerView를 활용했습니다. ListView, GridView도 있지만 Adapter 패턴이 강제되어 성능상의 이점이 있는 RecyclerView를 사용하고 싶었습니다.

iOS의 CollectionView를 Vertical로 사용해 TableView처럼 사용할 수 있는 것과 마찬가지로 RecyclerView도 GridView가 아닌 ListView처럼 사용할 수 있습니다.

> 나중에는 Android/iOS 네이티브가 아닌 Flutter와 같은 프레임워크를 활용하여 구현하는 방식도 진행해보았습니다.

## Android와 iOS 네이티브 개발 방식 비교

### 개인적으로 크게 느낀 Swift와 Kotlin의 차이점

#### Optional과 Nullable

두 언어 모두 null/nil을 가질 수 있는 타입과 가질 수 없는 타입이 있습니다. 이 점은 Scala라는 언어의 Option 클래스에서 두 언어가 영감을 얻었기에 생긴 공통점이라 할 수 있습니다.

하지만 문법적인 차이가 있습니다. 예를 들어 Swift의 Optional Binding을 Kotlin에서 Elvis Operator를 활용하여 같은 방식으로 사용할 수 있습니다.

```swift
// swift
guard let view = view else { return }
```

```kotlin
// kotlin
val view = view ?: return
```

이 외에도 강제 추출과 같은 코드를 작성하며 문법적 차이를 느낄 수 있습니다.

#### 삼항 연산자

Swift에는 다른 언어가 가진 삼항 연산자가 있습니다. 하지만 Kotlin에는 삼항 연산자가 없습니다. 삼항 연산자가 없으면 불편할 것 같은데... 알고보니 삼항 연산자가 없다고 말하기 애매한 것 같더라구요...? Kotlin에서는 삼항 연산자와 같은 코드를 어떻게 구현하는지 스위프트와 비교해서 보여드리겠습니다.

```swift
// swift
let number: Int = isNumberOdd == true ? 1 : 0
```

```kotlin
// kotlin
val number: Int = if (isNumberOdd == true) 1 else 0
```

#### 이니셜라이저 생성

이니셜라이저를 구현하는 코드를 작성하며 느낀 차이점이 다른 차이점보다 제게 큰 충격을 주었습니다. 

Swift는 init이란 키워드를 중점적으로 사용해 이니셜라이저를 만들어줍니다.

Kotlin에도 init 키워드가 존재하며 constructor과 같은 키워드도 함께 사용할 수 있습니다. Kotlin의 class는 하나의 Primary Constructor를 가지며 Secondary Constructor를 여러 개 가질 수 있습니다.

> Swift에선 Initializer라고 지칭하는 것을 Kotlin에서는 Constructor라고 지칭합니다.

#### 그 외

그 외에도 Swift에서 이름 없는 클로저를 생성 후 바로 실행하는 방식을 선호하는 것에 반해 Kotlin에서는 run이라는 함수에 클로저를 전달해 실행하는 방식을 선호하는 것, Swift의 if let 문법을 Kotlin에서는 let이라는 고차 함수를 사용하는 방식으로 구현한 등의 차이점을 보며 신선하다고 느꼈습니다.

---

### 개인적으로 크게 느낀 안드로이드와 iOS 앱 개발의 비슷한 점

- UI 구성 방식

  iOS 앱 개발 시에는 Storyboard를 활용하여 UI를 구성할 수 있습니다. Android 앱 개발시에는 xml을 활용하여 UI를 구성할 수 있습니다.

  - UI 관련 파일 사용 - iOS의 Storyboard와 Android의 xml

    - iOS에서 Storyboard를 활용해 앱을 만드는 공식 튜토리얼은 [Apple - Creating a Storyboard App](https://developer.apple.com/tutorials/app-dev-training/creating-a-storyboard-app)에서 확인하실 수 있습니다.
    - Android에서 xml을 활용하는 튜토리얼은 [Android Developers - 간단한 사용자 인터페이스 빌드](https://developer.android.com/training/basics/firstapp/building-ui)에서 확인하실 수 있습니다.

  - Constraint를 걸어주는 Layout

    iOS의 [Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html)과 Android의 [Constraint Layout](https://developer.android.com/training/constraint-layout?hl=ko)은 Constraint를 걸어준다는 점에서 비슷해보입니다.

  - DSL

    - iOS - Auto Layout을 코드로 구현하기 위해 나타난 라이브러리 [SnapKit](https://github.com/SnapKit/SnapKit)이 있습니다. SnapKit은 오늘날에도 배달의 민족과 같은 기업이 사용하는 라이브러리입니다.
    -  Android - Constraint Layout를 구현하기 위해 나타난 라이브러리 [Anko Layouts](https://github.com/Kotlin/anko)가 있었습니다. ~~Anko가 Deprecated 되어 버려 과거형이 되었습니다.~~

  - iOS의 [StackView](https://developer.apple.com/documentation/uikit/uistackview)와 비슷한 개념으로 Android의 [LinearLayout](https://developer.android.com/guide/topics/ui/layout/linear?hl=ko)이 있습니다. 

    - iOS에서는 StackView 내부 요소간의 간격을 주기 위해 spacing 프로퍼티를 사용합니다.
    - Android에서는 LinearLayout 내부 요소간의 간격을 주기 위해서 divider 속성을 활용합니다.

  - 선언형 UI 패러다임

    - iOS 앱 개발과 Android 앱 개발 양쪽에서 선언형 UI 패러다임으로 앱 개발하는 방법을 제공합니다. iOS의 [SwiftUI](https://developer.apple.com/kr/xcode/swiftui/), Android의 [Jetpack Compose](https://developer.android.com/jetpack/compose?hl=ko)가 그 방법입니다.

    - 두 방법 모두 현업 개발 방식에서 2021년 12월 26일 기준 점유율이 높지 않은 상황입니다.

- 기존에 사용되던 언어와 새로운 언어의 공존

  - iOS 앱 개발에는 기존에 [Objective-C](https://ko.wikipedia.org/wiki/오브젝티브-C)라는 언어가 사용되었고 [Swift](https://developer.apple.com/kr/swift/)라는 언어를 사용해 개발하는 방식으로 서서히 옮겨갔습니다.
  - Android 앱 개발에는 기존에 [Java](https://www.java.com/ko/)라는 언어가 사용되었고 [Kotlin](https://kotlinlang.org)이라는 언어를 사용해 개발하는 방식으로 서서히 옮겨갔습니다.
  - iOS 앱 개발, Android 앱 개발을 할 때 양쪽 모두 기존의 언어와 새롭게 사용되는 언어를 함께 사용하여 프로젝트를 진행할 수 있습니다.

---

### 개인적으로 크게 느낀 안드로이드와 iOS 앱 개발의 다른 점

#### 용어의 차이

- [iOS의 Navigation Bar](https://developer.apple.com/design/human-interface-guidelines/ios/bars/navigation-bars/)는 Android의 Material Design에서는 [Top App Bar](https://material.io/components/app-bars-top)와 비슷하지만 서로 다른 용어를 사용합니다.

- [iOS의 Tab Bar](https://developer.apple.com/design/human-interface-guidelines/ios/bars/tab-bars/)는 Android의 [BottomNavigationBar](https://material.io/components/bottom-navigation/android)와 비슷하지만 서로 다른 용어를 사용합니다.
- iOS와 Android에서 Navigation Bar라는 단어가 지칭하는 요소가 다른 것처럼 같은 단어를 다른 것을 지칭할 때 쓰기도 합니다.
  - [iOS의 Navigation Bar](https://developer.apple.com/design/human-interface-guidelines/ios/bars/navigation-bars/)는 스마트폰 상단에 생기는 뒤로 가기와 현재 화면의 타이틀이 나타나는 바를 의미합니다.
  - [Android의 Navigation Bar](https://www.google.com/url?client=internal-element-cse&cx=000521750095050289010:zpcpi1ea4s8&q=https://developer.android.com/training/system-ui/navigation&sa=U&ved=2ahUKEwiI0Nnr_ID1AhVHCqYKHbwqDqkQFnoECAAQAg&usg=AOvVaw2kF2ueRrZ6wmTHeTXpymAg)는 스마트폰 하단에 생기는 뒤로 가기, 멀티 태스킹, 홈이 있는 바를 의미합니다.

#### 뒤로가기 버튼 유무

- iOS의 뒤로 가기는 어떻게 작동해야할지 개발하며 예측하기 쉽다고 느꼈습니다.

- Android의 뒤로 가기는 어떻게 작동해야할지 개발하며 예측하기 어려운 부분이 있었습니다. 예를 들어 [BottomNavigationBar](https://material.io/components/bottom-navigation/android) 간에 탭을 통한 화면 전환이 있었을 때 뒤로 가기 버튼을 어떻게 작동하도록 구현해야 할지에 대한 고민이 생길 것 같았습니다.

  > 안드로이드 기준 BottomNavigationBar를 탭해 화면을 이리저리 움직인 이후에 당근마켓, FLO, 유튜브, 카카오톡, Wavve와 같은 앱에서 뒤로 가기 버튼을 여러 번 탭해보면 각 앱의 작동 방식 차이점을 느끼실 수 있습니다!

## 프로젝트를 진행하며 포커스를 두었던 목표

Permission, Network와 같은 기능 구현보다는 UI 구현에 집중해보았습니다.

### Android와 iOS 네이티브 방식 구현

RecyclerView의 아이템을 터치할 때 Effect 보여주기, 화면과 화면 사이에 데이터 전달, 둥근 모양의 ImageView 구현 등을 해보았습니다. 해당 프로젝트 실행 시 모습은 아래와 같습니다.

![ResultImage](https://github.com/CodingJT/Pokatsuki/blob/main/README_Image/result_android_ios.gif)

- Android
    화면 전환 시에는 Fragment가 아닌 Activity 전환 방식으로 구현했습니다. iOS로 치면 Navigation Push가 아닌 Modal Present 방식을 사용했다 말할 수 있겠습니다.
- iOS
    화면 전환 시에 Modal Present가 아닌 Navigation Push 방식을 사용했습니다. Android에 비유하면 Activity 전환 방식을 사용하지 않고 Fragment 전환 방식을 사용한 셈입니다. 더 정확히는 [Android Jetpack Navigation](https://developer.android.com/guide/navigation/navigation-getting-started?hl=ko)을 사용한 것에 가까울 것 같습니다.
