//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import UIKit

/// Represents a `UIView` that could be selected
public protocol SelectableView: UIView {
    var isSelected: Bool { get set }
}
