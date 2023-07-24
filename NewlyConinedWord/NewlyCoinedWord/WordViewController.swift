//
//  WordViewController.swift
//  NewlyConinedWord
//
//  Created by JongHoon on 2023/07/21.
//

import UIKit

final class WordViewController: UIViewController {
    
    @IBOutlet private var wordTextField: UITextField!
    
    @IBOutlet private var wordFirstButton: UIButton!
    @IBOutlet private var wordSecondButton: UIButton!
    @IBOutlet private var wordThirdButton: UIButton!
    @IBOutlet private var wordfourthButton: UIButton!
    
    private lazy var buttons = [
        wordFirstButton,
        wordSecondButton,
        wordThirdButton,
        wordfourthButton
    ]
    
    private let buttonTitles = [
        "뉴진스", "알잘딱깔센", "별다줄", "실매"
    ]
    
    @IBOutlet private var resultLabel: UILabel!
    
    private var newlyWordDict: [String: String] = [
        "뉴진스": "뉴진스 뜻은 ,,, ,,,, 입니다.",
        "jmt": "마시따",
        "별다줄": "별다줄 뜻은 별거 다 줄인다 입니다.",
        "알잘딱깔센": "알잘딱깔센 뜻은 알아서 잘 딱 깔끔하게 입니다.",
        "갑분싸": "갑자기 분위기 싸해짐",
        "워라밸": "일과 삶의 균형",
        "일코노미": "1인 가구 확산으로 나타나는 경제 현상",
        "실매": "유튜브에서 실시간 매니저를 뜻합니다."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFiled()
        configureButtons()
    }
    
    private func configureTextFiled() {
        wordTextField.layer.borderColor = UIColor.black.cgColor
        wordTextField.layer.borderWidth = 2.0
        wordTextField.tintColor = .black
    }
    
    private func configureButtons() {
        for (button, title) in zip(buttons, buttonTitles) {
            button?.configuration = UIButton.Configuration.newlyCoinnedWordStyle(title: title)
        }
    }
    
    @IBAction private func searchButtonTapped(_ sender: UIButton) {
        tapTextFieldKeyboard(wordTextField)
    }
    
    @IBAction private func wordButtonTapped(_ sender: UIButton) {
//        wordTextField.text = sender.titleLabel?.text
        
        wordTextField.text = buttonTitles[sender.tag]
        tapTextFieldKeyboard(wordTextField)
    }
    
    @IBAction private func tapTextFieldKeyboard(_ sender: UITextField) {
        guard let input = sender.text,
              input.count >= 2
        else {
            presentShortWordAlert()
            return
        }
        
        if let meaning = newlyWordDict[input.lowercased()] {
            resultLabel.text = meaning
        } else {
            resultLabel.text = "찾는 결과가 없습니다."
        }
    }
    
    @IBAction private func tapGestureTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    private func presentShortWordAlert() {
        let alertController = UIAlertController(
            title: nil,
            message: "검색어를 2글자 이상 입력해주세요!",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}
