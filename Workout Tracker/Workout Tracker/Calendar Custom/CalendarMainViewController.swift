//
//  CalendarMainViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/25/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit
import JTAppleCalendar

protocol CalendarMainViewControllerDelegate: class {
    func calendarController(_ controller: CalendarMainViewController, didSelect date: Date)
}


class CalendarMainViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var calendarViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var calendarView: JTACMonthView!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var monthLabel2: UILabel!
    let formatter = DateFormatter()
    var numberOfRows = 6
    var monthLabelDate = Date()
    var selectedDates = [Date]()
    let numOfRandomEvent = 100
    
    weak var delegate: CalendarMainViewControllerDelegate?
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.scrollDirection = .horizontal
        calendarView.scrollingMode   = .stopAtEachCalendarFrame
        calendarView.showsHorizontalScrollIndicator = true
        calendarView.visibleDates { (visibleDates) in
            self.setUpMonthViews(from: visibleDates)
            self.showToday(animate: false)
        }
        //       self.showToday(animate: false)
        
    }
    //MARK: View Setup
    func setUpMonthViews(from visibleDates: DateSegmentInfo) {
        monthLabelDate = visibleDates.monthDates.first!.date
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: monthLabelDate)
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: monthLabelDate)
        monthLabel2.text = "\(month), \(year)"
    }
    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? DateCell  else { return }
        cell.dateLabel.text = cellState.text
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
        
        if WorkoutStorage.shared.fetch(exerciseDate: cellState.date) != [] {
                   cell.eventView.isHidden = false
               } else {
                   cell.eventView.isHidden = true
                   
               }
    }
    

    func handleCellTextColor(cell: DateCell, cellState: CellState) {
        //if cellState.dateBelongsTo == .thisMonth {
        //cell.dateLabel.textColor = UIColor.black
        //} else {
        //      cell.dateLabel.textColor = UIColor.gray
        //}
        if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
        } else {
            cell.isHidden = true
        }
    }
    
    
    func handleCellSelected(cell: DateCell, cellState: CellState) {
        if cellState.isSelected {
            
            cell.selectedView.layer.cornerRadius =  (cell.selectedView.frame.size.height)/2
            cell.selectedView.layer.borderWidth = 1
            cell.selectedView.layer.borderColor = #colorLiteral(red: 0.8314941525, green: 0.4086731076, blue: 0.1624955237, alpha: 1)
            
            cell.selectedView.isHidden = false
            
        } else {
            cell.selectedView.isHidden = true
        }
    }
    
    
    //    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    //        let visibleDates = calendarView.visibleDates()
    //        calendarView.viewWillTransition(to: .zero, with: coordinator, anchorDate: visibleDates.monthDates.first?.date)
    //    }  -< To rotate views
    //MARK: In case of buttons instead of segmented control
    /*
     @IBAction func toggleWeekView(_ sender: Any) {
     if numberOfRows == 6 {
     // note: bugging out with .selectDates
     //            calendarView.selectDates(selectedDates)
     
     self.calendarView.alpha = 0
     self.calendarViewHeightConstraint.constant = 58.33
     self.numberOfRows = 1
     
     let translate = CGAffineTransform(translationX: 0, y: 30)
     self.calendarView.transform = translate
     
     UIView.animate(withDuration: 0.2, delay: 0, options: [.transitionCurlUp], animations: {
     self.calendarView.layoutIfNeeded()
     self.calendarView.alpha = 1
     self.calendarView.transform = .identity
     }) { completed in self.calendarView.reloadData(withAnchor:self.monthLabelDate)
     } }
     else {
     //calendarView.selectDates(selectedDates)
     self.calendarView.alpha = 0
     self.calendarViewHeightConstraint.constant = 350
     self.numberOfRows = 6
     let translate = CGAffineTransform(translationX: 0, y: 30)
     self.calendarView.transform = translate
     
     UIView.animate(withDuration: 0.3, delay: 0.1, options: [.transitionCurlUp], animations: {
     self.calendarView.layoutIfNeeded()
     self.calendarView.alpha = 1
     self.calendarView.transform = .identity
     self.calendarView.reloadData(withAnchor: self.monthLabelDate)
     })
     }
     }
     
     @IBAction func toggleMonthView(_ sender: Any) {
     if numberOfRows == 6 {
     self.calendarView.alpha = 0
     self.calendarViewHeightConstraint.constant = 58.33
     self.numberOfRows = 1
     let translate = CGAffineTransform(translationX: 0, y: 30)
     self.calendarView.transform = translate
     UIView.animate(withDuration: 0.2, animations: {
     self.calendarView.layoutIfNeeded()
     self.calendarView.alpha = 1
     self.calendarView.transform = .identity
     }) { completed in
     DispatchQueue.main.async {
     self.calendarView.reloadData(withAnchor: self.monthLabelDate)
     }
     }
     } else {
     self.calendarView.alpha = 0
     self.calendarViewHeightConstraint.constant = 350
     self.numberOfRows = 6
     let translate = CGAffineTransform(translationX: 0, y: 30)
     self.calendarView.transform = translate
     
     UIView.animate(withDuration: 0.2, animations: {
     self.calendarView.layoutIfNeeded()
     self.calendarView.alpha = 1
     self.calendarView.transform = .identity
     DispatchQueue.main.async {
     self.calendarView.reloadData(withAnchor: self.monthLabelDate)
     }
     })
     }
     } */
    
    
    @IBAction func toggleCalendarViewWithSegmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if numberOfRows == 1 {
                self.calendarView.alpha = 0
                self.calendarViewHeightConstraint.constant = 350
                self.numberOfRows = 6
                let translate = CGAffineTransform(translationX: 0, y: 30)
                self.calendarView.transform = translate
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.calendarView.layoutIfNeeded()
                    self.calendarView.alpha = 1
                    self.calendarView.transform = .identity
                    DispatchQueue.main.async {
                        self.calendarView.reloadData(withAnchor: self.monthLabelDate)
                    }
                })
            }
        case 1:
            if numberOfRows == 6 {
                self.calendarView.alpha = 0
                self.calendarViewHeightConstraint.constant = 58.33
                self.numberOfRows = 1
                let translate = CGAffineTransform(translationX: 0, y: 30)
                self.calendarView.transform = translate
                UIView.animate(withDuration: 0.2, animations: {
                    self.calendarView.layoutIfNeeded()
                    self.calendarView.alpha = 1
                    self.calendarView.transform = .identity
                }) { completed in
                    DispatchQueue.main.async {
                        self.calendarView.reloadData(withAnchor: self.monthLabelDate)
                    }
                }
            }
        default:
            break
        }
    }
    
}
//MARK: Calendar Data Source
extension CalendarMainViewController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 01 01")!
        //        let endDate = Date()
        let endDate = formatter.date(from: "2020 10 01")!
        if numberOfRows == 6 {
            return ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: numberOfRows, generateInDates: .forAllMonths,generateOutDates: .tillEndOfRow)
        } else {
            return ConfigurationParameters(startDate:    startDate,endDate:endDate,numberOfRows: numberOfRows,generateInDates: .forFirstMonthOnly,generateOutDates: .off,hasStrictBoundaries: false)
        }
    }
    
}

//MARK: Calendar Delegate
extension CalendarMainViewController: JTACMonthViewDelegate {
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell =
            calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return cell
        
        
    }
    
    //MARK: Cell Selection
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! DateCell
        //        cell.dateLabel.text = cellState.text
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        
        
        configureCell(view: cell, cellState: cellState)
        
        selectedDates.append(date)
        //delegate to reload tableview 
        delegate?.calendarController(self, didSelect: date)
    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, shouldSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) -> Bool{
        return true // Based on a criteria, return true or false
    }
    
    
    
    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setUpMonthViews(from: visibleDates)
        calendarView.selectDates(selectedDates)
        
    }
    
}
//MARK: Show today
extension CalendarMainViewController {
    //     @objc func showTodayWithAnimate() {
    //         showToday(animate: true)
    //     }
    
    func showToday(animate:Bool) {
        
        calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: true, animateScroll: animate, preferredScrollPosition: nil, extraAddedOffset: 0) {
            self.calendarView.selectDates([Date()])
            //         self.delegate?.calendarController(self, didSelect: Date())
            //         calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: true, animateScroll: animate, preferredScrollPosition: nil, extraAddedOffset: 0) { [unowned self] in
            ////             self.getSchedule()
            //            self.delegate?.calendarController(self, didSelect: Date())
            //             self.calendarView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
            //                 self.setUpMonthViews(from: visibleDates)
            //             }
            //
            // //            self.adjustCalendarViewHeight()
            //             self.calendarView.selectDates([Date()])
            //         }
            //     }
        }
    }
}
