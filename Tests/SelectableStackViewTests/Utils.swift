//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import UIKit
@testable import SelectableStackView

class SelectableButton: UIButton, ObservableBySelectableStackView {
    var observer: ((ObservableBySelectableStackView) -> Void)?
    var handlingSelfSelection: Bool = false
    
    func touchUp() {
        observer?(self)
    }
}

class SelfSelectingSelectableButton: UIButton, ObservableBySelectableStackView {
    var observer: ((ObservableBySelectableStackView) -> Void)?
    var handlingSelfSelection: Bool = true
    
    func touchUp() {
        isSelected.toggle()
        observer?(self)
    }
}

func makeStackWithSubviews(with setup: InitialStackSetup)
    -> (SelectableStackView, SelectableButton, SelectableButton, SelectableButton)
{
    let stackView = setup()
    let button1 = SelectableButton()
    let button2 = SelectableButton()
    let button3 = SelectableButton()
    stackView.addArrangedSubview(button1)
    stackView.addArrangedSubview(button2)
    stackView.addArrangedSubview(button3)
    return (stackView, button1, button2, button3)
}

func makeStackWithSelfHandlingSubviews(with setup: InitialStackSetup)
    -> (SelectableStackView, SelfSelectingSelectableButton, SelfSelectingSelectableButton, SelfSelectingSelectableButton)
{
    let stackView = setup()
    let button1 = SelfSelectingSelectableButton()
    let button2 = SelfSelectingSelectableButton()
    let button3 = SelfSelectingSelectableButton()
    stackView.addArrangedSubview(button1)
    stackView.addArrangedSubview(button2)
    stackView.addArrangedSubview(button3)
    return (stackView, button1, button2, button3)
}

typealias InitialStackSetup = () -> SelectableStackView

var noSelectionAndMultipleSelection: InitialStackSetup = {
    let stackView = SelectableStackView()
    stackView.noSelectionAllowed = true
    stackView.multipleSelectionAllowed = true
    return stackView
}

var noSelectionAndSingleSelection: InitialStackSetup = {
    let stackView = SelectableStackView()
    stackView.noSelectionAllowed = true
    stackView.multipleSelectionAllowed = false
    return stackView
}

var singleSelection: InitialStackSetup = {
    let stackView = SelectableStackView()
    stackView.noSelectionAllowed = false
    stackView.multipleSelectionAllowed = false
    return stackView
}

var multipleSelection: InitialStackSetup = {
    let stackView = SelectableStackView()
    stackView.noSelectionAllowed = false
    stackView.multipleSelectionAllowed = true
    return stackView
}
