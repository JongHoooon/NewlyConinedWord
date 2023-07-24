//
//  DateViewController.swift
//  NewlyConinedWord
//
//  Created by JongHoon on 2023/07/20.
//

import UIKit

final class DateViewController: UIViewController {
    
    @IBOutlet private var datePicker: UIDatePicker!
    
    @IBOutlet var containerView100: UIView!
    @IBOutlet var containerView200: UIView!
    @IBOutlet var containerView300: UIView!
    @IBOutlet var containerView400: UIView!
    
    @IBOutlet private var background100ImageView: UIImageView!
    @IBOutlet private var background200ImageView: UIImageView!
    @IBOutlet private var background300ImageView: UIImageView!
    @IBOutlet private var background400ImageView: UIImageView!
    
    @IBOutlet private var date100Label: UILabel!
    @IBOutlet private var date200Label: UILabel!
    @IBOutlet private var date300Label: UILabel!
    @IBOutlet private var date400Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designDatePicker()
        configureImageViews()
        configureAnniversaryLabels()
    }

    private func designDatePicker() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        datePicker.tintColor = .systemGreen
        datePicker.datePickerMode = .date
        
    }
    
    private func configureImageViews() {

        [
            background100ImageView,
            background200ImageView,
            background300ImageView,
            background400ImageView
        ].forEach {
            $0.layer.cornerRadius = 20.0
            $0.clipsToBounds = true
        }
        
        [
            containerView100,
            containerView200,
            containerView300,
            containerView400
        ].forEach {
            $0?.layer.cornerRadius = 20.0
            $0?.layer.shadowColor = UIColor.black.cgColor
            $0?.layer.shadowOffset = .zero
            $0?.layer.shadowRadius = 8.0
            $0?.layer.shadowOpacity = 0.5
        }
    }
    
    private func configureAnniversaryLabels() {
        let labels = [
            date100Label,
            date200Label,
            date300Label,
            date400Label
        ]
        
        labels.forEach {
            $0?.textColor = .white
            $0?.font = .systemFont(ofSize: 16.0)
        }
        
        datePickerValueDidChanged(datePicker)
    }
    
    @IBAction private func datePickerValueDidChanged(_ sender: UIDatePicker) {
        /*
         - DateFormatter
            1. 시간대 변경
            2. 날짜 포맷 변경
         
         - 날짜 계산
            1. time internal (second) 86400(하루) * 100
            2. calendar
         */
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일, yyyy년"
        
        let labels = [date100Label, date200Label, date300Label, date400Label]
        
        for (i, label) in labels.enumerated() {
            guard let addedDate = addDay(value: (i+1) * 100, date: sender.date) else { return }
            
            label?.text = dateFormatter.string(from: addedDate)
        }
    }
    
    private func addDay(value: Int, date: Date) -> Date? {
        return Calendar.current.date(
            byAdding: .day,
            value: value,
            to: date
        )
    }
}
