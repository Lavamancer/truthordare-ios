import Foundation
import UIKit

class SplashController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        UINib(nibName: "SplashView", bundle: nil).instantiate(withOwner: self)

        generateQuestions()

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            AppDelegate.getNavigationController().popViewController(animated: false)
            AppDelegate.getNavigationController().pushViewController(PlayerController(), animated: false)
        })

    }

    func generateQuestions() {
        var question: Question?

        // todo write your questions here
        question = Question()
        question!.type = Question.Group.TRUTH
        question!.body = "Have you ever practiced kissing in a mirror?"
        Session.getInstance().questions.append(question!)

        question = Question()
        question!.type = Question.Group.TRUTH
        question!.body = "What is your worst habit?"
        Session.getInstance().questions.append(question!)

        question = Question()
        question!.type = Question.Group.TRUTH
        question!.body = "Do you pick your nose?"
        Session.getInstance().questions.append(question!)

        question = Question()
        question!.type = Question.Group.DARE
        question!.body = "Dance with no music for 1 minute"
        Session.getInstance().questions.append(question!)

        question = Question()
        question!.type = Question.Group.DARE
        question!.body = "Play a song on by slapping your butt cheeks till someone guesses the song"
        Session.getInstance().questions.append(question!)

        question = Question()
        question!.type = Question.Group.DARE
        question!.body = "Try to drink a glass water while standing on your hands"
        Session.getInstance().questions.append(question!)

    }
}
