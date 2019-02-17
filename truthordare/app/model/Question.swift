import Foundation
import UIKit

class Question: Codable {

    enum Group: String, Codable { case TRUTH; case DARE }

    var id: Int!
    var title: String!
    var body: String!
    var type: Group!

}
