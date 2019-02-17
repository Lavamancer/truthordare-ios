import Foundation
import UIKit

class PlayerController: UIViewController {

    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var playersLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UINib(nibName: "PlayerView", bundle: nil).instantiate(withOwner: self)
        configureViews();
    }

    func configureViews() {
        addButton.layer.cornerRadius = addButton.bounds.size.height / 2
        playersLabel.text = ""

        addButton.addTapGestureRecognizer(action: {
            if (Session.getInstance().players.count >= 15) {

                return
            }
            let name = self.playerTextField.text;
            let player: Player = Player()
            player.name = name
            Session.getInstance().players.append(player)
            self.updatePlayersLabel()
        })

    }


    func updatePlayersLabel() {
        var players: String = ""
        for player: Player in Session.getInstance().players {
            players += player.name + "\n"
        }
        playersLabel.text = players
        playersLabel.sizeToFit()
    }


}
