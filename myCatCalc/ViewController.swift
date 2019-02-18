//
//  ViewController.swift
//  myCatCalc
//
//  Created by TakayukiOshima on 2019/02/18.
//  Copyright © 2019 TakayukiOshima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0; // 画面上の数字
    var previousNumber:Double = 0; // 前回表示されていた数字
    var performingMath = false  // 計算してもいい？の判断値
    var operation = 0; //  + , - , × , ÷
    
    @IBOutlet weak var label: UILabel! // 計算結果表示
    
    @IBAction func numbers(_ sender: UIButton) {   // 数字ボタンを取り扱い可能
        if performingMath == true{
            label.text = String(sender.tag-1)  // numberOnScreen の値が上書きされる
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else{
            label.text = label.text! + String(sender.tag-1)  // String(sender.tag-1) 数字が代入
            numberOnScreen = Double(label.text!)!  // 数字が表示
        }
    }
    

    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{   //数字が表示されていた場合の処理
            previousNumber = Double(label.text!)!
            if sender.tag == 12{ // ÷
                label.text = "÷";
            }
            else if sender.tag == 13{  // ×
                label.text = "×";
            }
            else if sender.tag == 14{  // -
                label.text = "-";
            }
            else if sender.tag == 15{  // +
                label.text = "+";
            }
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16 // = が押された時の処理
        {
            if operation == 12{
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11{ // C が押された時の処理
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

