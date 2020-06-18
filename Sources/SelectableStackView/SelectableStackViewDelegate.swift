//  Copyright © 2020 VladimirBrejcha. All rights reserved.

/// Delegate protocol used by the `SelectableStackView` class
public protocol SelectableStackViewDelegate: AnyObject {
    /// If set to `true`, `didSelect(_:at:on:)` will be called after `SelectableStackView.select(_:at:)`
    /// and as a result of a `ObservableBySelectableStackView.observer` notification
    /// If set to `false` `didSelect(_:at:on:)` will be called as
    /// a result of a `ObservableBySelectableStackView.observer` notification only
    /// Default is `false`
    var shouldNotifyAboutSelfSelection: Bool { get }
    
    /// Called every time any `SelectableStackView` subview changed it's `isSelected` state
    func didSelect(_ select: Bool, at index: Index,
                   on selectableStackView: SelectableStackView
    )
}

public extension SelectableStackViewDelegate {
    var shouldNotifyAboutSelfSelection: Bool { false }
}
