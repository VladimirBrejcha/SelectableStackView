//  Copyright © 2020 VladimirBrejcha. All rights reserved.

/// Represents a `SelectableView` that might be observed by an `SelectableStackView`
public protocol ObservableBySelectableStackView: SelectableView {
    /// An observer that should be informed every time the view is about to be selected or deselected
    /// Needed for `SelectableStackView` superview to work correctly
    var observer: ((ObservableBySelectableStackView) -> Void)? { get set }
    /// Declares if the view taking care of select/deselect itself
    /// Set to `true` if the view is selecting/deselecting itself just before notifying observer
    /// Set to `false` if the view will inform observer about selection but won't change its `isSelected` state itself
    /// When set to `false`, `SelectableStackView` will select/deselect this view automatically
    var handlingSelfSelection: Bool { get set }
}
