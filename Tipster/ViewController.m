//
//  ViewController.m
//  Tipster
//
//  Created by sroman98 on 6/25/19.
//  Copyright © 2019 sroman98. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIView *grayLine;
@property (weak, nonatomic) IBOutlet UILabel *dollarLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    
    if(tipPercentage == 0) {
        [defaults setDouble:0.2 forKey:@"default_tip_percentage"];
        [defaults synchronize];
        tipPercentage = 0.2;
    }
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
        self.dollarLabel.frame = CGRectMake(self.dollarLabel.frame.origin.x, self.dollarLabel.frame.origin.y + 30, self.dollarLabel.frame.size.width, self.dollarLabel.frame.size.height);
        self.grayLine.frame = CGRectMake(self.grayLine.frame.origin.x, self.grayLine.frame.origin.y - 80, self.grayLine.frame.size.width, self.grayLine.frame.size.height);
        
        self.tipLabel.alpha = 0;
        self.totalLabel.alpha = 0;
    }];
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    CGRect newFrameDollar = self.dollarLabel.frame;
    newFrameDollar.origin.y -= 30;
    
    CGRect newFrameLine = self.grayLine.frame;
    newFrameLine.origin.y += 80;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        self.dollarLabel.frame = newFrameDollar;
        self.grayLine.frame = newFrameLine;
        
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
        self.totalLabel.alpha = 1;
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    double bill = [self.billField.text doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
    self.tipLabel.alpha = 0;
    self.totalLabel.alpha = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.8 animations:^{
        self.tipLabel.alpha = 1;
        self.totalLabel.alpha = 1;
    }];
}

@end
