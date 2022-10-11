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
//            print("1")
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
    let parsedCSV: [[String]] = content?.components(separatedBy: "\n").map{$0.components(separatedBy: ";")} ?? lawyersGlobal
    if NetworkMonitor.shared.isConnected{
        defaults.removeObject(forKey: "lawyersGlobal")
        
        defaults.set(content, forKey: "lawyersGlobal")
    }
    
    return parsedCSV
}
func parseCollegion()->([[String]]){
   
    
        let content = readStringFromURL(stringURL: "https://rka.by/upload/collegium.csv")
        let parsedCSV: [[String]] = content?.components(separatedBy: "\n").map{$0.components(separatedBy: ";")} ?? collegionssGlobal
    if NetworkMonitor.shared.isConnected{
        defaults.removeObject(forKey: "lawyersCollegion")
        defaults.set(content, forKey: "lawyersCollegion")
    }
    return parsedCSV
}
func parseConsults()->([[String]]){
   
    
        let content = readStringFromURL(stringURL:"https://rka.by/upload/lawConsultation.csv")
        let parsedCSV: [[String]] = content?.components(separatedBy: "\n").map{$0.components(separatedBy: ";")} ?? consultsGlobal
    if NetworkMonitor.shared.isConnected{
        defaults.removeObject(forKey: "lawyersConsults")
        defaults.set(content, forKey: "lawyersConsults")
    }
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
   
    return parsedCSV
}
func parseCollegionUserDefaults()->([[String]]){
   
    var content = String()
    if let name = defaults.string(forKey: "lawyersCollegion")
    {
        content = name
    }
   
    let parsedCSV: [[String]] = content.components(separatedBy: "\n").map{$0.components(separatedBy: ";")
        }
    
  
    return parsedCSV
}
func parseConsultsUserDefaults()->([[String]]){
   
    var content = String()
    if let name = defaults.string(forKey: "lawyersConsults")
    {
        content = name
    }
   
    let parsedCSV: [[String]] = content.components(separatedBy: "\n").map{$0.components(separatedBy: ";")
        }
 
    return parsedCSV
}

