//
//  CalendarMainViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/25/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarMainViewController: UIViewController {
    
    @IBOutlet weak var calendarViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var calendarView: JTACMonthView!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var monthLabel2: UILabel!
    let formatter = DateFormatter()
    var numberOfRows = 6
    var monthLabelDate = Date()
    var selectedDates = [Date]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.scrollDirection = .horizontal
        calendarView.scrollingMode   = .stopAtEachCalendarFrame
        calendarView.showsHorizontalScrollIndicator = true
        calendarView.visibleDates { (visibleDates) in
            self.setUpMonthViews(from: visibleDates)
        }
        
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        self.calendarView.reloadData(withAnchor: Date())
    //    }
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
    }
    
    func handleCellTextColor(cell: DateCell, cellState: CellState) {
        //                   if cellState.dateBelongsTo == .thisMonth {
        //                      cell.dateLabel.textColor = UIColor.black
        //                   } else {
        //                      cell.dateLabel.textColor = UIColor.gray
        //                   }
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
            
            cell.selectedView.isHidden = false
            
        } else {
            cell.selectedView.isHidden = true
        }
    }
    
    
    //    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    //        let visibleDates = calendarView.visibleDates()
    //        calendarView.viewWillTransition(to: .zero, with: coordinator, anchorDate: visibleDates.monthDates.first?.date)
    //    }  -< To rotate views
    
    @IBAction func toggleWeekView(_ sender: Any) {
        if numberOfRows == 6 {
            
            calendarView.selectDates(selectedDates)
            
            self.calendarView.alpha = 0
            self.calendarViewHeightConstraint.constant = 58.33
            self.numberOfRows = 1
            
            //            self.calendarView.transform = view.transform.scaledBy(x: 1, y: 0.5)
            //            let scale = CGAffineTransform(scaleX: 1, y: 1)
            //            self.view.transform = scale
            
            let translate = CGAffineTransform(translationX: 0, y: 30)
            self.calendarView.transform = translate
            
            UIView.animate(withDuration: 0.2, delay: 0, options: [.transitionCurlUp], animations: {
                //                self.view.layoutIfNeeded()
                //page curl
                //                UIView.transition(with: self.calendarView, duration: 2, options: .transitionCrossDissolve, animations: {
                self.calendarView.layoutIfNeeded()
                self.calendarView.alpha = 1
                self.calendarView.transform = .identity
                //page curl end
            }) { completed in self.calendarView.reloadData(withAnchor:self.monthLabelDate)
            } }
        else {
            calendarView.selectDates(selectedDates)
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
    }
    
}

extension CalendarMainViewController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 01 01")!
        let endDate = Date()
        if numberOfRows == 6 {
            return ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: numberOfRows, generateInDates: .forAllMonths,generateOutDates: .tillEndOfRow)
        } else {
            return ConfigurationParameters(startDate:    startDate,endDate:endDate,numberOfRows: numberOfRows,generateInDates: .forFirstMonthOnly,generateOutDates: .off,hasStrictBoundaries: false)
        }
    }
    
}


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
        //check cell state
        //if cell state is already selected then
    
        configureCell(view: cell, cellState: cellState)
        //MARK: improvement
        //        could do a set date here
        //save index path?
        selectedDates.append(date)
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
