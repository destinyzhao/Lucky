//
//  MainViewController.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "BaseNavigationController.h"
#import "BaseTabbar.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self setupAllChildViewControllers];
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    HomeViewController *home = [[HomeViewController alloc] init];
    home.title = @"首页";
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home_n" selectedImageName:@"tabbar_home_s"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    discover.title = @"发现";
    [self setupChildViewController:discover title:@"发现" imageName:@"tabbar_discover_n" selectedImageName:@"tabbar_discover_s"];
    
    // 设置自定义的tabbar
    [self setCustomtabbar];
    
    self.selectedIndex = 0;
    
}

- (void)setCustomtabbar{
    
    BaseTabbar *tabbar = [[BaseTabbar alloc]initWithFrame:self.tabBar.bounds];
    tabbar.tabbarCount = self.viewControllers.count;
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)centerBtnClick:(UIButton *)btn{
   
}


/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
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
