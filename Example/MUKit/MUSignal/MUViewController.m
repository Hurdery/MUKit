//
//  MUViewController.m
//  elmsc
//
//  Created by zeng ping on 2017/7/3.
//  Copyright © 2017年 Jekity. All rights reserved.
//

#import "MUViewController.h"
#import "MUView.h"
#import <UIViewController+MUPopup.h>
#import <MUPopupController.h>
#import "MUNavigation.h"
#import <UIImage+MUColor.h>


@interface MUViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *sView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;
@property (weak, nonatomic) IBOutlet MUView *MUView;

@property(nonatomic, strong)MUCloudModel *cloundModel;
@end

@implementation MUViewController
- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"Apple";
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
        self.contentSizeInPopup = CGSizeMake(300, 400);
        self.landscapeContentSizeInPopup = CGSizeMake(400, 200);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarBackgroundImageMu = [UIImage imageFromColorMu:[UIColor orangeColor]];
    self.imageView.userInteractionEnabled = YES;

//    //直接改变UIControl事件触发，信号名默认为控件变量名
//    self.textField.clickSignalName  = @"text";
//    self.textField.allControlEvents = UIControlEventEditingDidEnd;
//    [self.textField addTarget:self action:@selector(idi) forControlEvents:UIControlEventEditingDidEnd];
//
//    //直接改变UIControl事件触发，并设置信号；信号设置与改变事件触发间无顺序
//    self.textField.allControlEvents = UIControlEventEditingDidEndOnExit;
//    self.textField.clickSignalName  = @"text";//可以设置信号名，如果不设置则使用变量名
    
    //用链式编程设置属性，属性一样则覆盖前一个
self.textField.setSignalName(@"text").controlEvents(UIControlEventEditingDidEndOnExit).enforceTarget(self);
self.textField.controlEvents(UIControlEventEditingDidEndOnExit).setSignalName(@"text").enforceTarget(self);
    

//    self.cloundModel = [MUCloudModel initWithRetainObject:self keyPath:@"cloundModel"];
    self.cloundModel = [MUCloudModel cloudModel];
    self.cloundModel.name = @"123456";
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      NSLog(@"name===%@=====%@======%@",self.cloundModel.name,self.cloundModel.age,self.cloundModel.sex);
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
-(void)idi
{
    NSLog(@"我是控制器上的信号----------%@",self.textField.text);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
Click_MUSignal(sView){
     NSLog(@"我是控制器上的信号----------%@",NSStringFromClass([object class]));
}

Click_MUSignal(button){
    [self.navigationController pushViewController:[NSClassFromString(@"MUKitSignalTableViewController") new] animated:YES];
}
Click_MUSignal(segmented){
     NSLog(@"我是控制器上的信号----------%@",NSStringFromClass([object class]));
}
Click_MUSignal(textField){
    
    
    NSLog(@"我是控制器上的信号----------%@",self.textField.text);
}
Click_MUSignal(text){
     NSLog(@"我是控制器上的信号----------%@",NSStringFromClass([object class]));
    NSLog(@"我是控制器上的信号----------%@",self.textField.text);
}
Click_MUSignal(imageView){
      NSLog(@"我是控制器上的信号----------%@",NSStringFromClass([object class]));
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
