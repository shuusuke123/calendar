//
//  ViewController.m
//  calender
//
//  Created by 岡部　修典 on 2015/05/04.
//  Copyright (c) 2015年 岡部　修典. All rights reserved.
//
#import "ViewController.h"

@interface ViewController (){
    NSMutableDictionary *eventsByDate;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    joblv = [NSMutableArray new];
    joblv[0] = @"よろしく";
    joblv[1] = @"一意専心";
    joblv[2] = @"一念通天";
    joblv[3] = @"一生懸命";
    joblv[4] = @"勤倹力行";
    joblv[5] = @"前途多難";
    joblv[6] = @"起死回生";
    joblv[7] = @"捲土重来";
    joblv[8] = @"七転八起";
    joblv[9] = @"孜孜忽忽";
    joblv[10] = @"不眠不休";
    joblv[11] = @"忍之一字";
    joblv[12] = @"含垢忍辱";
    joblv[13] = @"忍辱負重";
    joblv[14] = @"忍気呑声";
    joblv[15] = @"耐乏生活";
    joblv[16] = @"冥冥之志";
    joblv[17] = @"磨斧作針";
    joblv[18] = @"心堅石穿";
    joblv[19] = @"吹影鏤塵";
    joblv[20] = @"十年一剣";
    joblv[21] = @"積水成淵";
    joblv[22] = @"積土成山";
    joblv[23] = @"摩頂放踵";
    joblv[24] = @"粉骨砕身";
    joblv[25] = @"奮励努力";
    joblv[26] = @"嘔心瀝血";
    joblv[27] = @"隠忍自重";
    joblv[28] = @"一心不乱";
    joblv[29] = @"刻苦勉励";
    joblv[30] = @"一所懸命";
    joblv[31] = @"大願成就";
    joblv[32] = @"威風堂々";
    joblv[33] = @"切磋琢磨";
    joblv[34] = @"明朗闊達";
    joblv[35] = @"勇気凛凛";
    joblv[36] = @"和気藹藹";
    joblv[37] = @"氾愛兼利";
    joblv[38] = @"福徳円満";
    joblv[39] = @"美意延年";
    joblv[40] = @"終わり。";
    //joblv = @"";
    
    
    int level = (int)exp / 100 +1;
    //level = level+1;
    [self expup];
    NSLog(@"level %d ",level);
    levelLabel.text = [NSString stringWithFormat:@"Lv %d", level];
    NSLog(@"exp == %ld", exp);
    jobLabel.text = joblv[level];
    //joblv[exp] = 0;
    
    
    self.calendar = [JTCalendar new];
    
       {
        self.calendar.calendarAppearance.calendar.firstWeekday = 2; // Sunday == 1, Saturday == 7
        self.calendar.calendarAppearance.dayCircleRatio = 9. / 10.;
        self.calendar.calendarAppearance.ratioContentMenu = 2.;
        self.calendar.calendarAppearance.focusSelectedDayChangeMode = YES;
           
        self.calendar.calendarAppearance.monthBlock = ^NSString *(NSDate *date, JTCalendar *jt_calendar){
            NSCalendar *calendar = jt_calendar.calendarAppearance.calendar;
            NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date];
            NSInteger currentMonthIndex = comps.month;
            
            static NSDateFormatter *dateFormatter;
            if(!dateFormatter){
                dateFormatter = [NSDateFormatter new];
                dateFormatter.timeZone = jt_calendar.calendarAppearance.calendar.timeZone;
            }
            
            while(currentMonthIndex <= 0){
                currentMonthIndex += 12;
            }
            
            NSString *monthText = [[dateFormatter standaloneMonthSymbols][currentMonthIndex - 1] capitalizedString];
            
            return [NSString stringWithFormat:@"%ld\n%@", comps.year, monthText];
        };
    }
    
    [self.calendar setMenuMonthsView:self.calendarMenuView];
    [self.calendar setContentView:self.calendarContentView];
    [self.calendar setDataSource:self];
    
    [self createRandomEvents];
    
    [self.calendar reloadData];
    
    // level
    NSDictionary *memos = [ud objectForKey:@"memos"];
    NSLog(@"memos == %@", memos);
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    exp = [ud integerForKey:@"exp"];
    NSLog(@"exp == %ld", exp);
    
   // expLabel.text = [NSString stringWithFormat:@"%ld /100", exp];
    if(exp==100){
        level = 2;
        exp = 0;
        
    }
    if(exp==200){
        level = 3;
        exp = 0;
        
    }
    if(exp==300){
        level = 4;
        exp = 0;
        
    }
    if(exp==400){
        level = 5;
        exp = 0;
        
    }

    if(exp==500){
        level = 6;
        exp = 0;
        
    }
    if(exp==600){
        level = 7;
        exp = 0;
        
    }
    if(exp==700){
        level = 8;
        exp = 0;
        
    }
    if(exp==800){
        level = 9;
        exp = 0;
        
    }
    if(exp==900){
        level = 10;
        exp = 0;
        
    }
    if(exp==1000){
        level = 11;
        exp = 0;
        
    }
    if(exp==1100){
        level = 12;
        exp = 0;
        
    }
    if(exp==1200){
        level = 13;
        exp = 0;
        
    }
    if(exp==1300){
        level = 14;
        exp = 0;
        
    }
    if(exp==1400){
        level = 15;
        exp = 0;
        
    }
    if(exp==1500){
        level = 16;
        exp = 0;
        
    }
    if(exp==1600){
        level = 17;
        exp = 0;
        
    }
    if(exp==1700){
        level = 18;
        exp = 0;
        
    }
    if(exp==1800){
        level = 19;
        exp = 0;
        
    }
    if(exp==1900){
        level = 20;
        exp = 0;
        
    }
    if(exp==2000){
        level = 21;
        exp = 0;
        
    }
    if(exp==2100){
        level = 22;
        exp = 0;
        
    }
    if(exp==2200){
        level = 23;
        exp = 0;
        
    }
    if(exp==2300){
        level = 24;
        exp = 0;
        
    }
    if(exp==2400){
        level = 25;
        exp = 0;
        
    }
    if(exp==2500){
        level = 26;
        exp = 0;
        
    }
    if(exp==2600){
        level = 27;
        exp = 0;
        
    }
    if(exp==2700){
        level = 28;
        exp = 0;
        
    }
    if(exp==2800){
        level = 29;
        exp = 0;
        
    }
    if(exp==2900){
        level = 30;
        exp = 0;
        
    }
    if(exp==3000){
        level = 31;
        exp = 0;
        
    }
    if(exp==3100){
        level = 32;
        exp = 0;
        
    }
    if(exp==3200){
        level = 33;
        exp = 0;
        
    }
    if(exp==3300){
        level = 34;
        exp = 0;
        
    }
    if(exp==3400){
        level = 35;
        exp = 0;
        
    }
    if(exp==3500){
        level = 36;
        exp = 0;
        
    }
    if(exp==3600){
        level = 37;
        exp = 0;
        
    }
    if(exp==3700){
        level = 38;
        exp = 0;
        
    }
    if(exp==3800){
        level = 39;
        exp = 0;
        
    }
    if(exp==3900){
        level = 40;
        exp = 0;
        
    }

    if(exp==99999999999){
        level =41;
        exp = 0;
        
    }
    expLabel.text = [NSString stringWithFormat:@"%ld /100", exp];

}

-(void)expup{
}

- (void)viewDidLayoutSubviews
{
    [self.calendar repositionViews];
}

#pragma mark - Buttons callback

- (IBAction)didGoTodayTouch
{
    [self.calendar setCurrentDate:[NSDate date]];
}

- (IBAction)didChangeModeTouch
{
    self.calendar.calendarAppearance.isWeekMode = !self.calendar.calendarAppearance.isWeekMode;
    
    [self transitionExample];
}

#pragma mark - JTCalendarDataSource

- (BOOL)calendarHaveEvent:(JTCalendar *)calendar date:(NSDate *)date
{
    NSString *key = [[self dateFormatter] stringFromDate:date];
    
    if(eventsByDate[key] && [eventsByDate[key] count] > 0){
        return YES;
    }
    
    return NO;
}

- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date
{
    NSString *key = [[self dateFormatter] stringFromDate:date];
    NSArray *events = eventsByDate[key];
    
    NSLog(@"Date: %@ - %ld events", date, [events count]);
    
    MemoViewController *memoVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MemoVC"];
    memoVC.date = date;
    
    [self presentViewController:memoVC animated:YES completion:nil];
}

- (void)calendarDidLoadPreviousPage
{
    NSLog(@"Previous page loaded");
}

- (void)calendarDidLoadNextPage
{
    NSLog(@"Next page loaded");
}

#pragma mark - Transition examples

- (void)transitionExample
{
    CGFloat newHeight = 300;
    if(self.calendar.calendarAppearance.isWeekMode){
        newHeight = 75.;
    }
    
    [UIView animateWithDuration:.5
                     animations:^{
                         self.calendarContentViewHeight.constant = newHeight;
                         [self.view layoutIfNeeded];
                     }];
    
    [UIView animateWithDuration:.25
                     animations:^{
                         self.calendarContentView.layer.opacity = 0;
                     }
                     completion:^(BOOL finished) {
                         [self.calendar reloadAppearance];
                         
                         [UIView animateWithDuration:.25
                                          animations:^{
                                              self.calendarContentView.layer.opacity = 1;
                                          }];
                     }];
}

#pragma mark - Fake data

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd-MM-yyyy";
    }
    
    return dateFormatter;
}

- (void)createRandomEvents
{
    eventsByDate = [NSMutableDictionary new];
    
    for(int i = 0; i < 30; ++i){
        // Generate 30 random dates between now and 60 days later
        NSDate *randomDate = [NSDate dateWithTimeInterval:(rand() % (3600 * 24 * 60)) sinceDate:[NSDate date]];
        
        // Use the date as key for eventsByDate
        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
        
        if(!eventsByDate[key]){
            eventsByDate[key] = [NSMutableArray new];
        }
        
        [eventsByDate[key] addObject:randomDate];
    }
}


@end
