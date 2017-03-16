import Foundation

public enum ParseError: Error {
    case invalidCharacter(Character)
    case invalidRomanNumber(String)
}

extension Character {
    func romanDigit() -> Int? {
        
        switch self {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default:
            return nil
        }
        
    }
}

extension String {
    
    func isValidRomanNumber() -> Bool {
        return range(of: "^(?=[MDCLXVI])M*(C[MD]|D?C{0,3})(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$", options: .regularExpression) != nil
    }
    
    func romanNumeralToInt() throws -> Int  {
        
        if !uppercased().isValidRomanNumber() {
            
            for c in uppercased().characters {
                
                if c.romanDigit() == nil {
                    throw ParseError.invalidCharacter(c)
                }
                
            }
            
            throw ParseError.invalidRomanNumber(self.uppercased())
        }
        
        var result = 0
        var maxValue = 0
        
        for c in uppercased().characters.reversed() {
            if let value = c.romanDigit() {
                maxValue = max(value, maxValue)
                result += value == maxValue ? value : -value
            }
            
        }
        
        return result
    }
}
