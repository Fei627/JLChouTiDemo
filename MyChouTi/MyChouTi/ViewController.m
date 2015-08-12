//
//  ViewController.m
//  MyChouTi
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 高建龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UICollectionView *secondView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"抽屉效果";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    [self.view addSubview:self.tableView];
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(-150, 200, 150, 300)];
    //self.leftView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.leftView];
    
    NSArray *arr = @[@"表视图",@"集合视图",@"设置"];
    for (int i = 0; i < 3; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 60 + 75 * i, 150, 30);
        [button setTitle:arr[i] forState:UIControlStateNormal];
        button.tag = 200 + i;
        [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.leftView addSubview:button];
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonClick)];
    
    //第二个按钮对应的视图
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 5;//上下最小间距
    flowLayout.minimumInteritemSpacing = 10;//左右最小间距
    flowLayout.itemSize = CGSizeMake(100, 80);//设置单元格大小
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//设置滑动方向
    
    self.secondView = [[UICollectionView alloc] initWithFrame:CGRectMake(375, 0, 375, 667) collectionViewLayout:flowLayout];
    self.secondView.delegate = self;
    self.secondView.dataSource = self;
    
    self.secondView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.secondView];
    
    //注册UICollectionViewCell
    [self.secondView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collection"];
    
    
}


-(void)buttonClickAction:(UIButton *)sender
{
    
    switch (sender.tag) {
        
        case 200:
        {
            [UIView animateWithDuration:1.0f animations:^{
                
                self.tableView.frame = CGRectMake(0, 0, 375, 667);
                self.leftView.frame = CGRectMake(-150, 200, 150, 300);
            }];
            break;
        }
        case 201:
        {
            NSLog(@"集合视图");
            if (self.secondView.frame.origin.x == 375) {
                
                [UIView animateWithDuration:1.0f animations:^{
                    
                    self.secondView.frame = CGRectMake(0, 0, 375, 667);
            
                }];
                
            } else {
                
                self.secondView.frame = CGRectMake(375, 0, 375, 667);
            }
            
            break;
        }
        case 202:
        {
            NSLog(@"设置");
            
            break;
        }
            
        default:
            break;
    }
    
}

#pragma mark -- 分类 按钮的点击--
-(void)rightBarButtonClick
{
    
    if (self.tableView.frame.origin.x == 0) {
        
        [UIView animateWithDuration:0.5f animations:^{
            
            self.tableView.frame = CGRectMake(150, 150, 375, 450);
            self.leftView.frame = CGRectMake(0, 200, 150, 300);
            self.secondView.frame = CGRectMake(375, 0, 375, 667);
            
        }];
        
    } else {
        
        [UIView animateWithDuration:0.5f animations:^{
            
            self.tableView.frame = CGRectMake(0, 0, 375, 667);
            self.leftView.frame = CGRectMake(-150, 200, 150, 300);
            self.secondView.frame = CGRectMake(375, 0, 375, 667);

        }];
    }
}

#pragma mark --表视图 delegate--

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.textLabel.text = @"第1个界面";
    
    return cell;
    
}

#pragma mark --集合视图  delegate--

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    return cell;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
