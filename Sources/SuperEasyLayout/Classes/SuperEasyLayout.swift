//
//  SuperEasyLayout.swift
//  SuperEasyLayout
//
//  Created by doil6317 on 2018/10/01.
//  Copyright © 2018 doil6317. All rights reserved.
//

#if os(iOS)
import UIKit

public class Anchor: CustomStringConvertible {
    enum AnchType {
        case top
        case topMargin
        case bottom
        case bottomMargin
        case firstBaseline
        case lastBaseline
        case centerY
        case leading
        case leadingMargin
        case left
        case leftMargin
        case trailing
        case trailingMargin
        case right
        case rightMargin
        case centerX
        case width
        case height
    }

    let object: Any
    let anchor: AnchType
    var constant: CGFloat = 0.0
    var multiplier: CGFloat = 1.0
    var priority: UILayoutPriority = .required
    var isActive = true

    public var description: String {
        return "object :\(object), anchor: \(anchor), constant: \(constant), priority: \(priority), isActive: \(isActive)"
    }

    var attribute: NSLayoutConstraint.Attribute {
        switch anchor {
        case .top:
            return .top
        case .topMargin:
            return .topMargin
        case .bottom:
            return .bottom
        case .bottomMargin:
            return .bottomMargin
        case .firstBaseline:
            return .firstBaseline
        case .lastBaseline:
            return .lastBaseline
        case .centerY:
            return .centerY
        case .leading:
            return .leading
        case .leadingMargin:
            return .leadingMargin
        case .left:
            return .left
        case .leftMargin:
            return .leftMargin
        case .trailing:
            return .trailing
        case .trailingMargin:
            return .trailingMargin
        case .right:
            return .right
        case .rightMargin:
            return .rightMargin
        case .centerX:
            return .centerX
        case .width:
            return .width
        case .height:
            return .height
        }
    }

    init(object: Any, anchor: AnchType, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required, isActive: Bool = true) {
        self.object = object
        self.anchor = anchor
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
        self.isActive = isActive
    }

    private func makeConstraint(_ anchor: Anchor, relatedBy relation: NSLayoutConstraint.Relation, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        (object as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: object,
                                            attribute: attribute,
                                            relatedBy: relation,
                                            toItem: anchor.object,
                                            attribute: anchor.attribute,
                                            multiplier: anchor.multiplier,
                                            constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return constraint
    }

    private func makeDimestionConstraint(attribute: NSLayoutConstraint.Attribute, relatedBy relation: NSLayoutConstraint.Relation, constant: CGFloat, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        (object as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: object,
                                            attribute: attribute,
                                            relatedBy: relation,
                                            toItem: nil,
                                            attribute: attribute,
                                            multiplier: 1.0,
                                            constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    func equal(_ anchor: Anchor, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeConstraint(anchor,
                              relatedBy: .equal,
                              constant: constant,
                              multiplier: multiplier,
                              isActive: isActive,
                              priority: priority)
    }

    @discardableResult
    func greaterThanOrEqual(_ anchor: Anchor, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeConstraint(anchor,
                              relatedBy: .greaterThanOrEqual,
                              constant: constant,
                              multiplier: multiplier,
                              isActive: isActive,
                              priority: priority)
    }

    @discardableResult
    func lessThanOrEqual(_ anchor: Anchor, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeConstraint(anchor,
                              relatedBy: .lessThanOrEqual,
                              constant: constant,
                              multiplier: multiplier,
                              isActive: isActive,
                              priority: priority)
    }

    @discardableResult
    public func width(equalTo constant: CGFloat, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeDimestionConstraint(attribute: .width,
                                       relatedBy: .equal,
                                       constant: constant)
    }

    @discardableResult
    public func width(greaterThanOrEqualTo constant: CGFloat, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeDimestionConstraint(attribute: .width,
                                       relatedBy: .greaterThanOrEqual,
                                       constant: constant)
    }

    @discardableResult
    public func width(lessThanOrEqualTo constant: CGFloat, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeDimestionConstraint(attribute: .width,
                                       relatedBy: .lessThanOrEqual,
                                       constant: constant)
    }

    @discardableResult
    public func height(equalTo constant: CGFloat, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeDimestionConstraint(attribute: .height,
                                       relatedBy: .equal,
                                       constant: constant)
    }

    @discardableResult
    public func height(greaterThanOrEqualTo constant: CGFloat, isActive: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return makeDimestionConstraint(attribute: .height,
                                       relatedBy: .greaterThanOrEqual,
                                       constant: constant)
    }

    @discardableResult
    public func height(lessThanOrEqualTo constant: CGFloat, isActive: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint {
        return makeDimestionConstraint(attribute: .height,
                                       relatedBy: .lessThanOrEqual,
                                       constant: constant)
    }
    @discardableResult
    func getDisabled() -> Self {
        isActive = false
        return self
    }

    @discardableResult
    func setPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}

/// Autolayout Helpers
extension UIView {
    public var top: Anchor {
        return Anchor(object: self, anchor: .top)
    }

    public var topMargin: Anchor {
        return Anchor(object: self, anchor: .topMargin)
    }

    public var bottom: Anchor {
        return Anchor(object: self, anchor: .bottom)
    }

    public var bottomMargin: Anchor {
        return Anchor(object: self, anchor: .bottomMargin)
    }

    public var firstBaseline: Anchor {
        return Anchor(object: self, anchor: .firstBaseline)
    }

    public var lastBaseline: Anchor {
        return Anchor(object: self, anchor: .lastBaseline)
    }

    public var centerY: Anchor {
        return Anchor(object: self, anchor: .centerY)
    }

    public var leading: Anchor {
        return Anchor(object: self, anchor: .leading)
    }

    public var leadingMargin: Anchor {
        return Anchor(object: self, anchor: .leadingMargin)
    }

    public var left: Anchor {
        return Anchor(object: self, anchor: .left)
    }

    public var leftMargin: Anchor {
        return Anchor(object: self, anchor: .leftMargin)
    }

    public var trailing: Anchor {
        return Anchor(object: self, anchor: .trailing)
    }

    public var trailingMargin: Anchor {
        return Anchor(object: self, anchor: .trailingMargin)
    }

    public var right: Anchor {
        return Anchor(object: self, anchor: .right)
    }

    public var rightMargin: Anchor {
        return Anchor(object: self, anchor: .rightMargin)
    }

    public var centerX: Anchor {
        return Anchor(object: self, anchor: .centerX)
    }

    public var width: Anchor {
        return Anchor(object: self, anchor: .width)
    }

    public var height: Anchor {
        return Anchor(object: self, anchor: .height)
    }
}

/// Autolayout Helpers
extension UILayoutGuide {
    public var top: Anchor {
        return Anchor(object: self, anchor: .top)
    }

    public var topMargin: Anchor {
        return Anchor(object: self, anchor: .topMargin)
    }

    public var bottom: Anchor {
        return Anchor(object: self, anchor: .bottom)
    }

    public var bottomMargin: Anchor {
        return Anchor(object: self, anchor: .bottomMargin)
    }

    public var firstBaseline: Anchor {
        return Anchor(object: self, anchor: .firstBaseline)
    }

    public var lastBaseline: Anchor {
        return Anchor(object: self, anchor: .lastBaseline)
    }

    public var centerY: Anchor {
        return Anchor(object: self, anchor: .centerY)
    }

    public var leading: Anchor {
        return Anchor(object: self, anchor: .leading)
    }

    public var leadingMargin: Anchor {
        return Anchor(object: self, anchor: .leadingMargin)
    }

    public var left: Anchor {
        return Anchor(object: self, anchor: .left)
    }

    public var leftMargin: Anchor {
        return Anchor(object: self, anchor: .leftMargin)
    }

    public var trailing: Anchor {
        return Anchor(object: self, anchor: .trailing)
    }

    public var trailingMargin: Anchor {
        return Anchor(object: self, anchor: .trailingMargin)
    }

    public var right: Anchor {
        return Anchor(object: self, anchor: .right)
    }

    public var rightMargin: Anchor {
        return Anchor(object: self, anchor: .rightMargin)
    }

    public var centerX: Anchor {
        return Anchor(object: self, anchor: .centerX)
    }

    public var width: Anchor {
        return Anchor(object: self, anchor: .width)
    }

    public var height: Anchor {
        return Anchor(object: self, anchor: .height)
    }
}

precedencegroup AnchorPriorityOperatorPrecedence {
    lowerThan: MultiplicationPrecedence
    higherThan: ComparisonPrecedence
    associativity: left
    assignment: false
}

infix operator !: AnchorPriorityOperatorPrecedence
extension Anchor {
    @discardableResult
    public static func == (lv: Anchor, rv: Anchor) -> NSLayoutConstraint {
        let isActive = lv.isActive && rv.isActive
        let priority = min(lv.priority, rv.priority)
        return lv.equal(rv, constant: rv.constant, multiplier: rv.multiplier, isActive: isActive, priority: priority)
    }

    @discardableResult
    public static func >= (lv: Anchor, rv: Anchor) -> NSLayoutConstraint  {
        let isActive = lv.isActive && rv.isActive
        let priority = min(lv.priority, rv.priority)
        return lv.greaterThanOrEqual(rv, constant: rv.constant, multiplier: rv.multiplier, isActive: isActive, priority: priority)
    }

    @discardableResult
    public static func <= (lv: Anchor, rv: Anchor) -> NSLayoutConstraint  {
        let isActive = lv.isActive && rv.isActive
        let priority = min(lv.priority, rv.priority)
        return lv.lessThanOrEqual(rv, constant: rv.constant, multiplier: rv.multiplier, isActive: isActive, priority: priority)
    }

    @discardableResult
    public static func == (lv: Anchor, rv: CGFloat) -> NSLayoutConstraint  {
        switch lv.anchor {
        case .width:
            return lv.width(equalTo: rv, isActive: lv.isActive, priority: lv.priority)
        case .height:
            return lv.height(equalTo: rv, isActive: lv.isActive, priority: lv.priority)
        default:
            fatalError("You can use only width or height.")
        }
    }

    @discardableResult
    public static func >= (lv: Anchor, rv: CGFloat) -> NSLayoutConstraint  {
        switch lv.anchor {
        case .width:
            return lv.width(greaterThanOrEqualTo: rv, isActive: lv.isActive, priority: lv.priority)
        case .height:
            return lv.height(greaterThanOrEqualTo: rv, isActive: lv.isActive, priority: lv.priority)
        default:
            fatalError("You can use only width or height.")
        }
    }

    @discardableResult
    public static func <= (lv: Anchor, rv: CGFloat) -> NSLayoutConstraint  {
        switch lv.anchor {
        case .width:
            return lv.width(lessThanOrEqualTo: rv, isActive: lv.isActive, priority: lv.priority)
        case .height:
            return lv.height(lessThanOrEqualTo: rv, isActive: lv.isActive, priority: lv.priority)
        default:
            fatalError("You can use only width or height.")
        }
    }

    public static func + (lv: Anchor, rv: CGFloat) -> Anchor {
        lv.constant += rv
        return lv
    }

    public static func - (lv: Anchor, rv: CGFloat) -> Anchor {
        lv.constant -= rv
        return lv
    }

    public static func * (lv: Anchor, rv: CGFloat) -> Anchor {
        lv.multiplier = rv
        return lv
    }

    public static func / (lv: Anchor, rv: CGFloat) -> Anchor {
        lv.multiplier *= 1.0 / rv
        return lv
    }

    public static func ! (lv: Anchor, rv: UILayoutPriority) -> Anchor {
        lv.priority = rv
        return lv
    }
}

extension UIView {
    public var huggingHorizontalPriority: UILayoutPriority {
        get { contentHuggingPriority(for: .horizontal) }
        set { setContentHuggingPriority(newValue, for: .horizontal) }
    }
    public var huggingVerticalPriority: UILayoutPriority {
        get { contentHuggingPriority(for: .vertical) }
        set { setContentHuggingPriority(newValue, for: .vertical) }
    }
    public var compressionRegistanceHorizontalPriority: UILayoutPriority {
        get { contentCompressionResistancePriority(for: .horizontal) }
        set { setContentCompressionResistancePriority(newValue, for: .horizontal) }
    }
    public var compressionRegistanceVerticalPriority: UILayoutPriority {
        get { contentCompressionResistancePriority(for: .vertical) }
        set { setContentCompressionResistancePriority(newValue, for: .vertical) }
    }
}
#endif
