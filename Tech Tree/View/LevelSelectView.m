//
//  LevelSelectView.m
//  Tech Tree
//
//  Created by Suzy Lee on 8/5/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "LevelSelectView.h"

@interface LevelSelectView ()
@property (weak, nonatomic) IBOutlet UIButton *firstLevelButton;

@end

@implementation LevelSelectView

- (void)viewDidLoad {
    [super viewDidLoad];
    [_firstLevelButton.layer setCornerRadius:10.0];
    [_firstLevelButton setClipsToBounds:YES];
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
