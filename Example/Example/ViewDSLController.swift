//
//  ViewController.swift
//  Example
//
//  Created by PRIME on 20/03/19.
//

import UIKit
import ViewDSL

class ViewDSLController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let stack = view.add { (s: UIStackView) in
            s.axis = .vertical
            s.distribution = .fillEqually
            s.spacing = 10
            
            class BlueView: UIView {
                override func layoutSubviews() {
                    super.layoutSubviews()
                    backgroundColor = .blue
                }
            }
            
            s.add { (v: BlueView) in
                v.littleRedView {
                    $0.frame.origin = CGPoint(x: 100, y: 0)
                }
            }
            
            class CustomColorView: UIView {
                var bgColor: UIColor?  = nil {
                    didSet {
                        backgroundColor = bgColor
                    }
                }
            }
            
            s.add { (v: CustomColorView) in
                v.bgColor = UIColor.red.withAlphaComponent(0.5)
                v.littleRedView {
                    $0.frame.origin = CGPoint(x: 80, y: 0)
                }
            }
            
            s.add { (v: CustomColorView) in
                v.bgColor = .yellow
                v.littleRedView {
                    $0.frame.origin = CGPoint(x: 60, y: 0)
                }
            }
            s.dsl(delegatedTo: greenColorView(_:))
            s.dsl(delegatedTo: ColoredViews.blackColorView(_:))
            s.dsl(withInstanceOf: ColoredViews.self)
        }
        
        if let sp = stack.superview {
            // Constraint
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.topAnchor.constraint(
                equalTo: sp.topAnchor,
                constant: 20
                ).isActive = true
            
            stack.leftAnchor.constraint(
                equalTo: sp.leftAnchor,
                constant: 20
                ).isActive = true
            
            stack.bottomAnchor.constraint(
                equalTo: sp.bottomAnchor,
                constant: -20
                ).isActive = true
            
            stack.rightAnchor.constraint(
                equalTo: sp.rightAnchor,
                constant: -20
                ).isActive = true
        }
    }
    
    private func greenColorView(_ dsl: ViewDSL) {
        dsl.add { (v: UIView) in
            v.backgroundColor = .green
            v.littleRedView {
                $0.frame.origin = CGPoint(x: 40, y: 0)
            }
        }
    }
}

struct ColoredViews: InitializableLayoutBuilderDSL {
    static func blackColorView(_ dsl: ViewDSL) -> UIView {
        return dsl.add { (v: UIView) in
            v.backgroundColor = .black
            v.littleRedView {
                $0.frame.origin = CGPoint(x: 20, y: 0)
            }
        }
    }
    
    func layout(_ dsl: ViewDSL) {
        dsl.add { (v: UIView) in
            v.backgroundColor = .cyan
            v.littleRedView {
                $0.frame.origin = CGPoint(x: 40, y: 0)
            }
        }
        dsl.add { (v: UIView) in
            v.backgroundColor = .purple
            v.littleRedView {
                $0.frame.origin = CGPoint(x: 60, y: 0)
            }
        }
        dsl.add { (v: UIView) in
            v.backgroundColor = .gray
            v.littleRedView {
                $0.frame.origin = CGPoint(x: 80, y: 0)
            }
        }
        dsl.add { (v: UIView) in
            v.backgroundColor = UIColor.brown
            v.littleRedView {
                $0.frame.origin = CGPoint(x: 100, y: 0)
            }
        }
    }
}

class RedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .red
    }
}

extension ViewDSL where Self: UIView {
    @discardableResult
    func littleRedView(_ closure: (RedView) -> Void) -> RedView {
        return add { (v: RedView) in
            v.frame.size = CGSize(width: 20, height: 20)
            closure(v)
            v.layer.cornerRadius = 10
        }
    }
}
