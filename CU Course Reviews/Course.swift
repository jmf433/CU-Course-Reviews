//
//  Course.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/5/21.
//

import Foundation
import UIKit

struct CourseResponse: Codable {
   let success : Bool
   let data : [Course]
}

struct reviewResponse: Codable {
    let success : Bool
    let data : Review
}

struct Course: Codable {
   let id: Int
   // Combine prefix and code
   let prefix: String
   let code: Int
   let name: String
   let reviews: [Review]
   let rating: Float
   let difficulty: Float
   let hours_per_week : Float
}

struct Review: Codable {
   let id: Int
   let student_name: String
   let rating: Float
   let review: String
   let difficulty: Float
   let hours_per_week: Int
}



//class Course {
//
//    // roster name of the course that will be in each cell e.g. "CS 1110"
//    var rosterName : String
//    // description of course that will be in each cell e.g. "Discrete Structures"
//    var description : String
//    // rating for the course e.g. 5/5 stars (will be useful when implementing stars later)
//    var rating : Int
//
//    init(rosterName: String, description: String, rating: Int) {
//        self.rosterName = rosterName
//        self.description = description
//        self.rating = rating
//    }
//}
//
//
//// difficulty, name, star rating, avg time
//class CoreRatings {
//    let course : Course
//    let difficulty : Int
//    let time : Int
//    init(course : Course, difficulty : Int, time: Int){
//        self.course = course
//        self.difficulty = difficulty
//        self.time = time
//    }
//}
//
//class Review {
//    let core : CoreRatings
//    let review : String
//    let name : String
//
//    init(core: CoreRatings, review: String, name: String) {
//        self.core = core
//        self.review = review
//        self.name = name
//    }
//
//
//}
//
