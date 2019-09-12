//
//  SugViewController.m
//  CellDemo
//
//  Created by nemo on 2019/9/12.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "SugViewController.h"
#import "SugTableViewCell.h"
#import "ListSugModel.h"

@interface SugViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray;
@end

@implementation SugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Sug";
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[SugTableViewCell class] forCellReuseIdentifier:@"sugCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedRowHeight = 44;
    
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data2" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *sugs = rootDict[@"data"][@"data"];
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[ListSugModel class] json:sugs];
    self.dataArray = modelArray.copy;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SugTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sugCell"];
    ListSugModel *model = self.dataArray[indexPath.row];
    [cell configCell:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

@end
