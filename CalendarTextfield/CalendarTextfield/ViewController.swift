//
//  ViewController.swift
//  CalendarTextfield
//
//  Created by J_Min on 2021/08/05.
//

import UIKit

class ViewController: UIViewController {

    let datePicker = UIDatePicker()
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.preferredDatePickerStyle = .inline // datePickerstyle설정
        datePicker.datePickerMode = .date // datepiocker 모드 설정
        datePicker.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 400)
        datePicker.locale = Locale(identifier: "Korean") // datepicker 언어 = 한국어
        createDatePicker()
    }

    func creatToolbar() -> UIToolbar { // custom Toolbar 만들기
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed)) // done 버튼 누를시 donePressed 함수 실행
        toolBar.setItems([doneButton], animated: true) // 툴바에 done버튼 추가
        return toolBar
    }
    
    func createDatePicker() {
        textField.inputView = datePicker // textfield 선택시 datePicker 뜨게하기
        textField.inputAccessoryView = creatToolbar() // 툴바도 뜨게하기
    }

    @objc func donePressed() { // done 버튼 누를시 실행할 함수
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // 표시할 날짜의 포맷설정
        textField.text = formatter.string(from: datePicker.date) // 텍스트필드에 datePicker에서 선택한 날짜 표시
        self.view.endEditing(true) // 키보드 사라지게
    }
}

