//
//  LawyersParser.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import Foundation
import UIKit
let defaults = UserDefaults.standard
func readStringFromURL(stringURL:String)-> String!{
    if let url = NSURL(string: stringURL) {
        do {
            print("1")
            return try String(contentsOf: url as URL, encoding: .utf8)
        } catch {
            print("Cannot load contents")
            return nil
        }
    } else {
        print("String was not a URL")
        return nil
    }
}
func parseLawyers()->([[String]]){
   
    
        let content = readStringFromURL(stringURL: "https://rka.by/upload/lawyers.csv")
        let parsedCSV: [[String]] = content!.components(separatedBy: "\n").map{$0.components(separatedBy: ";")}
    defaults.removeObject(forKey: "lawyersGlobal")
    defaults.set(content, forKey: "lawyersGlobal")
    print("2")
    return parsedCSV
}
func parseLawyersUserDefaults()->([[String]]){
   
    var content = String()
    if let name = defaults.string(forKey: "lawyersGlobal")
    {
        content = name
    }
   
    let parsedCSV: [[String]] = content.components(separatedBy: "\n").map{$0.components(separatedBy: ";")
        }
    
    print("3")
    return parsedCSV
}
 

