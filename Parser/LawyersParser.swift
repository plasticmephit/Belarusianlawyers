//
//  LawyersParser.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import Foundation
import UIKit

func readStringFromURL(stringURL:String)-> String!{
    if let url = NSURL(string: stringURL) {
        do {
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
        let parsedCSV: [[String]] = content!.components(separatedBy: "\n").map{$0.components(separatedBy: ";")
           
        }
    return parsedCSV
}
 
//for i in 0...1854
//{
//    lawyers[i].id = parsedCSV[i][1]
//    lawyers[i].fio  = parsedCSV[i][2]
//    lawyers[i].numOfLicence = parsedCSV[i][3]
//    lawyers[i].dateOfLicence = parsedCSV[i][4]
//    lawyers[i].collegion = parsedCSV[i][5]
//    lawyers[i].addressOfWork = parsedCSV[i][6]
//    lawyers[i].mainTelephone = parsedCSV[7][i]
//    lawyers[i].otherTelephone = parsedCSV[i][8]
//    lawyers[i].messangers = parsedCSV[i][9]
//    lawyers[i].email = parsedCSV[i][10]
//    lawyers[i].oblast = parsedCSV[i][11]
//    lawyers[i].rayon = parsedCSV[i][12]
//    lawyers[i].naselenniyPunkt = parsedCSV[i][13]
//    lawyers[i].street = parsedCSV[i][14]
//    lawyers[i].numOfHome = parsedCSV[i][15]
//    lawyers[i].numOfCorpus = parsedCSV[i][16]
//    lawyers[i].numFlat = parsedCSV[i][17]
//    lawyers[i].grafic = parsedCSV[i][18]
//    lawyers[i].osnOtrPrava = parsedCSV[i][19]
//    lawyers[i].ssilkaPhoto = parsedCSV[i][20]
//    lawyers[i].gps = parsedCSV[i][21]
//    lawyers[i].ssilkaNaStr = parsedCSV[i][22]
//    lawyers[i].uridicheskayaKonsultacia = parsedCSV[i][1]
//    lawyers[i].specialization = parsedCSV[i][23]
//    lawyers[i].mediator = parsedCSV[i][24]
//    lawyers[i].foreing = parsedCSV[i][25]
//    lawyers[i].blagodarnost = parsedCSV[i][26]
//    lawyers[i].otvetor = parsedCSV[i][27]
//    lawyers[i].statey = parsedCSV[i][28]
//    lawyers[i].online = parsedCSV[i][29]
//    lawyers[i].about = parsedCSV[i][30]
//
//
//}
