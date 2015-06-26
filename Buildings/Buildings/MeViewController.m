//
//  MeViewController.m
//  Buildings
//
//  Created by zhangbin on 6/10/15.
//  Copyright (c) 2015 zoombin. All rights reserved.
//

#import "MeViewController.h"
#import "Header.h"
#import "SettingsViewController.h"

@interface MeViewController () <UIWebViewDelegate>

@property (readwrite) UIWebView *webView;

@end

@implementation MeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = @"我的";
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settings)];
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
	_webView.delegate = self;
	[self.view addSubview:_webView];
	
	NSString *path = [NSString stringWithFormat:@"%@%@%@", WEB_HOST, @"tuijian.html", PARAMETERS];
	[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
	NSLog(@"%@", path);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)settings {
	SettingsViewController *settingsViewController = [[SettingsViewController alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:settingsViewController animated:YES];
}

- (void)reload {
	[_webView reload];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
//	if ([_webView canGoBack]) {
//		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:_webView action:@selector(goBack)];
//	} else {
//		self.navigationItem.leftBarButtonItem = nil;
//	}
}

@end
