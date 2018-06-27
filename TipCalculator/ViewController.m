//
//  ViewController.m
//  TipCalculator
//
//  Created by Youngmin Shin on 6/26/18.
//  Copyright © 2018 Youngmin Shin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *tipTitle;
@property (weak, nonatomic) IBOutlet UILabel *totalTitle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Tip Calculator";
    
    self.tipLabel.alpha = 0;
    self.totalLabel.alpha = 0;
    self.tipTitle.alpha = 0;
    self.totalTitle.alpha = 0;
    self.tipControl.alpha = 0;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"View will appear");
    
    
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.2), @(0.25)];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger defaultTipIndex = (NSInteger)[defaults integerForKey:@"default-tip-i"];
    double tipPercent = [percentages[defaultTipIndex] doubleValue];
    double tip = bill * tipPercent;
    double total = bill + tip;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.tipControl.selectedSegmentIndex = defaultTipIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello all!");
    [self.view endEditing:YES];
    
   
}

- (IBAction)onEdit:(id)sender {
    
    
    double bill = [self.billField.text doubleValue];
 
    NSArray *percentages = @[@(0.15), @(0.2), @(0.25)];
    double tipPercent = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = bill * tipPercent;
    double total = bill + tip;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    
    CGRect totalTFrame = self.totalTitle.frame;
    totalTFrame.origin.y += 60;
    
    CGRect tipTFrame = self.tipTitle.frame;
    tipTFrame.origin.y += 60;
    
    CGRect tipControlFrame = self.tipControl.frame;
    tipControlFrame.origin.y += 60;
    
    CGRect tipLFrame = self.tipLabel.frame;
    tipLFrame.origin.y += 60;
    
    CGRect totalLFrame = self.totalLabel.frame;
    totalLFrame.origin.y += 60;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.totalTitle.frame = totalTFrame;
        self.tipTitle.frame = tipTFrame;
        self.tipControl.frame = tipControlFrame;
        self.tipLabel.frame = tipLFrame;
        self.totalLabel.frame = totalLFrame;
    
        
        self.tipLabel.alpha = 0;
        self.totalLabel.alpha = 0;
        self.tipTitle.alpha = 0;
        self.totalTitle.alpha = 0;
        self.tipControl.alpha = 0;
    }];

}

- (IBAction)onEditingEnd:(id)sender {
    
    CGRect totalTFrame = self.totalTitle.frame;
    totalTFrame.origin.y -= 60;
    
    CGRect tipTFrame = self.tipTitle.frame;
    tipTFrame.origin.y -= 60;
    
    CGRect tipControlFrame = self.tipControl.frame;
    tipControlFrame.origin.y -= 60;
    
    CGRect tipLFrame = self.tipLabel.frame;
    tipLFrame.origin.y -= 60;
    
    CGRect totalLFrame = self.totalLabel.frame;
    totalLFrame.origin.y -= 60;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.totalTitle.frame = totalTFrame;
        self.tipTitle.frame = tipTFrame;
        self.tipControl.frame = tipControlFrame;
        self.tipLabel.frame = tipLFrame;
        self.totalLabel.frame = totalLFrame;
        
        self.tipLabel.alpha = 1;
        self.totalLabel.alpha = 1;
        self.tipTitle.alpha = 1;
        self.totalTitle.alpha = 1;
        self.tipControl.alpha = 1;
    }];
  
    
}

@end
