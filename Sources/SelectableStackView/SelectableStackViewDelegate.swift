//  Copyright © 2020 VladimirBrejcha. All rights reserved.

/// Delegate protocol used by the `SelectableStackView` class
public protocol SelectableStackViewDelegate: AnyObject {
    /// Called every time any `SelectableStackView` subview changed it's `isSelected` state
    func didSelect(_ select: Bool,
                   at index: Index,
                   on selectableStackView: SelectableStackView
    )
}
