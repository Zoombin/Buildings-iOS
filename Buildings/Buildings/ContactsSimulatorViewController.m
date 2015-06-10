//
//  ContactsSimulatorViewController.m
//  Buildings
//
//  Created by zhangbin on 6/10/15.
//  Copyright (c) 2015 zoombin. All rights reserved.
//

#import "ContactsSimulatorViewController.h"

@interface ContactsSimulatorViewController () <UITableViewDelegate, UITableViewDataSource>

@property (readwrite) NSArray *contacts;
@property (readwrite) UITableView *tableView;

@end

@implementation ContactsSimulatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"通讯录";
	
	_contacts = @[@{@"name": @"张三", @"phone": @"13888888888"},
				  @{@"name": @"李四", @"phone": @"180111111111"}
				  ];
	
	_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	[self.view addSubview:_tableView];
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancel {
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
	}
	NSDictionary *contact = _contacts[indexPath.row];
	cell.textLabel.text = contact[@"name"];
	cell.detailTextLabel.text = contact[@"phone"];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary *contact = _contacts[indexPath.row];
	if (_delegate) {
		[_delegate didSelectContactWithName:contact[@"name"] phone:contact[@"phone"]];
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
