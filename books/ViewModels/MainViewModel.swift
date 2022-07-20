//
//  MainViewModel.swift
//  books
//
//  Created by Furry Canva on 7/21/22.
//

import Foundation

class MainViewModel
{
    var books = [BookModel]()
    func loadBooksByIndex(index: Int, completion: @escaping(_ error: String?) -> Void)
    {
        ////q=flowers&startIndex=0&maxResults=10
        let data = ["q": "flowers", "startIndex": index, "maxResults": "10"] as [String : Any]
        let url = "https://www.googleapis.com/books/v1/volumes"
        
        APIController().makeRequest(type: .get, url: url, parameters: data) {success,error,data in
            
            if (error != nil)
            {
                completion(error)
            }
            else
            {
                do
                {
                    let res = data as! NSDictionary
                    let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                    let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                    
                    let listBooks: [BookModel] = (BookResponse(JSONString: jsonString)?.items)!
                    self.books += listBooks
                    completion(nil)
                }
                catch
                {
                    completion(error.localizedDescription)
                }
            }
        }
    }
}
