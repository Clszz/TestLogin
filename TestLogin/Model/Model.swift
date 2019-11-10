//
//  Model.swift
//  TestLogin
//
//  Created by Muhammad Reynaldi on 09/11/19.
//  Copyright © 2019 Meh. All rights reserved.
//

import Foundation

struct Course{
    var courseID:String
    var courseName, courseAddress, courseImage:String
    var courseMinFare:Double
    var courseMaxFare:Double
    var courseWorkSchedule, courseCategory, courseGrade:[String]
    var courseWorkQualification:String
    var courseCreatedAt:String
    var teacherQty:Int
}

struct Activity{
    var activityID:String
    var courseID:String
    var activityStatus:String
}

class Tutor{
    var tutorID:String
    var educationID:String
    var tutorFirstName, tutorLastName, tutorImage, tutorPhoneNumber, tutorAddress, tutorGender:String
    var tutorBirthDate:String
    var tutorSkills, tutorExperience, tutorLanguage, tutorAchievement:[String]
    
    init(_ tutorID:String, _ educationID:String, _ tutorFirstName:String, _ tutorLastName:String, _ tutorImage:String, _ tutorPhoneNumber:String, _ tutorAddress:String, _ tutorGender:String, _ tutorBirthDate:String, _ tutorSkills:[String], _ tutorExperience:[String], _ tutorLanguage:[String], _ tutorAchievement:[String]) {
        self.tutorID = tutorID
        self.educationID = educationID
        self.tutorFirstName = tutorFirstName
        self.tutorLastName = tutorLastName
        self.tutorImage = tutorImage
        self.tutorPhoneNumber = tutorPhoneNumber
        self.tutorAddress = tutorAddress
        self.tutorGender = tutorGender
        self.tutorBirthDate = tutorBirthDate
        self.tutorSkills = tutorSkills
        self.tutorExperience = tutorExperience
        self.tutorLanguage = tutorLanguage
        self.tutorAchievement = tutorAchievement
    }
}

struct Education{
    var educationID:String
    var universityName, fieldOfStudy, grade:String
    var startYear:String
    var endYear:String
}


