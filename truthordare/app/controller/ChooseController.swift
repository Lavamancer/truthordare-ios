import Foundation
import UIKit

class ChooseController: UIViewController {
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var truthButton: UIButton!
    @IBOutlet weak var dareButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UINib(nibName: "ChooseView", bundle: nil).instantiate(withOwner: self)
        configureViews()
    }

    func configureViews() {
        truthButton.layer.cornerRadius = truthButton.bounds.size.height / 4
        dareButton.layer.cornerRadius = dareButton.bounds.size.height / 4
        randomButton.layer.cornerRadius = randomButton.bounds.size.height / 4

        selectRandomPlayer()

        truthButton.addTapGestureRecognizer(action: {
            self.startQuestionView(type: Question.Group.TRUTH)
        })

        dareButton.addTapGestureRecognizer(action: {
            self.startQuestionView(type: Question.Group.DARE)
        })

        randomButton.addTapGestureRecognizer(action: {
            self.startQuestionView(type: nil)
        })
    }

    func selectRandomPlayer() {
        let index: Int = Int.random(in: 0...Session.getInstance().players.count - 1)
        let player = Session.getInstance().players[index]
        Session.getInstance().currentPlayer = player
        playerLabel.text = player.name
    }

    func startQuestionView(type: Question.Group?) {
        var question: Question?
        repeat {
            question = Session.getInstance().questions[Int.random(in: 0...Session.getInstance().questions.count - 1)]
        } while type != nil && question?.type != type

        Session.getInstance().currentQuestion = question
        AppDelegate.getNavigationController().popViewController(animated: false)
        AppDelegate.getNavigationController().pushViewController(QuestionController(), animated: false)
    }






}
