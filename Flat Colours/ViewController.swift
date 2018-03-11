//
//  ViewController.swift
//  Flat Colours
//
//  Created by Noah Wilder on 2018-03-09.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import UIKit
import ChameleonFramework

class New {
    var x : CGFloat = 0
    var y : CGFloat = 0
    var centerX : CGFloat = 0
    var centerY : CGFloat = 0
    var numberOfLabels : Int = 0
    static let label = New()
}

class Buttons {
    var array : [UIButton] = []
    static let access = Buttons()
}

class Colours {
    
    var array : [String] = ["FFFFFF"]
    static let used = Colours()
    static let attempts = Colours()
    var count : Int = 0
    var totalArray : [String] = []
}
class Switch {
    var count : Int = 4
    static let presses = Switch()
}

class ViewController: UIViewController {

    let greenColour = #colorLiteral(red: 0, green: 0.7883020043, blue: 0, alpha: 1).flatten()
    let redColour = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1).flatten()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialButton()
        
        makeObjects(labels: 48, columns: 8, spacing: 12.5, stretchToFit: true, spreadOut: false, circles: true, topPadding: 70)
        
            

    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    
    //MARK: - @IBAction buttonPressed

    
    
    @objc func buttonPressed(_ sender: UIButton!) {
        print(sender.tag)
        if sender.tag == 1000 {
            let button = sender!
            
            print(Switch.presses.count)
            if Switch.presses.count % 2 == 0 {
                button.backgroundColor = redColour
                button.setTitle("Delete", for: .normal)
                button.setTitleColor(UIColor.init(contrastingBlackOrWhiteColorOn: greenColour, isFlat: true), for: .normal)
                
                button.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 25)

                print("Delete".spaced())
//                button.titleLabel?.textColor = UIColor.init(contrastingBlackOrWhiteColorOn: redColour, isFlat: true)
//                button.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
            } else {
                button.setTitle("Show Hex", for: .normal)
                button.backgroundColor = greenColour
                button.setTitleColor(UIColor.init(contrastingBlackOrWhiteColorOn: greenColour, isFlat: true), for: .normal)
                button.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
                print("Show Hex".spaced())
            }
            
            Switch.presses.count += 1
            
        } else {
            if Switch.presses.count % 2 == 0 {
                
                print(sender.backgroundColor!.hexValue())

            } else {
                sender.removeFromSuperview()

            }
            
            
        }
    }
    
    
    
    
    
    
    
    func initialButton() {
        let square = UIButton.init(type: .custom)
        
        square.backgroundColor = greenColour
        // square.titleLabel?.text = "Show Hex"
        
        
        // square.setTitleColor(UIColor.init(contrastingBlackOrWhiteColorOn: square.backgroundColor!, isFlat: true), for: [.highlighted, .normal, .selected])
        
        square.frame = CGRect(x: view.center.x - 150, y: 35, width: 300, height: 50)
        square.titleLabel?.textAlignment = .center
        square.layer.masksToBounds = true
        square.layer.cornerRadius = 15
        square.tag = 1000
        
        square.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
        self.view.addSubview(square)
        //        let title = NSAttributedString(string: "Show Hex", attributes: [NSAttributedStringKey.foregroundColor : UIColor.init(contrastingBlackOrWhiteColorOn: square.backgroundColor!, isFlat: true), NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Bold", size: 10)!])
        //        square.setAttributedTitle(title, for: [.highlighted, .normal, .selected])
        square.setBackgroundColor(color: (square.backgroundColor?.darken(byPercentage: 0.2))!, forState: .highlighted)
        square.setTitle("Show Hex", for: .normal)
        square.backgroundColor = greenColour
        square.setTitleColor(UIColor.init(contrastingBlackOrWhiteColorOn: greenColour, isFlat: true), for: .normal)
        square.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
        print("Show Hex".spaced())
        
        
        
        let reset = UIButton.init(type: .custom)
        
        reset.frame = CGRect(x: view.frame.size.width - 40 - 25, y: square.center.y - 20, width: 40, height: 40)
        
        reset.setBackgroundImage("reload", for: .normal)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    func makeObjects(type: String = "button", labels: Int, columns: Int = 4, spacing: CGFloat = 30.asCGFloat(), stretchToFit: Bool = false, spreadOut: Bool = true, someRounded: Bool = false, circles: Bool = false, darkenIfUsed: Bool = false, topPadding : CGFloat = 0, bottomPadding: CGFloat = 0, leftPadding: CGFloat = 0, rightPadding: CGFloat = 0) {
        
        New.label.numberOfLabels = labels
        
        New.label.centerX = view.center.x
        New.label.centerY = view.center.y
        
        var sideX : CGFloat = 0
        var sideY : CGFloat = 0
        
        
        
        let rows : CGFloat = (labels / columns).asCGFloat()
        print(rows)
        
        New.label.x = leftPadding
        New.label.y = topPadding
        
        if stretchToFit {
            sideX = ((view.frame.size.width - leftPadding - rightPadding) - 60 - (spacing * (columns - 1).asCGFloat())) / columns.asCGFloat()
            sideY = ((view.frame.size.height - topPadding - bottomPadding) - 80 - (spacing * (rows - 1))) / rows
        } else {
            let side = view.frame.size.width / ((columns.asCGFloat() * 2.asCGFloat()) + 1.asCGFloat())
            sideX = side
            sideY = side
        }
        
        var spacingX : CGFloat = 0
        var spacingY : CGFloat = 0

        if spreadOut {
            spacingX = (view.frame.size.width - 60 - (sideX * columns.asCGFloat())) / (columns - 1).asCGFloat()
            spacingY = (view.frame.size.height - 80 - (sideY * rows)) / (rows - 1)
        } else {
            spacingX = spacing
            spacingY = spacing
        }
        
        New.label.y += 40
        
        
        for num in 0...labels - 1 {
            
            let width : CGFloat = sideX
            let height : CGFloat = sideY
           
            
            
            
            if num % columns == 0 && num != 0 {

                New.label.y += spacingY + height
                New.label.x = 30
            } else if num == 0 {
                New.label.x = 30
            } else {
                New.label.x += width
            }
            
            
            let x : CGFloat = New.label.x
            let y : CGFloat = New.label.y
            
            
            
            var newColourArray : [String] = ["FFFFFF"]
            var colourChecks = 0
            
            while Colours.used.array.contains(newColourArray.last!) {
                Colours.attempts.count += 1
                if Colours.used.array.count == 49 {
                    Colours.used.array = ["FFFFFF"]
                    newColourArray = ["FFFFFF"]
                }
                let newColour = UIColor.randomFlat.hexValue()
                let containsNewColour : Bool = newColourArray.contains(newColour)
                if containsNewColour == false {
                    newColourArray.append(newColour)
                    colourChecks += 1
                }
                print("\(Colours.attempts.count). \(newColourArray)".spaced())
                
             
            }
            Colours.used.array.append(newColourArray.last!)
            
            let squareColour = UIColor(hexString: Colours.used.array.last!)
            
            
            
            if type == "button" || type == "UIButton" {
                makeButton(num: num, view: view, x: x, y: y, width: width, height: height) { square in
                    
                    square.layer.masksToBounds = true
                    
                    let regularCR : CGFloat = (lowerValue(width.toDouble(), height.toDouble()) / 3.68).asCGFloat()  // Ratio --> 46 : 12.5 = 3.68 : 1
                    
                    square.layer.cornerRadius = regularCR
//
//                    square.setTitle("---", for: [.normal, .selected, .highlighted])
//                    square.titleLabel?.textAlignment = .center
//                    let contrastingColour = UIColor.init(contrastingBlackOrWhiteColorOn: squareColour!, isFlat: true)
//                    square.setTitleColor(contrastingColour, for: [.normal, .selected, .highlighted])
                    
                    let progressivelyDarkerBackgroundColour : UIColor = squareColour!.darken(byPercentage: (CGFloat((1.toDouble()/48.toDouble()) * (num.toDouble() + 1.toDouble()))))!
                   
                    guard var darkenedSquareColour = squareColour else { fatalError("squareColour doesn't exist.".spaced()) }
                    
                    if darkenIfUsed == false {
                        square.backgroundColor = squareColour!
                        Colours.used.totalArray.append(squareColour!.hexValue())
                    } else {
                        if Colours.used.totalArray.contains(darkenedSquareColour.hexValue()) {
                            repeat {
                                darkenedSquareColour = darkenedSquareColour.darken(byPercentage: 0.2)!
                            } while Colours.used.totalArray.contains(darkenedSquareColour.hexValue())
                            square.backgroundColor = darkenedSquareColour
                            Colours.used.totalArray.append(darkenedSquareColour.hexValue())
                        } else {
                            square.backgroundColor = squareColour!
                            Colours.used.totalArray.append(squareColour!.hexValue())
                        }
                    }
                    
                    
                    print(Colours.used.totalArray)
                    print(Colours.used.totalArray.count)
                    
                   
                    
                    let darkenedBackgroundColour = square.backgroundColor?.darken(byPercentage: 0.2)
                    
                    square.setBackgroundColor(color: darkenedBackgroundColour!, forState: .highlighted)
                    
                    let roundedRadius : CGFloat = lowerValue(width.toDouble(), height.toDouble()).half().asCGFloat()
                    
                    if someRounded {
                        if num % 2 != 0 {
                            square.layer.cornerRadius = roundedRadius
                        }
                    }
                    if circles {
                        square.layer.cornerRadius = roundedRadius
                    }
                    
                    Buttons.access.array.append(square)
                    
                    
                }
//                for num in 1...Buttons.access.array.count {
//                    Buttons.access.array[num - 1].tag = num
//                }
//                for num in 1...Buttons.access.array.count {
//                    print(Buttons.access.array[num - 1].tag)
//                }
                
            } else if type == "label" || type == "UILabel" {
                makeLabel(num: num, view: view, x: x, y: y, width: width, height: height)
            } else if type == "view" || type == "UIView" {
                makeView(num: num, view: view, x: x, y: y, width: width, height: height)
            } else {
                makeButton(num: num, view: view, x: x, y: y, width: width, height: height)
            }
            
            
                New.label.x += spacingX
            
        }
    }
    
    
    
    
    
} // END OF CLASS

















func makeButton(num: Int, view: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, isHighlighted: Bool = false, showsTouchWhenHighlighted: Bool = false, buttonType: UIButtonType = .custom, completion: ((UIButton) -> Void)? = nil) {
    
    let square = UIButton.init(type: buttonType)
    
    let vc = ViewController()
    
    square.isHighlighted = isHighlighted
    square.showsTouchWhenHighlighted = showsTouchWhenHighlighted
    
    square.frame = CGRect(x: x, y: y, width: width, height: height)
    square.tag = Colours.used.totalArray.count + 1
    square.backgroundColor = UIColor.flatMint
    
    square.addTarget(vc, action: #selector(vc.buttonPressed), for: .touchUpInside)
    
    view.addSubview(square)
    completion?(square)
}



func makeView(num: Int, view: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, completion: ((UIView) -> Void)? = nil) {
    let square = UIView()
    
    square.frame = CGRect(x: x, y: y, width: width, height: height)
    
    square.backgroundColor = UIColor.flatMint
    
    view.addSubview(square)
    completion?(square)
}

func makeLabel(num: Int, view: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, completion: ((UILabel) -> Void)? = nil) {
    let square = UILabel()
    
    square.frame = CGRect(x: x, y: y, width: width, height: height)
    
    square.backgroundColor = UIColor.flatMint
    
    view.addSubview(square)
    completion?(square)
}


func higherValue(_ num1: CGFloat, _ num2: CGFloat ) -> CGFloat {
    if num1 < num2 {
        return num1
    } else if num2 < num1 {
        return num2
    } else if num1 == num2 {
        return num1
    } else {
        let random = Int(arc4random_uniform(2)) + 1
        if random == 1 {
            return num1
        } else {
            return num2
        }
    }
}

func lowerValue(_ num1: Double, _ num2: Double ) -> Double {
    if num1 < num2 { return num1 } else if num2 < num1 { return num2 } else if num1 == num2 { return num1 } else { let random = Int(arc4random_uniform(2)) + 1; if random == 1 { return num1 } else { return num2 }}
}



extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
}

extension Int {
    
    func asCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    
    func half() -> Int {
        let half = self / 2
        return half
    }
    
    func double() -> Int {
        let double = self * 2
        return double
    }
    func toDouble() -> Double {
        return Double(self)
    }
    
}

extension CGFloat {
    
    func asInt() -> Int {
        return Int(self)
    }
    func half() -> CGFloat {
        let half = self / 2.asCGFloat()
        return half
    }
    
    func double() -> CGFloat {
        let double = self * 2.asCGFloat()
        return double
    }
    
    func toDouble() -> Double {
        return Double(self)
    }
    
}

extension Double {
    
    func half() -> Double {
        let half = self / 2
        return half
    }
    
    func asCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension String {
    
    func spaced(_ n: Int = 1) -> String {
        var returnString = "\(self)"
        for _ in 1...n {
            returnString = "\n\(returnString)\n"
        }
        return returnString
    }
    
}


