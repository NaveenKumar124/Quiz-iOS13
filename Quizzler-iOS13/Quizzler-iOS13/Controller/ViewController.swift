

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    //var timer = Timer()
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //questionNumber = 0
        updateLabel()
    }
    
    @objc func updateLabel(){
        
        //let totalQuesLength = quizQuestions.count
        
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let percentageProgress = quizBrain.getProgress()
        progressBar.progress = percentageProgress
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True or False
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            //print("Right")
            sender.backgroundColor = UIColor.green
        }
        else{
            //print("Wrong")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: false)
        
        //            updateLabel()
        //viewDidLoad()
        //            questionLabel.text = "Out of questions"
        
    }
}

