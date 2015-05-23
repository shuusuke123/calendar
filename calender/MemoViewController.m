//
//  MemoViewController.m
//  calender
//
//  Created by 岡部　修典 on 2015/05/04.
//  Copyright (c) 2015年 岡部　修典. All rights reserved.
//

#import "MemoViewController.h"

@interface MemoViewController ()

@end

@implementation MemoViewController

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return choices.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return choices[row];
}

-(IBAction)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)closeKeyboard {
    [memoTV resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timePicker.delegate = self;
    timePicker.dataSource = self;
    
    memoTV.delegate = self;
    
    choices = @[@"1min", @"3min", @"5min",@"10min",@"15min",@"20min",@"25min",@"30min",@"35min",@"40min",@"45min",@"50min",@"55min",];
    
    hour=@[@"00:00",@"01:00",@"02:00",@"03:00",@"04:00",@"05:00",@"06:00",@"07:00",@"08:00",@"09:00",@"10:00",@"11:00",@"12:00",@"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00",@"22:00",@"23:00"];
    //ボタンが切り替えられたらボタンONを呼び出す
    [button addTarget:self action:@selector(buttonon) forControlEvents:UIControlEventValueChanged];

    
    choiceValues = @[@1,@3,@5,@10,@15,@20,@25,@30,@35,@40,@45,@50,@55,@59];
    
    NSDateFormatter *f = [NSDateFormatter new];
    f.dateFormat = @"MM/dd";
    dateStr = [f stringFromDate:self.date];
    
    memos = [NSMutableDictionary new];
    
    
    dateLabel.text = dateStr;
    table.delegate = self;
    table.dataSource =self;
    
    // すでにその日付のKeyで保存されているメモを取り出してmemoTextViewに表示
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *memoString = [ud objectForKey:dateStr];
    memoTV.text = memoString;
}

- (void)viewWillDisappear:(BOOL)animated {
    // 画面を閉じる直前にNSUserDefaults領域に、dateStrに入っているKeyでmemoTextViewに入っている値を保存
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:memoTV.text forKey:dateStr];
    // 経験値の計算(もともと溜まっていた経験値に今の文字数を足す
    NSInteger exp = [ud integerForKey:@"exp"];
    exp = exp + [dateStr length];
    [ud setInteger:exp forKey:@"exp"];
    [ud synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 24;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *when = hour[indexPath.row];
    
    if(!memos[when]) memos[when] = [NSMutableArray new];
    
    NSDateComponents *cp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self.date];
    
    [memos[when] addObject:memoTV.text];
    
    NSLog(@"%@", memos);
}

-(void)buttonon{
    if(button.on){
        int selected = (int)[timePicker selectedRowInComponent:0];
        int minutes = [choiceValues[selected] intValue];
        NSLog(@"m: %d", minutes);
        //memo保存
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:memos forKey:@"memos"];
        [ud synchronize];
        
        //通知
        UILocalNotification *notfication =[[UILocalNotification alloc] init];
        notfication.fireDate = [NSDate dateWithTimeIntervalSinceNow: 60 * minutes ];
        notfication.timeZone = [NSTimeZone defaultTimeZone];
        notfication.alertBody = [NSString stringWithFormat:@"%d分経ちました", minutes];
        [[UIApplication sharedApplication] scheduleLocalNotification:notfication];
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        
        
        [self timerstart];
   // }else{[[notfication.userInfo ]
        
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
    }
    
    UILabel *timeLabel = UILabel.new;
    timeLabel.text = hour[indexPath.row];
    //@"00:00",@"01:00",@"02:00",@"03:00",@"04:00",@"05:00",@"06:00",@"07:00",@"08:00",@"09:00",@"10:00",@"11:00",@"12:00",@"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00",@"22:00",@"23:00";
    timeLabel.frame = CGRectMake(0, 0, 89, 43);
    
    [cell.contentView addSubview:timeLabel];
    
    return cell;
    
}

-(void)timerstart{
    NSTimer *timer =
    [NSTimer
     scheduledTimerWithTimeInterval:1.5f
     target:self
     selector:@selector(hogeMethod:)
     userInfo:nil
     repeats:YES
     ];


}

@end
