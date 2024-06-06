//
//  File.swift
//  
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation

internal func InAppToDetailPrint(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
    #if DEBUG
    let logMessage = "\n=============❗️=============\n✉️ Message: \(message)\n📁 File: \(file):\(line)\n🤙 Function: \(function)\n=============❗️=============\n"
    print(logMessage)
    #endif
}

internal func InAppToPrint(_ string: String) {
    #if DEBUG
    print("👉 InAppToPrint: \(string)")
    #endif
}
