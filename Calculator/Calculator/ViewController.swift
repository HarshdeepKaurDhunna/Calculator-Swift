//
//  ViewController.swift
//  Calculator
//
//  Created by Harshdeep Kaur Dhunna on 2/24/22.
//

import UIKit

class ViewController: UIViewController {
    
    var calculations:String = ""   //string to collect for calculation
    @IBOutlet weak var calculationArea: UILabel!    //input area label
    @IBOutlet weak var calculationResult: UILabel!  //output area label
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeAll()
    }
    
    /*
     Clear all data from input and output label
     */
    func removeAll(){
            calculations = ""
            calculationArea.text = ""
            calculationResult.text = ""
    }
    
    /*
     add input value to previous input by user to show on input label
     */
    func getCalculatorData(inputVal: String){
        calculations = calculations + inputVal
        calculationArea.text = calculations
    }
    
    /*
     Calculate the result by fetching from Calculation variable
     */
    func calculateResults(){
        let newFormatVal = calculations.replacingOccurrences(of: "%", with: "*0.01") // replace the value for percentage
        
        /*
         In an NSPredicate, comparison procedures are derived from two expressions that are instances of the NSExpression class. To
         make constant value expressions, key path expressions, and so on.
         */
        let expressionVal = NSExpression(format: newFormatVal)
        
        let computationResult = expressionVal.expressionValue(with: nil, context: nil) as! Double
        
        
        let resultString = formatOutpulVal(result: computationResult) //format the result
        calculationResult.text = resultString //Display the result in result label
        
    }
    
    /*
     Formatter used for formatting data
     */
    func formatOutpulVal(result: Double)-> String{
            if(result.truncatingRemainder(dividingBy: 1)==0)
            {
                return String(format: "%.0f", result)
            }
            else{
                return String(format: "%.2f", result)
            }
            
    }
    
   //Clear All data
    @IBAction func removeAllFunc(_ sender: Any) {
        removeAll()
        
    }
    
    @IBAction func deleteFunc(_ sender: Any) {
        if(!calculations.isEmpty){
            calculations.removeLast()
            calculationArea.text = calculations
        }
    }
    
    @IBAction func percentageFunc(_ sender: Any) {
        getCalculatorData(inputVal: "%")
    }
    
    @IBAction func modulusFunc(_ sender: Any) {
        getCalculatorData(inputVal: "/")
    }
    
    @IBAction func multiplyFunc(_ sender: Any) {
        getCalculatorData(inputVal: "*")
    }
    
    @IBAction func minusFunc(_ sender: Any) {
        getCalculatorData(inputVal: "-")
    }
    
    @IBAction func plusFunc(_ sender: Any) {
        getCalculatorData(inputVal: "+")
    }
    
    @IBAction func equalFunc(_ sender: Any) {
        calculateResults()
        
    }
    
    @IBAction func calDigitNine(_ sender: Any) {
        getCalculatorData(inputVal: "9")
    }
    
    @IBAction func calDigitEight(_ sender: Any) {
        getCalculatorData(inputVal: "8")
    }
    
    
    @IBAction func CalDigitSven(_ sender: Any) {
        getCalculatorData(inputVal: "7")
    }

    @IBAction func calDigitSix(_ sender: Any) {
        getCalculatorData(inputVal: "6")
    }
    
    @IBAction func calDigitFive(_ sender: Any) {
        getCalculatorData(inputVal: "5")
    }

    @IBAction func calDigitFour(_ sender: Any) {
        getCalculatorData(inputVal: "4")
    }
    
    @IBAction func calDigitThree(_ sender: Any) {
        getCalculatorData(inputVal: "3")
    }
    
    @IBAction func calDigitTwo(_ sender: Any) {
        getCalculatorData(inputVal: "2")
    }
    
    @IBAction func calDigitOne(_ sender: Any) {
        getCalculatorData(inputVal: "1")
    }
    
    @IBAction func calDigitZero(_ sender: Any) {
        getCalculatorData(inputVal: "0")
    }
    
    @IBAction func calDigitDot(_ sender: Any) {
        getCalculatorData(inputVal: ".")
    }
}

