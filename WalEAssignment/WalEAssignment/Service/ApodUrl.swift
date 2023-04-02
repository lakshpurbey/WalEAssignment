//
//  ApodUrl.swift
//  WalEAssignment
//
//  Created by Mac on 02/04/2023.
//

import Foundation

struct ApiEndpoints {

    let apodURL: String

    init(date:String) {
        self.apodURL = "https://\(Constants.getApodBaseURL())/planetary/apod?api_key=\(Constants.getAPIKey())&date=\(date)"
    }

}
