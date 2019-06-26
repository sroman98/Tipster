//
//  SettingsViewController.m
//  Tipster
//
//  Created by sroman98 on 6/25/19.
//  Copyright © 2019 sroman98. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;
@property (weak, nonatomic) IBOutlet UISlider *percentageSlider;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    NSLog(@"%@", [NSString stringWithFormat:@"eee %f",doubleValue]);
    
    int sliderValue = doubleValue*100;
    
    NSLog(@"%@", [NSString stringWithFormat:@"aaa %d",sliderValue]);
    
    self.percentageLabel.text = [NSString stringWithFormat:@"%d%%",sliderValue];
    self.percentageSlider.value = sliderValue;
}

- (IBAction)onEdit:(id)sender {
    int sliderValue = self.percentageSlider.value;
    
    
    self.percentageLabel.text = [NSString stringWithFormat:@"%d%%",sliderValue];
    
    double defaultPercentage = (double)sliderValue / 100;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:defaultPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
