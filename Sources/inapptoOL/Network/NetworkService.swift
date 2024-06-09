//
//  File.swift
//
//
//  Created by Erkam Kucet on 6.06.2024.
//

import Foundation

public class NetworkService {
    
    public init() {}
    
    public func send<T: Decodable>(_ request: NetworkRequest, responseType: T.Type) async throws -> T {
        guard let url = request.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return decodedResponse
            } catch {
                throw NetworkError.decodingFailed
            }
            
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}
