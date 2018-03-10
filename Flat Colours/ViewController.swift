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
    static let label = New()
}

class Colours {
    
    var array : [String] = ["FFFFFF"]
    static let used = Colours()
    static let attempts = Colours()
    var count : Int = 0
    var totalArray : [String] = []
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        makeObjects(labels: 120, columns: 8, spacing: 12.5, stretchToFit: true, spreadOut: true, circles: true)
        

    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func makeObjects(type: String = "button", labels: Int, columns: Int = 4, spacing: CGFloat = 30.asCGFloat(), stretchToFit: Bool = false, spreadOut: Bool = true, someRounded: Bool = false, circles: Bool = false, darkenIfUsed: Bool = false) {
        
        New.label.centerX = view.center.x
        New.label.centerY = view.center.y
        
        var sideX : CGFloat = 0
        var sideY : CGFloat = 0
        
        let rows : CGFloat = (labels / columns).asCGFloat()
        print(rows)
        
        if stretchToFit {
            sideX = (view.frame.size.width - 60 - (spacing * (columns - 1).asCGFloat())) / columns.asCGFloat()
            sideY = (view.frame.size.height - 80 - (spacing * (rows - 1))) / rows
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
        
        New.label.y = 40
        
        
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
                    square.tag = num + 1
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
                }
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
}








func makeButton(num: Int, view: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, isHighlighted: Bool = false, showsTouchWhenHighlighted: Bool = false, buttonType: UIButtonType = .custom, completion: ((UIButton) -> Void)? = nil) {
    let square = UIButton.init(type: buttonType)
    
    square.isHighlighted = isHighlighted
    square.showsTouchWhenHighlighted = showsTouchWhenHighlighted
    
    square.frame = CGRect(x: x, y: y, width: width, height: height)
    
    square.backgroundColor = UIColor.flatMint
    
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

func lowerValue(_  num1: Double, _  num2: Double ) -> Double {
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


