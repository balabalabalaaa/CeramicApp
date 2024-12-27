//
//  ModelQuiz.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/28.
//

struct ModelQuizList: Codable
{
    var items : [ModelQuiz]
}

struct ModelQuiz: Codable, Hashable
{
    var title : String
    var subTitle : String
    var icon : String
    var correctRate : Int
    var submit : Int
    var starCount : Int
    
    init()
    {
        title = ""
        subTitle = ""
        icon = ""
        correctRate = 0
        submit = 0
        starCount = 0
    }
}
