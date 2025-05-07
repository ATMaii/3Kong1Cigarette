enum Stadium: String, CaseIterable {
    case Rookie = "Wembley"
    case Beginner = "Maracana"
    case Amature = "Allianz"
    case Master = "Santiago"

    var minChipsRequired: Int {
        switch self {
        case .Rookie: return 5_000
        case .Beginner: return 10_000
        case .Amature: return 20_000
        case .Master: return 50_000
        }
    }

    var multiplier: Double {
        switch self {
        case .Rookie: return 5.2
        case .Beginner: return 6.3
        case .Amature: return 7.4
        case .Master: return 8.5
        }
    }

    var rooms: [Int] {
        switch self {
        case .Rookie, .Beginner: return [50, 100, 200]
        case .Amature: return [50, 100, 200, 500]
        case .Master: return [100, 200, 500, 1_000]
        }
    }

    var displayName: String {
        switch self {
        case .Rookie: return "Wembley"
        case .Beginner: return "Brazil"
        case .Amature: return "Allianz Arena"
        case .Master: return "Santiago Bernabeu"
        }
    }
}
// Stadium.swift import Foundation

enum Stadium: String { case Rookie = "Wembley" case Beginner = "Maracana" case Amature = "Allianz Arena" case Master = "Santiago Bernabeu"

var minChips: Int {
    switch self {
    case .Rookie: return 5_000
    case .Beginner: return 10_000
    case .Amature: return 20_000
    case .Master: return 50_000
    }
}

var multiplier: Double {
    switch self {
    case .Rookie: return 5.2
    case .Beginner: return 6.3
    case .Amature: return 7.4
    case .Master: return 8.5
    }
}

var availableRooms: [Int] {
    switch self {
    case .Rookie, .Beginner: return [50, 100, 200]
    case .Amature: return [50, 100, 200, 500]
    case .Master: return [100, 200, 500, 1000]
    }
}

}
