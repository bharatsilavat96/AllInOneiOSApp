//
//  Network.swift
//  DFAssesment
//
//  Created by Bharat Shilavat on 29/11/23.
//

import Foundation

protocol ConnectionManagerDelegate: AnyObject {
    func didCompleteTask(with result: Result<Data, Error>)
}

class ConnectionManager {
    weak var delegate: ConnectionManagerDelegate?
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    init() {}
    
    func startSession(endpoint: APIEndpoint, method: HTTPMethod, parameters: [String: Any]? = nil) {
        guard var components = URLComponents(string: endpoint.rawValue) else { return }
        
        if method == .get, let params = parameters {
            components.queryItems = params.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        }
        
        guard let url = components.url else { return }
        print("Hitting Url : \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if method == .post, let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                delegate?.didCompleteTask(with: .failure(error))
                return
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                self.delegate?.didCompleteTask(with: .failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "Invalid data", code: 0, userInfo: nil)
                self.delegate?.didCompleteTask(with: .failure(error))
                return
            }
            
            self.delegate?.didCompleteTask(with: .success(data))
        }
        
        task.resume()
    }
}

enum APIEndpoint: String {
    case login = "https://demo0413095.mockable.io/digitalflake/api/login"
    case createAccount = "https://demo0413095.mockable.io/digitalflake/api/create_account"
    case getSlots = "https://demo0413095.mockable.io/digitalflake/api/get_slots"
    case getAvailability = "https://demo0413095.mockable.io/digitalflake/api/get_availability"
    case confirmBooking = "https://demo0413095.mockable.io/digitalflake/api/confirm_booking"
    case getBookings = "https://demo0413095.mockable.io/digitalflake/api/get_bookings"
}
