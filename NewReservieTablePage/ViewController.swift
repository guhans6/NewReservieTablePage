//
//  ViewController.swift
//  NewReservieTablePage
//
//  Created by guhan-pt6208 on 15/04/23.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    let myView = TopView()
    private let titleLabel = UILabel()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let pickerView = UIPickerView()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        return formatter
    }()
    
    private let meals = ["Breakfast", "Lunch", "Dinner"]
    private var selectedDate: Date?
    private var selectedMealIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureScrollView()
        configureTitleLabel()
        setupTopView()
        configureCollectionView()
//        scrollView.contentSize = CGSize(width: view.bounds.width, height: collectionView.frame.maxY + 50)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        
        scrollView.backgroundColor = .red
    }
    
    
    private func configureScrollView() {
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
//        scrollView.refreshControl = UIRefreshControl()
//        scrollView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        
        // Set up constraints to position and size the scroll view and its contents
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureTitleLabel() {
        
        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let fontMetrics = UIFontMetrics(forTextStyle: .largeTitle)
        titleLabel.font = fontMetrics.scaledFont(for: .systemFont(ofSize: 30, weight: .bold))
        titleLabel.text = "Reserve Table "
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: scrollView.trailingAnchor),
        ])
    }
    
    private func setupTopView() {
        
        scrollView.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            myView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            myView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            myView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(myViewTapped))
        myView.addGestureRecognizer(tapGesture)
        
        // Setup picker view
        pickerView.delegate = self
        pickerView.dataSource = self
        // Set initial date to today
        selectedDate = Date()
    }
    
//    private func configureCollectionView() {
//
//        // Configure collection view
//        collectionView.backgroundColor = .systemBackground
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 6)
//        collectionView.tag = 1
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
////        layout.minimumInteritemSpacing = 1
////        layout.minimumLineSpacing = 1
////        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
////        layout.itemSize = CGSize(width: (view.frame.width / 3) - 2, height: 150)
//        layout.itemSize = CGSize(width: 150, height: 170)
//        collectionView.collectionViewLayout = layout
////        collectionView.backgroundColor = .red
//
//        // Register cell class
//        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: "TableCollectionViewCell")
//        scrollView.addSubview(collectionView)
//
//
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 40),
//            collectionView.heightAnchor.constraint(equalToConstant: 400),
////            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//        ])
//    }
    
    private func configureCollectionView() {
        // Configure collection view
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 6)
        collectionView.tag = 1

        collectionView.isHidden = true
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        let itemWidth = (view.frame.width - 2 * layout.sectionInset.left - layout.minimumInteritemSpacing) / 2
        let itemHeight = 150
        layout.itemSize = CGSize(width: itemWidth, height: CGFloat(itemHeight))
        collectionView.collectionViewLayout = layout

        // Register cell class
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: "TableCollectionViewCell")
        scrollView.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 40),
            collectionView.heightAnchor.constraint(equalToConstant: 350),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    
    @objc private func myViewTapped() {
        
        let sheetVC = UIViewController()
        sheetVC.view.backgroundColor = .white
        sheetVC.modalPresentationStyle = .pageSheet
        sheetVC.modalPresentationStyle = .formSheet
        
        sheetVC.view.addSubview(pickerView)
        
        if let sheetController = sheetVC.sheetPresentationController {
            sheetController.detents = [.medium(), .large()]
            sheetController.prefersEdgeAttachedInCompactHeight = true
        }
        
        // Add a done button
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        sheetVC.view.addSubview(doneButton)
        
        // Add constraints for the picker view and done button
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: sheetVC.view.topAnchor),
            pickerView.leadingAnchor.constraint(equalTo: sheetVC.view.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: sheetVC.view.trailingAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 200),
            
            doneButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 8),
            doneButton.centerXAnchor.constraint(equalTo: sheetVC.view.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: sheetVC.view.bottomAnchor, constant: -8),
        ])

           // Present the sheet view controller
           present(sheetVC, animated: true, completion: nil)
    }
    
    @objc func doneButtonTapped() {
        // Dismiss the sheet view controller
        dismiss(animated: true, completion: nil)
        
        // Update the selected date and meal in the view
        if let selectedDate = selectedDate {
            myView.update(date: selectedDate, meal: meals[selectedMealIndex])
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            // Return the number of days in the month of the selected date
            guard let selectedDate = selectedDate else { return 0 }
            let calendar = Calendar.current
            let range = calendar.range(of: .day, in: .month, for: selectedDate)!
            return range.count
        case 1:
            // Return the number of meal options
            return meals.count
        default:
            return 0
        }
    }
    
    // ...
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            // Return the day of the month for the given row
            guard let selectedDate = selectedDate else { return nil }
            let calendar = Calendar.current
            let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
            let dayOfMonth = calendar.date(byAdding: .day, value: row, to: startOfMonth)!
            return dateFormatter.string(from: dayOfMonth)
        case 1:
            // Return the meal option for the given row
            return meals[row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            // Update selected date when the date component is changed
            guard let selectedDate = selectedDate else { return }
            let calendar = Calendar.current
            let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
            let dayOfMonth = calendar.date(byAdding: .day, value: row, to: startOfMonth)!
            self.selectedDate = dayOfMonth
        case 1:
            // Update selected meal when the meal component is changed
            selectedMealIndex = row
        default:
            break
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCollectionViewCell", for: indexPath) as! TableCollectionViewCell
        
        if collectionView.tag == 1 {
            
            cell.imageView.image = UIImage(named: "Table")
            cell.nameLabel.text = "Ted"
            cell.tableNameLabel.text = "\(indexPath.row)"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}

extension ViewController: UIScrollViewDelegate {
    
    
}
