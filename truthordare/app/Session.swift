import Foundation
import UIKit

class Session: Codable {

    static fileprivate let SESSION: String! = "session"

    var questions: [Question] = []
    var players: [Player] = []
    var currentPlayer: Player!
    var currentQuestion: Question!


    static func getInstance() -> Session {
        return AppDelegate.appDelegate.session
    }

    static func load(appDelegate: AppDelegate) {
        AppDelegate.appDelegate = appDelegate
        let sessionJson = UserDefaults.standard.data(forKey: SESSION)
        if (sessionJson != nil) {
            appDelegate.session = try? JSONDecoder().decode(Session.self, from: sessionJson!)
            if (appDelegate.session == nil) {
                print("Cannot load session and it will be restart...")
                appDelegate.session = Session()
            } else {
                print("Load session...")
            }
        } else {
            print("New session...")
            appDelegate.session = Session()
        }
    }

    static func save(appDelegate: AppDelegate) {
        print("Save session...")
        let sessionJson = try! JSONEncoder().encode(appDelegate.session)
        UserDefaults.standard.set(sessionJson, forKey: SESSION)
    }

    static func reset() {
        // todo implement
    }

}
