//
//  ViewController.h
//  calender
//
//  Created by 岡部　修典 on 2015/05/04.
//  Copyright (c) 2015年 岡部　修典. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "JTCalendar.h"
#import "MemoViewController.h"

@interface ViewController : UIViewController<JTCalendarDataSource>{
    IBOutlet UILabel *levelLabel;
    IBOutlet UILabel *jobLabel;
    IBOutlet UIImageView *jobImageView;
    IBOutlet UILabel *expLabel;
    int level;
    NSMutableArray *joblv;
    NSInteger exp;
    
}

// method

@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarContentViewHeight;

@property (strong, nonatomic) JTCalendar *calendar;

@end
