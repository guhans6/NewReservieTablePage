//
//  TopView.swift
//  NewReservieTablePage
//
//  Created by guhan-pt6208 on 15/04/23.
//

import UIKit

class TopView: UIView {
    
    let calendarImageView = UIImageView(image: UIImage(named: "calendar"))
    let dateLabel = UILabel()
    let separatorView = UIView()
    let clockImageView = UIImageView(image: UIImage(named: "clock"))
    let eventLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .systemGray6
        
        setupCalenderImageView()
        setupdateLabel()
        setupDivider()
        setupClockImageView()
        setupTimeLabel()
    }
    
    private func setupCalenderImageView() {
        
        addSubview(calendarImageView)
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        calendarImageView.image = UIImage(systemName: "calendar.badge.clock")
        calendarImageView.tintColor = .label
        calendarImageView.contentMode = .scaleAspectFit

        calendarImageView.clipsToBounds = translatesAutoresizingMaskIntoConstraints
        NSLayoutConstraint.activate([
            
            calendarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            calendarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            calendarImageView.widthAnchor.constraint(equalToConstant: 30),
            calendarImageView.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    private func setupdateLabel() {
        
        addSubview(dateLabel)
        dateLabel.text = formatDate(Date())
        dateLabel.font = UIFont.systemFont(ofSize: 20)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            dateLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 15),
            dateLabel.centerYAnchor.constraint(equalTo: calendarImageView.centerYAnchor),
        ])
    }
    
    private func setupDivider() {
        
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            
//            separatorView.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 20),
            separatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            separatorView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            separatorView.widthAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupClockImageView() {
        
        addSubview(clockImageView)
        clockImageView.translatesAutoresizingMaskIntoConstraints = false
        clockImageView.image = UIImage(systemName: "clock")
        clockImageView.tintColor = .label
        clockImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            clockImageView.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 20),
            clockImageView.centerYAnchor.constraint(equalTo: calendarImageView.centerYAnchor),
            clockImageView.widthAnchor.constraint(equalToConstant: 30),
            clockImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setupTimeLabel() {
        
        addSubview(eventLabel)
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        eventLabel.text = "Breakfast"
        eventLabel.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            
            eventLabel.leadingAnchor.constraint(equalTo: clockImageView.trailingAnchor, constant: 20),
            eventLabel.centerYAnchor.constraint(equalTo: calendarImageView.centerYAnchor),
            eventLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
    
    func update(date: Date?, meal: String) {
        dateLabel.text = date.flatMap { DateFormatter.localizedString(from: $0, dateStyle: .medium, timeStyle: .none) } ?? "No date selected"
        eventLabel.text = meal
    }
    
}

