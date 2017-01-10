//
//  ShortestPathUnitTest.m
//  ShortestPathUnitTest
//
//  Created by Tarun on 09/01/17.
//  Copyright © 2017 Rappier. All rights reserved.
//
import XCTest
class ShortestPathUnitTest: XCTestCase
{
    
    // MARK: - Default Test Methods
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // MARK: - Test Method to test values adding to the array or not.
    
    func testAddValuesToArry()
    {
        let txtfieldValues = "1,2,3,4,5,6"
        let arr = txtfieldValues.componentsSeparatedByString(",")
        XCTAssertNotNil(arr)
    }
    
    // MARK: -Test Method to Check adjacent values to index and verify which is maximum or minimum
    
    func testMinAdjacentValue()
    {
        let currentindex=5;
        let firstadjacentindex=10;
        let secondadjacentindex=25;
        
        if currentindex < firstadjacentindex
        {
            XCTAssertGreaterThan((firstadjacentindex < secondadjacentindex) ?firstadjacentindex : secondadjacentindex,firstadjacentindex ,"secondajacent is greater than firstadjacent")
            
        }
        else {
            XCTAssertGreaterThan((firstadjacentindex < secondadjacentindex) ? firstadjacentindex : secondadjacentindex,secondadjacentindex ,"firstadjacent is greater than secondajacent")
        }
    }
    
    // MARK: - Test Method to check Adjacent index values which is maximum or minimum
    
    func testAdjacentValue(fromValue1 currentindex: Int, andValue2 firstadjacentindex: Int, andValue3 secondadjacentindex: Int)
    {
        if currentindex < firstadjacentindex
        {
            XCTAssertGreaterThan((firstadjacentindex < secondadjacentindex) ?firstadjacentindex : secondadjacentindex,firstadjacentindex ,"secondajacent is greater than firstadjacent")
            
        }
        else {
            XCTAssertGreaterThan((firstadjacentindex < secondadjacentindex) ? firstadjacentindex : secondadjacentindex,secondadjacentindex ,"firstadjacent is greater than secondajacent")
        }
    }
    
    // MARK: - Test Method to make matrix and to check call to MinCostValue Method
    
    func testMatrixCreation()
    {
        var matrix_arr = [[Int]]()
        var trackvalueoftemparrayindex = 0
        
        // we create three simple string arrays for testing
        let temp = ["1", "2", "3", "4","12","12","18","12","9"]
        
        // then add them all to the "groups" array
        
        for _ in 0..<3    //adding arr_temp values to arr_matrix array in matrix form.
        {
            var inner = [Int]()
            
            for _ in 0..<3  // loop for inner values
            {
                inner.append(Int(temp[trackvalueoftemparrayindex])!)
                trackvalueoftemparrayindex += 1 // adding values to the inner array
            }
            matrix_arr.append(inner) // adding inner array to the main array
        }
        
        
        XCTAssertNotNil(self .testMinCostValue(withCost: matrix_arr, andPath1:  Int(matrix_arr.first!.count) - 1, andPath2:  Int(matrix_arr.first!.count) - 1))
        
    }
    
    // MARK: - Test Method to calculate minimum cost value
    
    func testMinCostValue(withCost values: [[Int]], andPath1 pathone: Int, andPath2 pathtwo: Int) {
        
        if pathtwo < 0 || pathone < 0 {
            XCTAssertNotNil(LONG_MAX)
        }
        else if pathone == 0 && pathtwo == 0 {
            XCTAssertNotNil(CLong((Int(values[pathone][pathtwo]))))
        }
        else {
            //XCTAssertNotNil(CLong((Int(values[pathone][pathtwo]))) + self.testAdjacentValue(fromValue1: self.testminCostValue(withCost: values, andPath1: pathone - 1, andPath2: pathtwo - 1), andValue2: self.testminCostValue(withCost: values, andPath1: pathone - 1, andPath2: pathtwo), andValue3: self.testminCostValue(withCost: values, andPath1: pathone, andPath2: pathtwo - 1)))
        }
        
    }
}
