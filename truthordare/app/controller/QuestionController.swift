import Foundation
import UIKit

class QuestionController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINib(nibName: "QuestionView", bundle: nil).instantiate(withOwner: self)

        questionLabel.layer.cornerRadius = 5
        nextButton.layer.cornerRadius = nextButton.bounds.size.height / 2
        playerLabel.text = Session.getInstance().currentPlayer.name
        questionLabel.text = Session.getInstance().currentQuestion.body
        questionLabel.sizeToFit()

        nextButton.addTapGestureRecognizer(action: {
            AppDelegate.getNavigationController().popViewController(animated: false)
            AppDelegate.getNavigationController().pushViewController(ChooseController(), animated: false)
        })
    }


}
