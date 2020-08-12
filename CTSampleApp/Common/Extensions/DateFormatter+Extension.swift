//
//  DateFormatter+Extension.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

internal var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .long
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter
}()

extension DateFormatter {
    
    func clServerDate(string: String) -> String? {
        self.locale = Locale(identifier: "en_GB")
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = self.date(from: string) else { return nil }
        
        self.dateFormat = "d MMM, yyyy"
        
        return self.string(from: date)
    }
}
