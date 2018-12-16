//
//  ViewController.m
//  TWICE schedule
//
//  Created by 민대홍 on 06/12/2018.
//  Copyright © 2018 민대홍. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *query=nil;
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://twiceapi.ialpha.kr/schedule/?token=ios"]];
    NSError *error=nil;
    id response=[NSJSONSerialization JSONObjectWithData:data options:
                 NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
    
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
        query = @"OFF - 네트워크 상태를 확인해주세요.";
    } else {
        query = [NSString stringWithFormat:@"Schedule: %@ - %@", [self ScheduleOptions:[response objectForKey:@"event"]], [response objectForKey:@"Data"]];
        NSLog(@"%@",query);
    }
    [_ScheduleDisplay setText:query];
    
}

- (NSString*) ScheduleOptions:(NSString*)strings{
    if([strings isEqualToString:@"O"]){
        strings = @"OFF";
    }else if([strings isEqualToString:@"T"]){
        strings = @"TV";
    }else if([strings isEqualToString:@"R"]){
        strings = @"RADIO";
    }else if([strings isEqualToString:@"E"]){
        strings = @"ETC";
    }else if([strings isEqualToString:@"C"]){
        strings = @"CONCERT";
    }else if([strings isEqualToString:@"M"]){
        strings = @"Magazine";
    }
    return strings;
}


@end
