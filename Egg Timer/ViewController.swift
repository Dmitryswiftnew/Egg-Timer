

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var softBoildBtn: UIButton!
    @IBOutlet weak var inAPouchBtn: UIButton!
    @IBOutlet weak var hardBoildBtn: UIButton!
    
    
    
    @IBOutlet weak var startBtn: UIButton!
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    let softBoiledConst = 240
    let inAPouchConst = 360
    let hardBoildConst = 450
    
    
    
    var selectedType = Array(repeating: false, count: 3)
    var timer = Timer()
    var isStarted = false
    var counter: Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        selectedType[2] = true
        setHightlighingForButton()
        timerLabel.text = NSString(format: "%0.2d:%0.2d",hardBoildConst/60, hardBoildConst%60) as String
        
        
    }
    
    @IBAction func softBoildBtnPressed(_ sender: Any) {
        if !isStarted {
            selectedType = [true, false, false]
            setHightlighingForButton()
            refreshTime()
        }
    }
    
    @IBAction func inAPouchBtnPressed(_ sender: Any) {
        if !isStarted {
            selectedType = [false, true, false]
            setHightlighingForButton()
            refreshTime()
        }
    }
    
    
    @IBAction func hardBoildBtnPressed(_ sender: Any) {
        if !isStarted {
            selectedType = [false, false, true]
            setHightlighingForButton()
            refreshTime()
        }
    }
    
    
    
    @IBAction func startBtnPressed(_ sender: Any) {
        if !isStarted {
            counter = getCurrentTimer()
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: true)
            startBtn.setImage(UIImage(named: "stop"), for: UIControl.State())
            isStarted = true
            disabledButtons()
        } else {
            isStarted = false
            timer.invalidate()
            refreshTime()
            enabledButtons()
            setHightlighingForButton()
            startBtn.setImage(UIImage(named: "play"), for: UIControl.State())
        }
        
    }
    
    
    @objc func timerAction() {
        counter! -= 1
        if counter! < 0 {
            timerLabel.text = "Ready"
        } else {
            timerLabel.text = NSString(format: "%0.2d:%0.2d",counter!/60, counter!%60) as String
        }
        
    }
    
    
    
    func refreshTime() {
        counter = getCurrentTimer()
        timerLabel.text = NSString(format: "%0.2d:%0.2d",counter!/60, counter!%60) as String
    }
    
    func disabledButtons() {
        softBoildBtn.isEnabled = false
        inAPouchBtn.isEnabled = false
        hardBoildBtn.isEnabled = false
    }
    
    func enabledButtons() {
        softBoildBtn.isEnabled = true
        inAPouchBtn.isEnabled = true
        hardBoildBtn.isEnabled = true
    }
    
    
    
    func setHightlighingForButton() {
        if selectedType[0] {
            softBoildBtn.backgroundColor = .systemYellow
            inAPouchBtn.backgroundColor = .systemGray5
            hardBoildBtn.backgroundColor = .systemGray5
        } else if selectedType[1] {
            softBoildBtn.backgroundColor = .systemGray5
            inAPouchBtn.backgroundColor = .systemYellow
            hardBoildBtn.backgroundColor = .systemGray5
        } else {
            softBoildBtn.backgroundColor = .systemGray5
            inAPouchBtn.backgroundColor = .systemGray5
            hardBoildBtn.backgroundColor = .systemYellow
        }
    }
    
    func getCurrentTimer() -> Int {
        if selectedType[0]{
            return softBoiledConst
        } else if selectedType[1] {
            return inAPouchConst
        } else {
            return hardBoildConst
        }
        
    }
    
    
    
    
    
}

