//
//  MemoViewController.h
//  ;
//
//  Created by 岡部　修典 on 2015/05/04.
//  Copyright (c) 2015年 岡部　修典. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate,UITableViewDataSource,UITableViewDelegate> {
    IBOutlet UIPickerView *timePicker;
    IBOutlet UITextView *memoTV;
    IBOutlet UILabel *dateLabel;
    IBOutlet UITableView *table;
    NSArray *choices;
    NSArray *choiceValues;
    NSArray *hour;
    NSTimer *time;
    NSMutableDictionary *memos;
    IBOutlet UISwitch *button;
    NSString *dateStr;
}

-(IBAction)back;
-(IBAction)closeKeyboard;
-(void)buttonon;

@property (nonatomic) NSDate *date;

@end
