//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import UIKit

public typealias Index = Int

@IBDesignable
public class SelectableStackView: UIStackView {
    /// Declares if state with no selected views allowed
    /// If set to `false` latest selected view will not be allowed to be deselected
    /// If set to `false` first view will be automatically selected on `addArrangedSubview`
    /// If set to `false` while no views are selected, latest accessed view will be automatically selected (or first view if no views accessed yet)
    /// Default is `false`
    @IBInspectable
    public var noSelectionAllowed: Bool = false {
        didSet {
            if oldValue == noSelectionAllowed { return }
            if oldValue == true && numberOfViewsSelected == 0 {
                if let latest = latestAccessedIndex {
                    select(true, at: latest)
                } else {
                    select(true, at: 0)
                }
            }
        }
    }
    
    /// Declares if state with more than one view selected at a time allowed
    /// If set to `false` while more than one view is selected, all views except latest accessed one will be deselected
    /// If set to `false` while one view is selected and another view is being selected, old view will be deselected automatically
    /// Default is `false`
    @IBInspectable
    public var multipleSelectionAllowed: Bool = false {
        didSet {
            if oldValue == multipleSelectionAllowed { return }
            if oldValue == true && numberOfViewsSelected > 1 {
                typeCastedSubviews.forEach { $0.isSelected = false }
                selectLatest(true)
            }
        }
    }
    
    /// Log unexpected behavior
    /// Default is `true`
    public var loggingEnabled: Bool = true
    
    /// Access arrangedSubview at `index`
    /// Returns subview with given index or nil
    public subscript(index: Index) -> SelectionObservableView? {
        typeCastedSubviews.indices.contains(index) ? typeCastedSubviews[index] : nil
    }
    
    /// Access `index` of the `view`
    /// Returns index of given subview or nil
    public subscript(view: SelectionObservableView) -> Index? {
        typeCastedSubviews.firstIndex { $0 == view }
    }
    
    /// Add `view` to subviews
    /// View must conform to `SelectionObservableView`
    /// If `noSelectionAllowed` is `false` and no views are selected, will automatically select first view
    /// Subscribes to `SelectionObservableView` `selectionObserver`
    public override func addSubview(_ view: UIView) {
        if let view = view as? SelectionObservableView {
            view.selectionObserver = selectionObserver(_ :)
            super.addSubview(view)
            if !noSelectionAllowed && typeCastedSubviews.count == 1 {
                selectIfNeeded(true, at: 0)
                latestAccessedIndex = 0
            }
        } else {
            logIfLogging("addSubview failed. View must conform to SelectionObservableView protocol")
        }
    }
    
    /// Add `view` to arrangedSubviews
    /// View must conform to `SelectionObservableView`
    /// If `noSelectionAllowed` is `false` and no views are selected, will automatically select first view
    /// Subscribes to `SelectionObservableView` `selectionObserver`
    public override func addArrangedSubview(_ view: UIView) {
        if let view = view as? SelectionObservableView {
            view.selectionObserver = selectionObserver(_ :)
            super.addArrangedSubview(view)
            if !noSelectionAllowed && typeCastedSubviews.count == 1 {
                selectIfNeeded(true, at: 0)
                latestAccessedIndex = 0
            }
        } else {
            logIfLogging("addArrangedSubview failed. View must conform to SelectionObservableView protocol")
        }
    }
    
    /// Remove `view` from arrangedSubviews
    /// View must conform to `SelectionObservableView`
    /// If `noSelectionAllowed` is `false` and no views are selected, will automatically select latest accessed view (or first view if no views accessed yet)
    /// Unsubscribes from `SelectionObservableView` `selectionObserver`
    public override func removeArrangedSubview(_ view: UIView) {
        if let view = view as? SelectionObservableView {
            view.selectionObserver = nil
            if !noSelectionAllowed && numberOfViewsSelected == 0 && typeCastedSubviews.count > 0 {
                if let latest = latestAccessedIndex {
                    select(true, at: latest)
                } else {
                    select(true, at: 0)
                    latestAccessedIndex = 0
                }
            }
        }
        super.removeArrangedSubview(view)
    }
    
    /// Select or deselect view at given `index`
    /// If view at given index doesnt exist will return
    public func select(_ select: Bool, at index: Index) {
        guard let selectable = self[index] else {
            logIfLogging("Failed to \(select ? "select" : "deselect") view at index \(index), because no view at given index was found")
            return
        }
        forcedlySelect(selectable)
        latestAccessedIndex = index
    }
    
    // MARK: - Private -
    private var latestAccessedIndex: Index?
    
    private var typeCastedSubviews: [SelectionObservableView] {
        subviews as! [SelectionObservableView]
    }
    
    private var numberOfViewsSelected: Int {
        typeCastedSubviews.filter { $0.isSelected }.count
    }
    
    deinit {
        typeCastedSubviews.forEach {
            $0.selectionObserver = nil
        }
    }
    
    private func selectionObserver(_ selectable: SelectionObservableView) {
        selectable.handlingSelfSelection
            ? completeSelect(selectable)
            : forcedlySelect(selectable)
        latestAccessedIndex = self[selectable]
    }
    
    private func completeSelect(_ selectable: SelectableView) {
        if numberOfViewsSelected == 0 && !noSelectionAllowed {
            selectIfNeeded(true, selectable)
        } else if numberOfViewsSelected > 1 && !multipleSelectionAllowed {
            selectLatest(false)
        }
    }
    
    private func forcedlySelect(_ selectable: SelectableView) {
        if selectable.isSelected && numberOfViewsSelected == 1 && !noSelectionAllowed {
            logIfLogging("Deselect failed, because no other views selected yet and no selection is disallowed")
            return
        }
        
        if selectable.isSelected {
            selectable.isSelected = false
        } else {
            if !multipleSelectionAllowed {
                selectLatest(false)
            }
            selectable.isSelected = true
        }
    }
    
    private func selectLatest(_ select: Bool) {
        if let index = latestAccessedIndex {
            selectIfNeeded(select, at: index)
        }
    }
    
    private func selectIfNeeded(_ select: Bool, at index: Index) {
        guard let view = self[index] else {
            logIfLogging("select \(select) failed, no view at \(index) index was found")
            return
        }
        
        selectIfNeeded(select, view)
    }
    
    private func selectIfNeeded(_ select: Bool, _ selectable: SelectableView) {
        if selectable.isSelected != select {
            selectable.isSelected = select
        }
    }
    
    private func logIfLogging(_ message: String) {
        if loggingEnabled {
            log(message)
        }
    }
}

