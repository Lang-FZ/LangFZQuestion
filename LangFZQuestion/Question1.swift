//
//  Question1.swift
//  LangFZQuestion
//
//  Created by LFZ on 2020/10/7.
//  Copyright © 2020 LFZ. All rights reserved.
//

import Foundation

extension String {

    /*
        Given a string str consisting of letters only and an integer n, the task is to replace every character of the given string by a character which is n times more than it. If the letter exceeds ‘z’, then start checking from ‘a’ in a cyclic manner.
        
        Examples:
        Input: str = “abc”, n = 2
        Output: cde
        a is moved by 2 times which results in character c
        b is moved by 2 times which results in character d
        c is moved by 2 times which results in character e
        
        Input: str = “abc”, n= 28
        Output: cde
        a is moved 25 times, z is reached. Then the 26th character will be a, 27th b and 28th c.
        b is moved 24 times, z is reached. 28-th is d.
        c is moved 23 times, z is reached. 28-th is f.
    */
    public func moveCharacter(_ stepNumber:Int) -> String {
        
        guard stepNumber > 0 else {
            if stepNumber == 0 { return self }
            return "Step Number Error"
        }
        guard self.isLowercaseString() else {
            return "Characters Error"
        }
        
        return self.moveSteps(stepNumber % 26)
    }
    
    private func isLowercaseString() -> Bool {
        
        var cs:CharacterSet?
        cs = CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyz").inverted
        let filtered:String = self.replacingOccurrences(of: " ", with: "").components(separatedBy: cs!).joined(separator: "")
        
        if filtered != self.replacingOccurrences(of: " ", with: "") {
            return false
        }
        
        return true
    }
    
    private func moveSteps(_ num:Int) -> String {
        
        var result: String = ""
        
        for code in self.unicodeScalars {
            
            if Int(code.value) + num > 122 {
                result.append(Character(UnicodeScalar(Int(code.value) + num - 26) ?? code))
            } else {
                result.append(Character(UnicodeScalar(Int(code.value) + num) ?? code))
            }
        }
        
        return result
    }
}

