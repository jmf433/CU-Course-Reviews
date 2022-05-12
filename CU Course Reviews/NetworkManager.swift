//
//  NetworkManager.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/12/21.
//

import Foundation
import Alamofire

class NetworkManager {
    
    /** To receive full marks on this assignment, you must do ALL of the following
        1) Setup CocoaPods to install and import Alamofire to actually do this assignment.
        2) Fill out the function stubs provided below - leave them untouched unless otherwise instructed.
            a) Note that all completions are of type `Any` - you should change these to the correct types (and any necessary keywords..)
        3) For each function stub, make sure you go to `Post.swift` to add Codable structs as necessary
        4) After filling in a function stub, go to `ViewController.swift` and add the completion in the marked area for that function and verify that your implementation works
            a) Steps are provided to help guide you in what to do inside your completion
            b) Print statements are provided to help you debug and to hint towards which variables you will need to use the implement the completion body
        5) Don't modify any other code in this project without good reason.
            a) This includes the MARK and explanatory comments, leave them to make your graders' lives easier.
     */
    
    /** Put the provided server endpoint here. If you don't know what th is is, contact course staff. */
    static let host = "https://hackchallenge54.herokuapp.com/"
    
    static func getAllPosts(completion: @escaping ([Course]) -> Void) {
        let endpoint = "\(host)api/courses/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let usersResponse = try? jsonDecoder.decode(CourseResponse.self, from: data) {
                    completion(usersResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getSpecificPost(prefix: String, classNumber: String, completion: @escaping (Course) -> Void) {
        let endpoint = "\(host)api/course?prefix=\(prefix)&code=\(classNumber)"
        
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userResponse = try? jsonDecoder.decode(CourseResponse.self, from: data) {
                    completion(userResponse.data[0])
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createPost(id: Int, rating: String, review: String, hoursPerWeek: String, difficulty: String, name: String, completion: @escaping (Review) -> Void) {
        let endpoint = "\(host)api/\(id)/reviews/"
        let parameters : [String:Any] = [
            "rating" : rating,
            "review" : review,
            "hours_per_week" : hoursPerWeek,
            "difficulty" : difficulty,
            "student_name" : name
        ]
        print (parameters)
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let Post = try? jsonDecoder.decode(reviewResponse.self, from: data) {
                    completion(Post.data)
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
    }
    
}
