//
//  HttpUtility.swift
//  WalEAssignment
//
//  Created by Mac on 02/04/2023.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?, _ error:String?)-> Void)
    {
        debugPrint(requestUrl)
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in

            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                do {
                    debugPrint("API Success")
                    let result = try JSONDecoder().decode(T.self, from: responseData!)
                    _=completionHandler(result,nil)
                }
                catch let error {
                    debugPrint("API error occured while decoding = \(error.localizedDescription)")
                    _=completionHandler(nil,error.localizedDescription)
                }
            }else {
                debugPrint("API Failed")
                _=completionHandler(nil,"We are not connected to the internet, showing you the last image we have.")
            }

        }.resume()
    }
}
