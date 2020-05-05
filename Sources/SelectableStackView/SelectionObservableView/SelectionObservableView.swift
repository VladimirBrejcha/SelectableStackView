//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import UIKit

/// Represents a `UIView` that could be selected
public protocol SelectableView: UIView {
    var isSelected: Bool { get set }
}

/// Represents a `SelectableView` that has an observer
public protocol SelectionObservableView: SelectableView {
    /// An observer that should be informed every time the view is about to be selected or deselected
    var selectionObserver: ((SelectionObservableView) -> Void)? { get set }
    /// Declares if the view taking care of select/deselect itself
    /// Set to `true` if the view is selecting/deselecting itself just before notifying observer
    /// Set to `false` if the view will inform observer about selection but won't change its `isSelected` state itself
    /// When set to `false`, `SelectableStackView` will select/deselect this view automatically
    var handlingSelfSelection: Bool { get set }
}
