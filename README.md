# ViewDSL

Heavily inspired from [UIKitDSL](https://github.com/mecid/UIKitSwiftDSL) but want some functionalities added.

Have you known [Anko](https://github.com/Kotlin/anko)? That's beauty of DSL as first class citizen.

## Base DSL

With ViewDSL you can build UI in declarative way.
```swift
UIView().add { (v: UIView) in
  
}
```
Unfortunately, ViewDSL force you to explicitly declare type of instance to be added. That isn't better from UIKitDSL. Agreed.

Lets take a look below example. ViewDSL give you functionality to initialize your UIView in some _fun_ way.
```swift
class EqualStackView: UIStackView {
  func layoutSubviews() {
    super.layoutSubviews()
    distribution = .fillEqually
    spacing = 10
  }
}

let stack = EqualStackView { s in
  s.axis = .vertical
  
  s.add { (s: EqualStackView) in
    s.axis = .horizontal
    
    s.add { (b: UIButton) in
      b.setTitle("Yes", for: .normal)
      b.backgroundColor = .green
    }
    s.add { (b: CustomButton) in
      b.title = "No"
      b.bgColor = .red
    }
  }
}
```
Thats the power from `ClosureInit`! But you must implement `init()` method in your custom class to get it's support.
Funny because all NSObject classes and its derived classes must have implentation of `init()` right? So UIView classes!

The way ViewDSL ask you to declare explicitly type of instance to be added gives you power to make all your custom classes works with ViewDSL out-of-the-box. But sure, you can make your custom function to make your DSL more like Anko or UIKitDSL.

```swift
extension ViewDSL {
  @discardableResult
  func stack(_ closure: (UIStackView) -> Void) -> UIStackView {
     return add { (s: UIStackView) in
       closure(s)
     }
  }
}
```

## DelegatedDSL

You want to separate your common Button to reuse it later? Meet DelegatedDSL!

```swift
// Look Here I'm using my custom DSL from previous code
view.stack {
  $0.axis = .vertical
  
  // And I want to added by common button to current view
  $0.dsl(delegatedTo: blueButton(_:))
}

// I'm using function to put my common button implementation
func blueButton(_ dsl: ViewDSL) {
    dsl.add { (b: UIButton) in
        b.backgroundColor = .blue
    }
}
```

## LayoutBuilderDSL

This protocol will fit if you need complex UI implementation to be put in different file.
```swift
class ProfileLayout: LayoutBuilderDSL {
    let name: UITextField
    let email: UITextField
    let saveButton: UIButton

    init(name: String, email: String) {
        name = UITextField {
          $0.text = name
        }
        email = UITextField {
          $0.text = email
        }
        saveButton = UIButton {
          $0.setTitle("Save", for: .normal)
        }
    }

    func layout(_ dsl: ViewDSL) {
        dsl.add(name)
        dsl.add(email)
        dsl.add(saveButton)
    }
}

stack.dsl(delegatedTo: ProfileLayout(name: "Egg-boy", email: "eggboy@youknow.com"))
```
If you want to use `*.self` style, you can implement `InitializableLayoutBuilderDSL`
```swift
extension ProfileLayout2: ProfileLayout, InitializableLayoutBuilderDSL {
  init() {
    super.init(name: "", email: "")
  }
}

stack.dsl(withInstanceOf: ProfileLayout2.self)
```

Beautiful!!

And some you may find it in Unit Tests files! Have a try!
