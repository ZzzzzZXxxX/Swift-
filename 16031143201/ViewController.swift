import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pausebutton.isEnabled = false
        startbutton.backgroundColor = UIColor.blue
        pausebutton.backgroundColor = UIColor.green
        startbutton.layer.cornerRadius = 20
        pausebutton.layer.cornerRadius = 20
        
    }

    @IBOutlet weak var timeLabel: UILabel!
    var flag=0
    var counter:Double=0
    var timer :Timer?
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updataSecond), userInfo: nil, repeats: true)
        timer!.fire()
        
    }
    @objc func updataSecond() {
        timeLabel.text=String(format: "%.2f", counter)
        counter = counter + 0.01
    
}
    
    
   
    @IBOutlet weak var startbutton: UIButton!
    
    @IBAction func start(_ sender: Any) {
        if(flag==0){
            startTimer()                       //开始
            flag=1
        }
        else{
            timer!.fireDate = Date.distantPast  //继续
        }
        
        startbutton.isEnabled = false
        pausebutton.isEnabled = true
        pausebutton.backgroundColor = UIColor.green
        startbutton.backgroundColor=UIColor.gray
    }
    
    @IBOutlet weak var pausebutton: UIButton!
    
    
    @IBAction func pause(_ sender: Any) {
        timer!.fireDate = Date.distantFuture
        pausebutton.isEnabled = false
        startbutton.isEnabled = true
        pausebutton.backgroundColor=UIColor.gray
        startbutton.backgroundColor = UIColor.blue
    }
    
    @IBAction func reset(_ sender: UIButton) {
        timer!.invalidate()                   //暂停
        counter=Double(0)
        startbutton.isEnabled = true
        pausebutton.isEnabled = false
        timeLabel.text=String(format: "%.2f", counter)
        startbutton.backgroundColor = UIColor.blue
        pausebutton.backgroundColor = UIColor.green
        flag=0
    }
    
}

