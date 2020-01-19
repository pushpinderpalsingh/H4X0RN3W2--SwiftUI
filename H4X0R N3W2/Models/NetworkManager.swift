//
//  NetworkManager.swift
//  H4X0R N3W2
//
//  Created by Pushpinder Pal Singh on 17/01/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import Foundation

class NetworkingManager: ObservableObject{
    
 @Published   var posts = [Post]()
    
    func fetchData(){

        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: { ( data, response , error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                          let results = try decoder.decode(Results.self, from:safeData )
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }
                        catch{
                            print(error)
                        }
                    }}
              })
            task.resume()
        }
    }
}
