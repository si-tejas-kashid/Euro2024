// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fixtures = try? JSONDecoder().decode(Fixtures.self, from: jsonData)

import Foundation

// MARK: - Fixtures
struct Fixtures: Codable {
    let data: DataClass?
    let meta: Meta?

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case meta = "Meta"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let value: [Value]?
    let feedTime: FeedTime?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case feedTime = "FeedTime"
    }
}

// MARK: - FeedTime
struct FeedTime: Codable {
    let utcTime, istTime, cestTime: String?

    enum CodingKeys: String, CodingKey {
        case utcTime = "UTCTime"
        case istTime = "ISTTime"
        case cestTime = "CESTTime"
    }
}

// MARK: - Value
struct Value: Codable, Identifiable {
    var id = UUID()
    let matchID, tourID: String?
    let teamGamedayID, tourGamedayID, phaseID, gdIsCurrent: Int?
    let gdIsLocked, mdIsLocked, mdIsCurrent, mhIsLocked: Int?
    let mhIsCurrent, gdTotalPlayers, mdTotalPlayers, maxTeamPlayers: Int?
    let maxTeamBalance, substitutionsAllowed, maxSubstitutionsCF: Int?
    let matchday, isFeedLive: String?
    let gamedayID: Int?
    let homeTeamID: Int?
    let homeTeamName, homeTeamShort: String?
    let awayTeamID: Int?
    let awayTeamName, awayTeamShort, matchName: String?
    let isCurrent, isLock, isLive, eotFlag: Int?
    let correctPredID: String?
    let gameday, matchTime: String?
    let matchDate, deadline: String?
    let teamA, teamAName, teamAShortName, homeTeamCountryCode: String?
    let teamB, teamBName, teamBShortName, awayTeamCountryCode: String?
    let gameNo, matchdayName, venueName: String?
    let roundID: Int?
    let round: String?
    let gameDate: String?
    let countryCode: String?
    let homeTeamScore, awayTeamScore, pointsStatus, matchStatus: Int?
    let predMatchStatus, userPredCount: Int?
    let matchQuestions: [MatchQuestion]?
    let teamAOutcome, teamBOutcome: String?
    let gameIsCurrent, gameIsLocked: Int?
    let dateTime: String?
    let notificationUpd: Int?
    let stats: [Stat]?

    enum CodingKeys: String, CodingKey {
        case matchID = "matchId"
        case tourID = "tourId"
        case teamGamedayID = "teamGamedayId"
        case tourGamedayID = "tourGamedayId"
        case phaseID = "phaseId"
        case gdIsCurrent, gdIsLocked, mdIsLocked, mdIsCurrent, mhIsLocked, mhIsCurrent
        case gdTotalPlayers = "gd_TotalPlayers"
        case mdTotalPlayers = "md_TotalPlayers"
        case maxTeamPlayers, maxTeamBalance, substitutionsAllowed
        case maxSubstitutionsCF = "maxSubstitutions_CF"
        case matchday, isFeedLive
        case gamedayID = "gamedayId"
        case homeTeamID = "homeTeamId"
        case homeTeamName, homeTeamShort
        case awayTeamID = "awayTeamId"
        case awayTeamName, awayTeamShort, matchName
        case isCurrent, isLock, isLive
        case eotFlag = "eot_flag"
        case correctPredID = "correctPredId"
        case gameday, matchTime, matchDate, deadline, teamA, teamAName, teamAShortName, homeTeamCountryCode, teamB, teamBName, teamBShortName, awayTeamCountryCode, gameNo, matchdayName, venueName
        case roundID = "roundId"
        case round, gameDate, countryCode, homeTeamScore, awayTeamScore, pointsStatus, matchStatus, predMatchStatus, userPredCount
        case matchQuestions = "MatchQuestions"
        case teamAOutcome = "TeamAOutcome"
        case teamBOutcome = "TeamBOutcome"
        case gameIsCurrent, gameIsLocked, dateTime
             case stats,notificationUpd
    }
}

// MARK: - Stat
struct Stat: Codable {
    let matchID, teamID, homeTeamID, awayTeamID, homeTeamName, awayTeamName, optionDesc, result, outcome: String?

    enum CodingKeys: String, CodingKey {
        case matchID = "matchId"
        case teamID = "teamId"
        case homeTeamID = "homeTeamId"
        case awayTeamID = "awayTeamId"
        case homeTeamName, awayTeamName, optionDesc, result, outcome
    }
}

// MARK: - MatchQuestion
struct MatchQuestion: Codable {
    let matchID: String?
    let questionID, questionNo, inningNo, coinMult: Int?
    let lastQstn: Int?
    let questionDesc: String?
    let questionType: String?
    let status: Int?
    let questionCode: String?
    let questionOccurrence: String?
    let optionJSON: String?
    let optionLists: [OptionList]?
    let options: String?
    let publishedDate, questionTime, questionPoints: String?
    let coinMultiplier: String?
    let questionNumber: Int?
    let lstQstnList: String?
    let isLiveQuestion: Int?
    let teamAID, teamBID, teamAScore, teamBScore: String?
    let teamAName, teamBName: String?

    enum CodingKeys: String, CodingKey {
        case matchID = "MatchId"
        case questionID = "QuestionId"
        case questionNo = "QuestionNo"
        case inningNo = "InningNo"
        case coinMult = "CoinMult"
        case lastQstn = "LastQstn"
        case questionDesc = "QuestionDesc"
        case questionType = "QuestionType"
        case status = "Status"
        case questionCode = "QuestionCode"
        case questionOccurrence = "QuestionOccurrence"
        case optionJSON = "OptionJson"
        case optionLists = "OptionLists"
        case options = "Options"
        case publishedDate = "PublishedDate"
        case questionTime = "QuestionTime"
        case questionPoints = "QuestionPoints"
        case coinMultiplier = "CoinMultiplier"
        case questionNumber = "QuestionNumber"
        case lstQstnList = "LstQstnList"
        case isLiveQuestion = "IsLiveQuestion"
        case teamAID = "TeamAId"
        case teamBID = "TeamBId"
        case teamAScore = "TeamAScore"
        case teamBScore = "TeamBScore"
        case teamAName = "TeamAName"
        case teamBName = "TeamBName"
    }
}

// MARK: - OptionList
struct OptionList: Codable {
    let cfQuestionid, cfOptionid: Int?
    let optionDEC, cfAssetid: String?
    let assetType: String?
    let isCorrect, minVal, maxVal, voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case cfQuestionid = "cf_questionid"
        case cfOptionid = "cf_optionid"
        case optionDEC = "option_dec"
        case cfAssetid = "cf_assetid"
        case assetType = "asset_type"
        case isCorrect = "is_correct"
        case minVal = "min_val"
        case maxVal = "max_val"
        case voteCount = "vote_count"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let message: String?
    let retVal: Int?
    let success: Bool?
    let timestamp: FeedTime?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case retVal = "RetVal"
        case success = "Success"
        case timestamp = "Timestamp"
    }
}

enum NetworkErrors: String, Error {
//    case noInternet = "No Internet"
    case invalidUrl = "Invalid Url"
    case dataFailure = "Invalid Data"
    case invalidResponse = "Invalid Response"
    case unknownIssue = "Something went wrong!! Please try after some time"
    case userAccountExist = "User account already Exist."
    case none
}
