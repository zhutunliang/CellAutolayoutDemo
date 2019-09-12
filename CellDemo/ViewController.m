//
//  ViewController.m
//  CellDemo
//
//  Created by nemo on 2019/9/11.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
#import "ListModel.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray;

@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度,已经缓存的高度，可以不用每次都计算，直接从缓存中拿。
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Feed";
    
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[ListTableViewCell class] forCellReuseIdentifier:@"listCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
#pragma mark NOTE::::UITableViewAutomaticDimension ，可以不用计算高度，在cell里自动布局，但要注意的是，cell的布局，必须有一个纵向的线，使cell撑开。而且必须得设置 estimatedRowHeight ,否则计算出的高度永远是44 
    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 44;
    
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feeds = rootDict[@"feed"];
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[ListModel class] json:feeds];
    self.dataArray = modelArray.copy;
    [self.tableView reloadData];
    
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    ListModel *model = self.dataArray[indexPath.row];
    [cell configModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = self.heightAtIndexPath[indexPath];
    if (height) {
        return height.floatValue;
    } else {
        return 100;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = cell.frame.size.height;
    [self.heightAtIndexPath setObject:@(height) forKey:indexPath];
    NSLog(@"%f-----%ld",cell.frame.size.height,(long)indexPath.row);
}

#pragma mark - Lazy load

- (NSMutableDictionary*)heightAtIndexPath {
    if (_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
}

@end
