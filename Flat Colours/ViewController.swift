//
//  ViewController.swift
//  Flat Colours
//
//  Created by Noah Wilder on 2018-03-09.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import UIKit
import ChameleonFramework
import PKHUD

class New {
    var x : CGFloat = 0
    var y : CGFloat = 0
    var centerX : CGFloat = 0
    var centerY : CGFloat = 0
    var numberOfLabels : Int = 0
    static let label = New()
}
class Color {
    static let print = Color()
    var array : [String] = []
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
class MakeObject {
    var initialMake = false
    static let preferences = MakeObject()
    
    var type: String = "button"
    var labels: Int = 0
    var columns: Int = 4
    var spacing: CGFloat = 30.asCGFloat()
    var stretchToFit: Bool = false
    var spreadOut: Bool = true
    var someRounded: Bool = false
    var circles: Bool = false
    var darkenIfUsed: Bool = false
    var topPadding : CGFloat = 0
    var bottomPadding: CGFloat = 0
    var leftPadding: CGFloat = 0
    var rightPadding: CGFloat = 0
    var printStuff: Bool = false
    var oneColour: UIColor? = nil
    
}

class ViewController: UIViewController {

    let greenColour = #colorLiteral(red: 0, green: 0.7883020043, blue: 0, alpha: 1).flatten()
    let redColour = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1).flatten()
    let printColour = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1).flatten()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialButton()
        
      //  makeObjects(labels: 48, columns: 4, spacing: 2, stretchToFit: false, spreadOut: false, circles: false, topPadding: 70, bottomPadding: 55, showContrastingText: true)
        makeObjects(labels: 48, columns: 6)
//makeObjects(type: <#T##String#>, labels: <#T##Int#>, columns: <#T##Int#>, spacing: <#T##CGFloat#>, stretchToFit: <#T##Bool#>, spreadOut: <#T##Bool#>, spreadOutWithHorizontalSpacing: <#T##Bool#>, spreadOutWithVerticalSpacing: <#T##Bool#>, someRounded: <#T##Bool#>, circles: <#T##Bool#>, darkenIfUsed: <#T##Bool#>, topPadding: <#T##CGFloat#>, bottomPadding: <#T##CGFloat#>, leftPadding: <#T##CGFloat#>, rightPadding: <#T##CGFloat#>, printStuff: <#T##Bool#>, oneColour: <#T##UIColor?#>, showContrastingText: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)

    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    
    //MARK: - @IBAction buttonPressed

    
    
    @objc func buttonPressed(_ sender: UIButton!) {
        print("sender.tag = \(sender.tag)".spaced())
        
        if sender.tag % 1000 == 0 {
            if sender.tag == 3000 {
                var colourPrintString = "\n********************************\n\nColours:\n"
                var colourCount = 0
                for num in 1...Color.print.array.count {
                    if Color.print.array[num - 1] != "Removed" {
                        colourCount += 1
                        colourPrintString.append("\t\(colourCount). \(Color.print.array[num - 1])\n")
                    }
                    
                }
                colourPrintString.append("\n********************************")
                print(colourPrintString)
                
            } else if sender.tag == 2000 {
                spin(with: .curveLinear, for: sender)
                startSpin(sender)
                
                for currentView in self.view.subviews {
                    if currentView.tag % 1000 != 0 {
                        currentView.removeFromSuperview()
                    }
                    
                }
                self.makeObjects(type: MakeObject.preferences.type, labels: MakeObject.preferences.labels, columns: MakeObject.preferences.columns, spacing: MakeObject.preferences.spacing, stretchToFit: MakeObject.preferences.stretchToFit, spreadOut: MakeObject.preferences.spreadOut, someRounded: MakeObject.preferences.someRounded, circles: MakeObject.preferences.circles, darkenIfUsed: MakeObject.preferences.darkenIfUsed, topPadding: MakeObject.preferences.topPadding, bottomPadding: MakeObject.preferences.bottomPadding, leftPadding: MakeObject.preferences.leftPadding, rightPadding: MakeObject.preferences.rightPadding)
                
                
                
                
            } else if sender.tag == 1000 {
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
            }
        } else {
            if Switch.presses.count % 2 == 0 {
                
                print("\n********************************\n\nColour:\n\t1. \(sender.backgroundColor!.hexValue())\n\n********************************\n")
                HUD.allowsInteraction = false
                HUD.flash(.label(sender.backgroundColor!.hexValue()), delay: 1.25)
                
                
                
            } else {
                
                Color.print.array[sender.tag - 1] = "Removed"
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
       // print("Show Hex".spaced())
        
        
        
        let reset = UIButton.init(type: .custom)
        
        reset.frame = CGRect(x: view.frame.size.width - 35 - 10, y: square.frame.origin.y, width: 35, height: 35)
        reset.setImage(UIImage(named: "reload"), for: .normal)
        reset.contentMode = .scaleAspectFill
    
        reset.layer.masksToBounds = true
        reset.layer.cornerRadius = reset.frame.size.width / 2
        reset.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
        reset.tag = 2000
        
        reset.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
        self.view.addSubview(reset)
        
        reset.setBackgroundColor(color: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), forState: .normal)
        
        
        let show = UIButton.init(type: .custom)
        
        show.backgroundColor = greenColour
        // square.titleLabel?.text = "Show Hex"
        
        
        // square.setTitleColor(UIColor.init(contrastingBlackOrWhiteColorOn: square.backgroundColor!, isFlat: true), for: [.highlighted, .normal, .selected])
        
        show.frame = CGRect(x: view.center.x - 150, y: view.frame.size.height - 45 - 25, width: 300, height: 45)
        show.titleLabel?.textAlignment = .center
        show.layer.masksToBounds = true
        show.layer.cornerRadius = 13.5
        show.tag = 3000
        
        show.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
        self.view.addSubview(show)
        //        let title = NSAttributedString(string: "Show Hex", attributes: [NSAttributedStringKey.foregroundColor : UIColor.init(contrastingBlackOrWhiteColorOn: square.backgroundColor!, isFlat: true), NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Bold", size: 10)!])
        //        square.setAttributedTitle(title, for: [.highlighted, .normal, .selected])
        show.setBackgroundColor(color: (square.backgroundColor?.darken(byPercentage: 0.2))!, forState: .highlighted)
        show.setTitle("Print Colours", for: .normal)
        show.backgroundColor = printColour
        show.setTitleColor(.white, for: .normal)
        show.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
        
        
    }
/******************************************************/
//MARK: - Spin Animation
    var animating = false
    
    func spin(with options: UIViewAnimationOptions, for button: UIButton) {
        // this spin completes 360 degrees every 2 seconds
        UIView.animate(withDuration: 0.5, delay: 0, options: options, animations: {() -> Void in
            button.transform = button.transform.rotated(by: .pi / 2)
        }, completion: {(_ finished: Bool) -> Void in
            if finished {
                if self.animating {
                    // if flag still set, keep spinning with constant speed
                    self.spin(with: .curveLinear, for: button)
                }
                else if options != .curveEaseOut {
                    // one last spin, with deceleration
                    self.spin(with: .curveEaseOut, for: button)
                }
            }
        })
    }
    func startSpin(_ button: UIButton) {
        if !animating {
            animating = true
            spin(with: .curveEaseIn, for: button)
        }
    }
    
    func stopSpin() {
        // set the flag to stop spinning after one last 90 degree increment
        animating = false
    }
    
    
    
    
    
    
    
    
/******************************************************/
//MARK: - Make Objects
    
    
    func makeObjects(type: String = "button", labels: Int, columns: Int = 4, spacing space: CGFloat = 5.asCGFloat(), stretchToFit: Bool = false, spreadOut: Bool = true, spreadOutWithHorizontalSpacing: Bool = false, spreadOutWithVerticalSpacing: Bool = false, someRounded: Bool = false, circles: Bool = false, darkenIfUsed: Bool = false, topPadding : CGFloat = 70, bottomPadding: CGFloat = 55, leftPadding: CGFloat = 0, rightPadding: CGFloat = 0, printStuff: Bool = false, oneColour: UIColor? = nil, showContrastingText: Bool = false, completion: (() -> Void)? = nil) {
        
        var spacing : CGFloat = space
        
        if MakeObject.preferences.initialMake == false {
            MakeObject.preferences.type = type
            MakeObject.preferences.labels = labels
            MakeObject.preferences.columns = columns
            MakeObject.preferences.spacing = spacing
            MakeObject.preferences.stretchToFit = stretchToFit
            MakeObject.preferences.spreadOut = spreadOut
            MakeObject.preferences.someRounded = someRounded
            MakeObject.preferences.circles = circles
            MakeObject.preferences.darkenIfUsed = darkenIfUsed
            MakeObject.preferences.topPadding  = topPadding
            MakeObject.preferences.bottomPadding = bottomPadding
            MakeObject.preferences.leftPadding = leftPadding
            MakeObject.preferences.rightPadding = rightPadding
            MakeObject.preferences.printStuff = printStuff
            MakeObject.preferences.oneColour = oneColour
            MakeObject.preferences.initialMake = true
        }
        
        (New.label.centerX, New.label.centerY, New.label.x, New.label.y, New.label.numberOfLabels) = (0,0,0,0,0)
        (Colours.attempts.array, Colours.attempts.count, Colours.attempts.totalArray) = (["FFFFFF"], 0, [])
        (Colours.used.array, Colours.used.count, Colours.used.totalArray) = (["FFFFFF"], 0, [])
        
        Color.print.array = []
        
        New.label.numberOfLabels = labels
        
        New.label.centerX = view.center.x
        New.label.centerY = view.center.y
        
        var sideX : CGFloat = 0
        var sideY : CGFloat = 0
       
        
        
        
        let rows : CGFloat = (labels / columns).asCGFloat()
        
        if printStuff {
            print("Rows: \(rows)")
        }
        spacing = higherValue((columns.asCGFloat() / 2) + (rows / columns.asCGFloat()), (rows / 2) + (columns.asCGFloat() / rows))
        
        New.label.x = leftPadding
        New.label.y = topPadding
        
        if stretchToFit {
            sideX = ((view.frame.size.width - leftPadding - rightPadding) - 60 - (spacing * (columns - 1).asCGFloat())) / columns.asCGFloat()
            sideY = ((view.frame.size.height - topPadding - bottomPadding) - 80 - (spacing * (rows - 1))) / rows
        } else {
            var side : CGFloat = lowerValue((((view.frame.size.width - leftPadding - rightPadding) - 60 - (spacing * (columns - 1).asCGFloat())) / columns.asCGFloat()).toDouble(), (((view.frame.size.height - topPadding - bottomPadding) - 80 - (spacing * (rows - 1))) / rows).toDouble()).asCGFloat()
            
            if spreadOutWithHorizontalSpacing {
                side = ((view.frame.size.width - leftPadding - rightPadding) - 60 - (spacing * (columns - 1).asCGFloat())) / columns.asCGFloat()
            } else if spreadOutWithVerticalSpacing {
                side = ((view.frame.size.height - topPadding - bottomPadding) - 80 - (spacing * (rows - 1))) / rows
            }
            
            sideX = side
            sideY = side
        }
        
        var spacingX : CGFloat = 0
        var spacingY : CGFloat = 0

        if spreadOut {
            spacingX = (view.frame.size.width  - leftPadding - rightPadding - 60 - (sideX * columns.asCGFloat())) / (columns - 1).asCGFloat()
            spacingY = (view.frame.size.height - topPadding - bottomPadding - 80 - (sideY * rows)) / (rows - 1)
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
                if printStuff {
                    print("\(Colours.attempts.count). \(newColourArray)".spaced())
                }
                
             
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
                    
                    
                    if let _ = oneColour {
                        let progressivelyDarkerBackgroundColour : UIColor = squareColour!.darken(byPercentage: (CGFloat((1.toDouble()/48.toDouble()) * (num.toDouble() + 1.toDouble()))))!
                        square.backgroundColor = progressivelyDarkerBackgroundColour
                        Colours.used.totalArray.append(progressivelyDarkerBackgroundColour.hexValue())
                        
                    } else {
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
                    }
                    
                    if printStuff {
                        print(Colours.used.totalArray)
                        print(Colours.used.totalArray.count)
                    }
                    
                    
                   
                    
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
                    if showContrastingText {
                        square.setTitle("||\n||", for: .normal)
                        square.setTitleColor(UIColor.init(contrastingBlackOrWhiteColorOn: square.backgroundColor!, isFlat: true), for: .normal)
                        
                        square.titleLabel?.numberOfLines = 2
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
        stopSpin()
        if printStuff {
            print("".spaced(5))
        }
        Color.print.array = Colours.used.totalArray
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

extension Int {
    
    func factors(of n: Int) -> [Int] {
        precondition(n > 0, "n must be positive")
        let sqrtn = Int(Double(n).squareRoot())
        var factors: [Int] = []
        factors.reserveCapacity(2 * sqrtn)
        for i in 1...sqrtn {
            if n % i == 0 {
                factors.append(i)
            }
        }
        var j = factors.count - 1
        if factors[j] * factors[j] == n {
            j -= 1
        }
        while j >= 0 {
            factors.append(n / factors[j])
            j -= 1
        }
        
        if factors.count % 2 == 0 {
            let first = factors[(factors.count / 2) - 1]
            let second = factors[factors.count / 2]
            return [first, second]
        } else if factors.count % 2 != 0 {
            let num = factors[(factors.count + 1) / 2]
            return [num, num]
        } else {
            return factors
        }
    }
    
    func midFactors() -> [Int] {
        let n = self
        print("\n")
        precondition(n > 0, "n must be positive")
        let sqrtn = Int(Double(n).squareRoot())
        var factors: [Int] = []
        factors.reserveCapacity(2 * sqrtn)
        for i in 1...sqrtn {
            if n % i == 0 {
                factors.append(i)
            }
        }
        var j = factors.count - 1
        if factors[j] * factors[j] == n {
            j -= 1
        }
        while j >= 0 {
            factors.append(n / factors[j])
            j -= 1
        }
        
        if factors.count % 2 == 0 {
            let first = factors[(factors.count / 2) - 1]
            let second = factors[factors.count / 2]
            return [first, second]
        } else if factors.count % 2 != 0 {
            let num = factors[((factors.count + 1) / 2) - 1]
            return [num, num]
            return factors
        } else {
            return factors
        }
    }
}

