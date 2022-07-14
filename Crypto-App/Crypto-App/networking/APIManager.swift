//
//  APIManager.swift
//  Crypto-App
//
//  Created by Marky Jordan on 7/13/22.
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    
    private struct Constants {
        static let apikey = "C3CD5C9B-3D38-49DD-BCA8-F1A61B9236BD"
        static let assetsEndpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {
        
    }
    
    public func getCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.apikey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                // Decode the json response.
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(cryptos))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
