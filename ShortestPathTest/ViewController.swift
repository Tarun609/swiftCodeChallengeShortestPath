//
//  ViewController.h
//  ShortestPathTest
//
//  Created by Tarun on 09/01/17.
//  Copyright © 2017 Rappier. All rights reserved.
//
import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var matrixValues: UITextField!
    @IBOutlet weak var addValuesBtn: UIButton!
    @IBOutlet weak var shortestPathValueLbl: UILabel!
    @IBOutlet weak var numberOfCoumns: UITextField!
    @IBOutlet weak var numberOfRows: UITextField!
    @IBOutlet weak var calcShortestPathBtn: UIButton!
    
    var minCal:MinPathCal?
    
    var arr_matrix = [[Int]]()
    var trackvalueofmatrixvalueArrayindex = 0
    
    
    // MARK: - viewdidload method
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        minCal = MinPathCal();
        
    }
    
    // MARK: - Method adding values to the Matrix
    
    /**
     Getting the values of rows and columns and also getting the values for matrix. After that adding them to array to make matrix and also check weather User enter the right amount of values or not.
     
     @param UIbutton.
     
     */
    @IBAction func methodAddingValuesToMatrix(sender: UIButton)
    {
        
        self.view.endEditing(true) // Resigning the keyboard
        
        let txtfieldValues = self.matrixValues!.text
        var arr_matrixvalues = txtfieldValues?.componentsSeparatedByString(",")
        let rowsCount = Int(self.numberOfRows!.text!)!
        let columnCount = Int(self.numberOfCoumns!.text!)!
        
        
        /**
         Checking the values weather user enter exact number of integers as per rows and columns defined by him or not.
         */
        
        if(arr_matrixvalues!.count >= rowsCount+columnCount)
        {
            
            print("array have enough values")
            
            for _ in 0..<rowsCount    //adding arr_temp values to arr_matrix array in matrix form.
            {
                var inner = [Int]()
                
                for _ in 0..<columnCount  // loop for inner values
                {
                    inner.append(Int(arr_matrixvalues![trackvalueofmatrixvalueArrayindex])!)
                    trackvalueofmatrixvalueArrayindex += 1 // adding values to the inner array
                }
                arr_matrix.append(inner) // adding inner array to the main array
                
            }
            
            
            self.calcShortestPathBtn?.hidden = false // Un-hiding the buttons
            self.addValuesBtn?.hidden = true          // hidding the buttons
            
        }
        else
        {
            print("You need to have enter exact number of values as per rows and columns defined")
            
            let alert = UIAlertController(title: "Alert", message: "You need to have enter exact number of values as per rows and columns defined", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    // MARK: - Method calculating shortest path of the Matrix
    
    
    /**
     Calculating the shortest path value by calling the Minpathcal model class and passing the required paramters to that.
     
     @param UIbutton.
     
     */
    
    @IBAction func methodCalculateShortestPath(sender: UIButton)
    {
        
        
        self.view.endEditing(true)// Resigning the textfield
        
        
        self.shortestPathValueLbl?.hidden = false  // Un hiding the label
        
        
        self.shortestPathValueLbl!.text="\(minCal!.minCostValue(withCost: arr_matrix, andPathOne: Int(arr_matrix.count) - 1, andPathTwo: Int(arr_matrix.first!.count) - 1))"  // assinginig the value to label
    }
    
    
    // MARK: -didReceiveMemorywarning method
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning() // Dispose of any resources that can be recreated.
        
    }
    
    
}

