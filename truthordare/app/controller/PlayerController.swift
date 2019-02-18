import Foundation
import UIKit
import Toast_Swift

class PlayerController: UIViewController {

    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UINib(nibName: "PlayerView", bundle: nil).instantiate(withOwner: self)
        configureViews();
    }

    func configureViews() {
        addButton.layer.cornerRadius = addButton.bounds.size.height / 2
        startButton.layer.cornerRadius = addButton.bounds.size.height / 2
        playersLabel.text = ""

        addButton.addTapGestureRecognizer(action: {
            let name: String = self.playerTextField.text!;

            if (name.count < 2) {
                self.view.makeToast("Name should be at least of 2 characters or more")
                return
            }

            if (Session.getInstance().players.count >= 15) {
                self.view.makeToast("You reached the maximum amount of people")
                return
            }

            let player: Player = Player()
            player.name = name
            Session.getInstance().players.append(player)
            self.playerTextField.text = ""
            self.updatePlayersLabel()
        })

        startButton.addTapGestureRecognizer(action: {
            if (Session.getInstance().players.count < 2) {
                self.view.makeToast("You need at least 2 or more people to start playing")
                return
            }
            AppDelegate.getNavigationController().popViewController(animated: false)
            AppDelegate.getNavigationController().pushViewController(ChooseController(), animated: false)
        })
    }

    func updatePlayersLabel() {
        var players: String = ""
        for player: Player in Session.getInstance().players {
            players += player.name + "\n"
        }
        playersLabel.text = players
        let frame: CGRect = playersLabel.frame
        let width = frame.size.width
        playersLabel.sizeToFit()
        var f: CGRect = playersLabel.frame
        f.size.width = width
        playersLabel.frame = f
    }


}
