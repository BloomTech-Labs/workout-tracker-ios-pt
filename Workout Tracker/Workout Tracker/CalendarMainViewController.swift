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
    
  @IBOutlet var calendarView: JTACMonthView!
    
    let formatter = DateFormatter()
    var numberOfRows = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.scrollDirection = .horizontal
        calendarView.scrollingMode   = .stopAtEachCalendarFrame
        calendarView.showsHorizontalScrollIndicator = true
    }
    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? DateCell  else { return }
        cell.dateLabel.text = cellState.text
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
    }
    
    func handleCellTextColor(cell: DateCell, cellState: CellState) {
        //           if cellState.dateBelongsTo == .thisMonth {
        //              cell.dateLabel.textColor = UIColor.black
        //           } else {
        //              cell.dateLabel.textColor = UIColor.gray
        //           }
        if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
        } else {
            cell.isHidden = true
        }
    }
    
    //    func sharedFunctionToConfigureCell(myCustomCell: CellView, cellState: CellState, date: Date) {
    //        myCustomCell.dayLabel.text = cellState.text
    //        if testCalendar.isDateInToday(date) {
    //            myCustomCell.backgroundColor = red
    //        } else {
    //            myCustomCell.backgroundColor = white
    //        }
    //        // more code configurations
    //        // ...
    //        // ...
    //        // ...
    //    }
    func handleCellSelected(cell: DateCell, cellState: CellState) {
        if cellState.isSelected {
            
            
            cell.selectedView.layer.cornerRadius =  (cell.selectedView.frame.size.height)/2
            //            cell.selectedView.layer.masksToBounds = true
            //            cell.selectedView.clipsToBounds = true
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
    
}

extension CalendarMainViewController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        //        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 01 01")!
        let endDate = Date()
        if numberOfRows == 6 {
            return ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: numberOfRows)
        } else {
            return ConfigurationParameters(startDate:    startDate,endDate:endDate,numberOfRows: numberOfRows,generateInDates: .forFirstMonthOnly,generateOutDates: .off,hasStrictBoundaries: false)
        }
    }
    //        return ConfigurationParameters(startDate: startDate,
    //                                       endDate: endDate,
    //                                       generateInDates: .forAllMonths,
    //                                       generateOutDates: .tillEndOfGrid)
    //    }
    
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
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, shouldSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) -> Bool{
        return true // Based on a criteria, return true or false
    }
    
    //MARK: Headers
    
    
    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        
        //        let formatter = DateFormatter()  // Declare this outside, to avoid instancing this heavy class multiple times.
        formatter.dateFormat = "MMM"
        
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "DateHeader", for: indexPath) as! DateHeader
        header.monthTitle.text = formatter.string(from: range.start)
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 50)
    }
}
