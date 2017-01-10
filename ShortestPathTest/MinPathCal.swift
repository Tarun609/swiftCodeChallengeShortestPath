//
// MinPathCal.swift
//  ShortestPathTest
//
//  Created by Tarun on 09/01/17.
//  Copyright © 2017 Rappier. All rights reserved.
//

import Foundation

class MinPathCal: NSObject
{
    
    // MARK: -Minimum adjacent value method
    
    /**
     checking which value is less and returning that value by using conditional operator.
     
     @param current matrix index value, first adjacent index value to current index value, second adjacent index value to current index value.
     
     @return minimum value.
     */
    
    func minAdjacentValue(fromCurrentindex currentindex: Int, adjacentIndexOne firstadjacentindex: Int, adjacentIndextwo secondadjacentindex: Int) -> Int
    {
        
        if currentindex < firstadjacentindex {
            return (currentindex < secondadjacentindex) ? currentindex : secondadjacentindex
        }
        else {
            return (firstadjacentindex < secondadjacentindex) ? firstadjacentindex : secondadjacentindex
        }
    }
    
    // MARK: -Shortest path value calculation method
    
    /**
     minimum cost method passing the array and path values in to to calculate minmum cost value and returing back to viewControllerclass method. It is a recursive method.
     
     @param array of matrix, path one value , path two value
     
     @return minimum shortest path value.
     */
    
    
    func minCostValue(withCost values: [[Int]], andPathOne pathone: Int, andPathTwo pathtwo: Int) -> Int {
        
        if pathtwo < 0 || pathone < 0 {
            return LONG_MAX
        }
        else if pathone == 0 && pathtwo == 0 {
            return CLong((Int(values[pathone][pathtwo])))
        }
        else {
            return CLong((Int(values[pathone][pathtwo]))) + self.minAdjacentValue(fromCurrentindex: self.minCostValue(withCost: values, andPathOne: pathone - 1, andPathTwo: pathtwo - 1), adjacentIndexOne: self.minCostValue(withCost: values, andPathOne: pathone - 1, andPathTwo: pathtwo), adjacentIndextwo: self.minCostValue(withCost: values, andPathOne: pathone, andPathTwo: pathtwo - 1))
        }
    }
}
