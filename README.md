# SelectableStackView

SelectableStackView is a customizable and easy to use UI element for showing and managing selectable elements in a stack written in Swift.

![Preview](https://github.com/VladimirBrejcha/SelectableStackViewExample/blob/master/SelectableStackViewExample/preview.gif)

## Features

- [x] Supports any number of elements
- [x] Supports any type of elements given that it should conform to SelectionObservableView protocol
- [x] Automatically manages elements
- [x] Allows to manually manage elements if needed
- [x] Supports single/multiple selection states
- [x] Can automatically handle no selection case
- [x] Use in code or from interface builder
- [x] Has a delegate to observe selection

## Requirements

- iOS 10.0+
- Xcode 11+
- Swift 5.2+

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Use Xcode’s new Swift Packages option, which is located within the File menu.

## Usage example

[ExampleApp](https://github.com/VladimirBrejcha/SelectableStackViewExample)

### Add an arranged subview
```Swift
import SelectableStackView

selectableStackView.addArrangedSubview(yourView) // make sure that your view conform to ObservableBySelectableStackView protocol
```

### Select an view from code
```Swift
import SelectableStackView

selectableStackView.select(true, at: someIndex) // if view at given index doesnt exist, nothing will happen
```

### Receive selection events
```Swift
import SelectableStackView

// 1. Conform to SelectableStackViewDelegate protocol
class SomeClass: SelectableStackViewDelegate {
    let selectableStackView = SelectableStackView()
    
    init() {
        // 2. Set delegate
        selectableStackView.delegate = self
    }
    
    // MARK: - SelectableStackViewDelegate
    func didSelect(_ select: Bool, at index: Index, on selectableStackView: SelectableStackView) {
        // handle selection
    }
}
```

## Advanced

### Turn off logging
```Swift
selectableStackView.loggingEnabled = false // disable logging if needed
```

### Turn off delegate notifications on self selection
```Swift
import SelectableStackView

class SomeClass: SelectableStackViewDelegate {
    var shouldNotifyAboutSelfSelection: Bool { true }
}
```

## License

SelectableStackView is released under the MIT license. [See LICENSE](LICENSE) for details.
