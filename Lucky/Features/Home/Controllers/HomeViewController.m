//
//  HomeViewController.m
//  Lucky
//
//  Created by Destiny on 2018/11/14.
//  Copyright © 2018 Destiny. All rights reserved.
//

#import "HomeViewController.h"
#import "LuckyCell.h"
#import "SortHelper.h"
#import "RandomHelper.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *luckyButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *luckyTf;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSMutableArray *luckyBallArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupHomeView];
    [self registerCell];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 初始化
- (void)setupHomeView
{
    self.luckyButton.layer.masksToBounds = YES;
    self.luckyButton.layer.cornerRadius = 8.;
    self.luckyButton.layer.borderWidth = 1;
    self.luckyButton.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:0.8].CGColor;
    
    [self.luckyButton setTitleColor:[[UIColor redColor]colorWithAlphaComponent:8.8] forState:UIControlStateSelected];
    [self.luckyButton setTitleColor:[[UIColor redColor]colorWithAlphaComponent:8.8] forState:UIControlStateNormal];
}

- (void)registerCell
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"LuckyCell" bundle:nil] forCellReuseIdentifier:@"LuckyCell"];
}

#pragma mark - TableView Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.luckyBallArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"LuckyCell";
    LuckyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (self.luckyBallArr.count > indexPath.row) {
       [cell setBallArr:_luckyBallArr[indexPath.row]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}


#pragma mark - 按钮事件

- (IBAction)luckyAction:(UIButton *)sender {
    
    // 关闭键盘
    [self closeKeyBoard];
    
    if ([self checkLuckyNum]) {
        sender.selected = !sender.selected;
        
        if (sender.selected) {
            // 输入框不可用
            self.luckyTf.enabled = NO;
            [self startTimer];
            [self.luckyButton setTitle:@"停止投注" forState:UIControlStateSelected];
        }
        else{
            // 输入框可用
            self.luckyTf.enabled = YES;
            [self stopTimer];
            [self.luckyButton setTitle:@"开始投注" forState:UIControlStateNormal];
        }
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)luckyBallArr
{
    if (!_luckyBallArr) {
        _luckyBallArr = [NSMutableArray array];
    }
    return _luckyBallArr;
}

#pragma mark - 私有方法

/**
 启动计时器
 */
- (void)startTimer
{
    if (!_timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(getLuckyBall) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

/**
 停止计时器
 */
- (void)stopTimer
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}


/**
 检查输入

 @return Bool
 */
- (BOOL)checkLuckyNum
{
    if (self.luckyTf.text.length == 0) {
        [MBProgressHUD showWarnMessage:@"请输入投注数量"];
        return NO;
    }
    return YES;
}

/**
 生成一组双色球数组

 @return 双色球
 */
-(NSMutableArray *)getRedLuckyNum{
    
    // 红球数组
    NSMutableArray *redArray = [NSMutableArray array];
    // 生成6个随机不重复的数字，范围：1-33
    for (int i = 0;i < 6; i ++) {
        NSString *randomRed = [NSString stringWithFormat:@"%d",[RandomHelper getRandomNumber:1 to:33]];
        
        if(redArray.count==0){
            [redArray addObject:randomRed];
            continue;//进行下一次循环
        }
        
        BOOL isHave=[redArray containsObject:randomRed];//判断数组中有没有重复
        if(isHave){
            // 重复需要重新获取因此随机数因此i-1
            i--;
            continue;//进行下一次循环
        }
        
        [redArray addObject:randomRed];
        
    }
    // 篮球随机数
    NSString *randomBlue = [NSString stringWithFormat:@"%d",[RandomHelper getRandomNumber:1 to:16]];
    
    // 红球排序后数组
    NSArray *sortRedArr = [SortHelper sortArray:redArray];
    
    NSMutableArray *luckyArr = [NSMutableArray arrayWithArray:sortRedArr];
    // 篮球加入最后
    [luckyArr addObject:randomBlue];
    
    return luckyArr;
}


/**
 获取双色球数组
 */
- (void)getLuckyBall
{
    if (self.luckyBallArr.count) {
        [self.luckyBallArr removeAllObjects];
    }
    
    for (NSInteger i = 0; i < [self.luckyTf.text intValue]; i++) {
        NSMutableArray *ballArr = [self getRedLuckyNum];
        [self.luckyBallArr addObject:ballArr];
    }
    
    [self.tableView reloadData];
}

@end
